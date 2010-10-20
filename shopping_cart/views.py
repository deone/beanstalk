from django.shortcuts import redirect, render_to_response, get_object_or_404
from django.template import RequestContext
from haystack.forms import SearchForm

from store.models import Product
from shopping_cart.forms import ShoppingCartForm

import helpers as h

def create_shopping_cart(cart_object):
    shopping_cart = {}
    shopping_cart["sub_total"] = 0
    shopping_cart["delivery_total"] = 0
    shopping_cart["order_total"] = 0
    shopping_cart["items"] = []

    for item in cart_object:
	product = get_object_or_404(Product, pk=item[0])
	# Create quantity edit form for each product.
	product.qty_edit_form = ShoppingCartForm(initial={"product_id": product.id, "quantity": item[1]})
	product.total_cost = item[1] * product.price
	product.total_delivery_cost = item[1] * product.delivery_charge

	shopping_cart["sub_total"] += product.total_cost
	shopping_cart["delivery_total"] += product.total_delivery_cost

	shopping_cart["items"].append(product)

    shopping_cart["order_total"] = shopping_cart["sub_total"] + shopping_cart["delivery_total"]

    return shopping_cart

def preview_cart(request, template="shopping_cart/index.html"):
    cart = h.get_cart(request.session._session)
    shopping_cart = create_shopping_cart(cart)
    context = h.get_global_context_variables(request.session._session)
    context.update({"shopping_cart": shopping_cart})
    return render_to_response(template, context, context_instance=RequestContext(request))

def update_cart(request, product_id, template="shopping_cart/index.html", form_class=ShoppingCartForm):
    product = Product.objects.get(pk=product_id)

    if request.method == "POST":
	form = form_class(request.POST)
	if form.is_valid():
	    quantity = int(request.POST["quantity"])
	    if not product.is_quantity_available(quantity):
		form = form_class()
		feedback = "Insufficient Stock."
	    else:
		form.change_item_quantity(request, product_id)
		feedback = "Item quantity changed."

    else:
	form = form_class()
	feedback = ""

    cart = h.get_cart(request.session._session)
    shopping_cart = create_shopping_cart(cart)

    context = h.get_global_context_variables(request.session._session)
    context.update({
		"shopping_cart": shopping_cart,
		"feedback": feedback,
	    })

    return render_to_response(template, context, context_instance=RequestContext(request))

def delete_from_cart(request, product_id, template="shopping_cart/index.html"):
    del request.session[product_id]
    context = get_global_context_variables(request.session._session)
    context.update({"feedback": "Item deleted from cart."})
    return render_to_response(template, context, context_instance=RequestContext(request))
