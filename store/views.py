from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.http import Http404
from django.template import RequestContext
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.conf import settings
from django.views.generic import list_detail

from store.models import *
from store.forms import ShoppingCartForm

import helpers as h
from all_forms import *

def get_store(store_account_name):
    return get_object_or_404(Store, account_name__iexact=store_account_name)

def products_in_store(request, store_name):
    store = get_store(store_name)
    extra_context = {"store": store}
    extra_context.update(base_forms)

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(product_group__store=store).order_by("-date_added"),
	    template_name = "store/index.html",
	    extra_context = extra_context
    )

def product_detail(request, store_name, product_id):
    store = get_store(store_name)
    extra_context = {"store": store}
    extra_context.update(base_forms)

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

    extra_context.update({"shopping_cart_form": form})

    return list_detail.object_detail(
	    request,
	    queryset = Product.objects.all(),
	    template_name = "store/product.html",
	    template_object_name = "product",
	    object_id = product_id,
	    extra_context = extra_context
    )

def display_product_group(request, store_name, product_group_id, template="store/product_group.html"):
    product_group = get_object_or_404(ProductGroup, pk=product_group_id)
    product_list = product_group.product_set.all()
    product_list_length = product_list.count()
    paginator = Paginator(product_list, settings.RESULTS_PER_PAGE)

    try:
	page = int(request.GET.get("page", "1"))
    except ValueError:
	page = 1

    try:
	products = paginator.page(page)
    except (EmptyPage, InvalidPage):
	products = paginator.page(paginator.num_pages)

    if not products:
	raise Http404

    store = get_object_or_404(Store, pk=product_group.store_id)

    return render_to_response(template, {
	    "store": store,
	    "product_group": product_group,
	    "products": products,
	    "product_list_length": product_list_length,
	    "form_set": af.store_forms,
    }, context_instance=RequestContext(request))
