from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.views.generic import list_detail

from store.models import *
from mall.models import Department
from store.forms import StoreSorterForm
from shopping_cart.forms import ShoppingCartForm

import helpers as h

def get_store(store_slug):
    return get_object_or_404(Store, slug__iexact=store_slug)

def products_in_store(request, store_name):
    context = h.get_global_context_variables(request.session._session)
    store = get_store(store_name)
    context.update({"store": store})

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(product_group__store=store).order_by("-date_added"),
	    template_name = "store/index.html",
	    extra_context = context,
    )

def product_detail(request, store_name, product_id, form_class=ShoppingCartForm):
    product = Product.objects.get(pk=product_id)

    if request.method == "POST":
	form = form_class(request.POST)
	if form.is_valid():
	    product_quantity_in_cart = request.session.get(product_id)
	    if product_quantity_in_cart is None:
		quantity = int(request.POST["quantity"])
		if not product.is_quantity_available(quantity):
		    form = form_class()
		    feedback = "Insufficient Stock."
		else:
		    form.add_item(request, product_id)
		    feedback = "Item added to cart."
	    else:
		quantity = product_quantity_in_cart + int(request.POST["quantity"])
		if not product.is_quantity_available(quantity):
		    form = form_class()
		    feedback = "Insufficient Stock"
		else:
		    form.add_to_item(request, product_id, product_quantity_in_cart)
		    feedback = "Item updated in cart."

    else:
	form = form_class()
	feedback = ""

    store = get_store(store_name)
    context = h.get_global_context_variables(request.session._session)
    context.update({
	    "shopping_cart_form": form, 
	    "store": store,
	    "feedback": feedback,
	})

    return list_detail.object_detail(
	    request,
	    queryset = Product.objects.all(),
	    template_name = "store/product.html",
	    template_object_name = "product",
	    object_id = product_id,
	    extra_context = context,
    )

def products_in_store_product_group(request, store_name, product_group_id):
    store = get_store(store_name)
    product_group = get_object_or_404(ProductGroup, pk=product_group_id)

    context = h.get_global_context_variables(request.session._session)
    context.update({
		"product_list_length": product_group.product_set.count(),
		"product_group": product_group,
		"store_sorter_form": StoreSorterForm,
		"store": store,
	    })

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(product_group=product_group).order_by("-date_added"),
	    template_name = "store/product_group.html",
	    extra_context = context,
	    paginate_by = 8,
    )
