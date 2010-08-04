from django.shortcuts import render_to_response, get_object_or_404
from django.template import Context, RequestContext
from django.contrib.sessions.models import Session

from mall.forms import *
from store.models import Product
from store.forms import *

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

@h.json_response
def display_cart(request, session_id):

    session_object = Session.objects.get(pk=session_id).get_decoded()

    if not session_object.has_key("_auth_user_id"):
	cart = session_object.iteritems()
    else:
	cart = h.get_cart_from_session(session_object)

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
	cart = h.get_cart_from_session(session_object)

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
