from django.shortcuts import render_to_response, get_object_or_404, redirect
from django.template import Context, RequestContext
from django.contrib.sessions.models import Session
from django.conf import settings
from django.template.loader import get_template

from mall.models import *
from mall.forms import *
from store.models import Product
from store.forms import *

import base64
import urllib2
from BeautifulSoup import BeautifulStoneSoup

import helpers as h
import random

# Fix this - DRY!
class FormSet:
    store_select_form = StoreSelectForm
    dept_select_form = DepartmentSelectForm
    mall_search_form = MallSearchForm

def index(request, template="mall/index.html", store_select_form=StoreSelectForm, form_set=FormSet):

    products = random.sample([product for product in Product.objects.all()], 4)

    return render_to_response(template, {
	    "form_set": form_set(),
	    "products": products,
    }, context_instance=RequestContext(request))

@h.json_response
def add_to_cart(request, product_id):
    quantity = request.POST["quantity"]
    price = get_object_or_404(Product, pk=product_id).price

    cart_item = []
    cart_item.append(int(quantity))
    cart_item.append(float(price))

    try:
	product_detail = request.session[product_id]
	new_quantity = product_detail[0] + int(quantity)
	product_detail[0] = new_quantity
	request.session[product_id] = product_detail
    except KeyError:
	request.session[product_id] = cart_item

    return ("boolean", True)

def get_cart_from_session(session_object):
    cart = []
	
    for item in session_object.iteritems():
	if isinstance(item[0], unicode):
	    cart.append(item)
    return cart

@h.json_response
def display_cart(request, session_id):

    session_object = Session.objects.get(pk=session_id).get_decoded()

    if not session_object.has_key("_auth_user_id"):
	cart = session_object.iteritems()
    else:
	cart = get_cart_from_session(session_object)

    item_qty = item_price = 0

    for item in cart:
	item_qty += item[1][0]
	total_price = item[1][0] * item[1][1]
	item_price += total_price

    cart_object = {
	"items_quantity": item_qty,
	"items_price": item_price
    }

    return ("object", cart_object)

def preview_cart(request, session_id, template="mall/cart.html", form_set=FormSet):
    session_object = Session.objects.get(pk=session_id).get_decoded()

    # Fix this, replicated from display_cart
    if not session_object.has_key("_auth_user_id"):
	cart = session_object.iteritems()
    else:
	cart = get_cart_from_session(session_object)

    shopping_cart = {}
    shopping_cart["order_total"] = 0
    shopping_cart["items"] = []

    for item in cart:
	product = get_object_or_404(Product, pk=item[0])
	product.quantity = item[1][0]
	product.total_cost = item[1][0] * item[1][1]
	shopping_cart["order_total"] += product.total_cost
	shopping_cart["items"].append(product)

    shopping_cart["order_total"] = "N" + str(shopping_cart["order_total"]) + "0"

    return render_to_response(template, {
	    "form_set": form_set(),
	    "shopping_cart": shopping_cart,
    }, context_instance=RequestContext(request))



@h.json_response
def checkout(request):
    """
	* Generate transaction_id.
	* Insert transaction_id and total_amount into transaction table.
	* Insert each item into ordered_item table.
	* Make payment through pay4me API.
	* Receive and process response.
    """
    session_id = request.POST["session_id"]
    user_id = request.POST["user_id"]

    # Grab cart items from session
    session_object = Session.objects.get(pk=session_id).get_decoded()
    cart = get_cart_from_session(session_object)

    # Create entry in transaction table
    total = reduce(h.add, [item[1][0] * item[1][1] for item in cart])
    transaction = Transaction.objects.create(transaction_id=h.generate_id(), amount=str(total))

    # Create ordered item entries
    user = User.objects.get(pk=user_id)

    for item in cart:
	product = Product.objects.get(pk=item[0])
	OrderedItem.objects.create(transaction=transaction, user=user, \
		product=product, quantity=item[1][0], cost=str(item[1][0] * item[1][1]))

    auth_token = base64.b64encode(settings.MERCHANT_CODE + ':' + settings.MERCHANT_KEY)
    t = get_template("store/request.xml")

    data = t.render(Context({
	'cart_id': h.generate_id(),
	'merchant_service_id': settings.MERCHANT_SERVICE_ID,
	'txn_no': h.generate_id(),
	'order_total': total
    }))

    req = urllib2.Request(settings.PAYMENT_URL, data)
    req.add_header("Authorization", "Basic %s" % auth_token)
    req.add_header("Content-type", "application/xml; charset=utf-8")
    req.add_header("Accept", "application/xml; charset=utf-8")

    response = urllib2.urlopen(req)
    soup = BeautifulStoneSoup(response.read())
    url = soup.find("redirect-url").string

    request.session.flush()

    return ("string", url)
