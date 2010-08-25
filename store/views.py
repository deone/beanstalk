from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.http import Http404
from django.template import RequestContext
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.conf import settings
from django.views.generic import list_detail

from store.models import *
from store.forms import ShoppingCartForm, StoreSorterForm

import helpers as h
from all_forms import base_forms

def get_store(store_account_name):
    return get_object_or_404(Store, account_name__iexact=store_account_name)

def get_common_context(store):
    context = {"store": store}
    context.update(base_forms)
    return context

def products_in_store(request, store_name):
    store = get_store(store_name)

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(product_group__store=store).order_by("-date_added"),
	    template_name = "store/index.html",
	    extra_context = get_common_context(store)
    )

def product_detail(request, store_name, product_id):
    store = get_store(store_name)

    if request.method == "POST":
	form = ShoppingCartForm(request.POST)
	if form.is_valid():
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
    else:
	form = ShoppingCartForm()

    context = get_common_context(store)
    context.update({"shopping_cart_form": form})

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
    context = get_common_context(store)
    context.update(
	    {
		"product_list_length": product_group.product_set.count(),
		"product_group": product_group,
		"store_sorter_form": StoreSorterForm,
	    }
    )

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(product_group=product_group).order_by("-date_added"),
	    template_name = "store/product_group.html",
	    extra_context = context,
	    paginate_by = 8,
    )
