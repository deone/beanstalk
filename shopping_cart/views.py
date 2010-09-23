from django.shortcuts import redirect, render_to_response, get_object_or_404
from django.template import RequestContext
from haystack.forms import SearchForm

from store.models import Product
from shopping_cart.forms import ShoppingCartForm

import helpers as h

@h.json_response
def show_cart_details(request):
    if request.session._session.has_key("testcookie"):
	request.session.delete_test_cookie()

    if not request.user:
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

def preview_cart(request, template="shopping_cart/index.html"):
    session_object = request.session._session

    # Fix this, replicated from show_cart_details.
    if not request.user:
	cart = session_object.iteritems()
    else:
	cart = h.get_cart_from_session(session_object)

    shopping_cart = {}
    shopping_cart["order_total"] = 0
    shopping_cart["items"] = []

    # Can't we use recursion in cases like this?
    for item in cart:
	product = get_object_or_404(Product, pk=item[0])
	product.qty_edit_form = ShoppingCartForm(initial={"product_id": product.id, "quantity": item[1][0]})
	product.total_cost = item[1][0] * item[1][1]
	shopping_cart["order_total"] += product.total_cost
	product.total_cost = str(product.total_cost) + "0"
	shopping_cart["items"].append(product)

    shopping_cart["order_total"] = str(shopping_cart["order_total"])

    return render_to_response(template, {
		"department_list": h.get_departments(),
		"store_list": h.get_stores(),
		"shopping_cart": shopping_cart,
		"mall_search_form": SearchForm(),
	    }, context_instance=RequestContext(request))

def update_cart(request, product_id):
    if request.method == "POST":
	form = ShoppingCartForm(request.POST)
	if form.is_valid():
	    form.update_cart(request, product_id)
    else:
	pass
    
    return redirect("/cart/")

def delete_from_cart(request, product_id):
    del request.session[product_id]
    return redirect("/cart/")
