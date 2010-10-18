from django.shortcuts import redirect, render_to_response, get_object_or_404
from django.template import RequestContext
from haystack.forms import SearchForm

from store.models import Product
from shopping_cart.forms import ShoppingCartForm

import helpers as h

def get_cart(request):
    if not request.user:
	return request.session._session.iteritems()
    else:
	return h.get_cart_from_session(request.session._session)

@h.json_response
def show_cart_details(request):
    if request.session._session.has_key("testcookie"):
	request.session.delete_test_cookie()

    cart = get_cart(request)

    items_qty = items_price = 0

    for item in cart:
	items_qty += item[1]

    cart_object = {
	"quantity": items_qty,
    }

    return ("object", cart_object)

def create_shopping_cart(cart):
    shopping_cart = {}
    shopping_cart["order_total"] = 0
    shopping_cart["items"] = []

    for item in cart:
	product = get_object_or_404(Product, pk=item[0])
	product.qty_edit_form = ShoppingCartForm(initial={"product_id": product.id, "quantity": item[1][0]})
	product.total_cost = item[1][0] * item[1][1]
	shopping_cart["order_total"] += product.total_cost
	product.total_cost = str(product.total_cost) + "0"
	shopping_cart["items"].append(product)

    shopping_cart["order_total"] = str(shopping_cart["order_total"])

    return shopping_cart

def preview_cart(request, template="shopping_cart/index.html"):
    context = get_context_variables(request)
    return render_to_response(template, context, context_instance=RequestContext(request))

def update_cart(request, product_id, template="shopping_cart/index.html", form_class=ShoppingCartForm):
    product = Product.objects.get(pk=product_id)
    context = get_context_variables(request)

    if request.method == "POST":
	form = form_class(request.POST)
	if form.is_valid():
	    quantity = int(request.POST["quantity"])
	    if not product.is_quantity_available(quantity):
		form = form_class()
		context.update({"feedback": "Insufficient Stock"})
	    else:
		form.change_item_quantity(request, product_id)
		context.update({"feedback": "Item quantity changed."})

    else:
	form = form_class()

    return render_to_response(template, context, context_instance=RequestContext(request))

def delete_from_cart(request, product_id, template="shopping_cart/index.html"):
    del request.session[product_id]
    context = get_context_variables(request)
    context.update({"feedback": "Item deleted"})
    return render_to_response(template, context, context_instance=RequestContext(request))

def get_context_variables(request):
    shopping_cart = create_shopping_cart(get_cart(request))
    return {
	"department_list": h.get_departments(),
	"store_list": h.get_stores(),
	"shopping_cart": shopping_cart,
	"mall_search_form": SearchForm(),
    }
