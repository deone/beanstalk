from django.shortcuts import render_to_response, get_object_or_404, redirect
from django.template import Context, RequestContext
from django.contrib.sessions.models import Session
from django.conf import settings
from django.template.loader import get_template

from pay4memall.mall.models import *
from pay4memall.store.models import Product
from pay4memall.mall.forms import *
from pay4memall.store.forms import *

import base64
import urllib2
from BeautifulSoup import BeautifulStoneSoup

# Fix this - DRY!
class FormSet:
    store_select_form = StoreSelectForm
    dept_select_form = DepartmentSelectForm
    mall_search_form = MallSearchForm

def index(request, template="mall/index.html", store_select_form=StoreSelectForm, form_set=FormSet):

    return render_to_response(template, {
	    "form_set": form_set(),
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

def checkout(request):
    auth_token = base64.b64encode(settings.MERCHANT_CODE + ':' + settings.MERCHANT_KEY)
    t = get_template("store/request.xml")

    data = t.render(Context({
	'merchant_service_id': settings.MERCHANT_SERVICE_ID,
    }))

    req = urllib2.Request(settings.PAYMENT_URL, data)
    req.add_header("Authorization", "Basic %s" % auth_token)
    req.add_header("Content-type", "application/xml; charset=utf-8")
    req.add_header("Accept", "application/xml; charset=utf-8")

    response = urllib2.urlopen(req)
    soup = BeautifulStoneSoup(response.read())
    url = soup.find("redirect-url").string
    return redirect(url)
