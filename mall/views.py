from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404, redirect
from django.template import RequestContext

from mall.models import Department
from store.models import Product
import helpers as h
import all_forms as af
from store.forms import ShoppingCartForm

import random

DEPARTMENTS = Department.objects.all()
HEADER_DEPARTMENTS = random.sample([department for department in Department.objects.all()], 2)

def display_department(request, department_id, template="mall/department.html"):
    department = get_object_or_404(Department, pk=department_id)

    return render_to_response(template, {
	    "form_set": af.mall_forms,
	    "department": department,
	    "departments": DEPARTMENTS
    }, context_instance=RequestContext(request))

@h.json_response
def show_cart_details(request):
    if request.session._session.has_key("testcookie"):
	request.session.delete_test_cookie()

    if not request.session._session.has_key("_auth_user_id"):
	cart = request.session._session.iteritems()
    else:
	cart = h.get_cart_from_session(request.session._session)

    items_qty = items_price = 0

    for item in cart:
	items_qty += item[1][0]
	total_price = item[1][0] * item[1][1]
	items_price += total_price

    cart_object = {
	"quantity": items_qty,
	"price": items_price
    }

    return ("object", cart_object)

def preview_cart(request, template="mall/cart.html"):
    session_object = request.session._session

    # Fix this, replicated from show_cart_details.
    if not session_object.has_key("_auth_user_id"):
	cart = session_object.iteritems()
    else:
	cart = h.get_cart_from_session(session_object)

    shopping_cart = {}
    shopping_cart["order_total"] = 0
    shopping_cart["items"] = []

    # Can't we use recursion in cases like this?
    for item in cart:
	product = get_object_or_404(Product, pk=item[0])
	product.quantity = item[1][0]
	product.total_cost = item[1][0] * item[1][1]
	shopping_cart["order_total"] += product.total_cost
	product.total_cost = str(product.total_cost) + "0"
	shopping_cart["items"].append(product)

    shopping_cart["order_total"] = "N" + str(shopping_cart["order_total"]) + "0"

    return render_to_response(template, {
	    "form_set": af.mall_forms,
	    "shopping_cart": shopping_cart,
	    "departments": DEPARTMENTS
    }, context_instance=RequestContext(request))

def delete_from_cart(request, product_id):
    del request.session[product_id]
    return redirect("/cart/preview/")
