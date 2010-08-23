from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.http import Http404
from django.template import RequestContext
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.conf import settings

from store.models import *
from store.forms import ShoppingCartForm

import helpers as h
import all_forms as af

# We need to remove redundancies in these views.

def index(request, store_name, template="store/index.html"):
    store = get_object_or_404(Store, account_name=store_name)

    products = [
	product for product in Product.objects.all().order_by("-date_added") if product.product_group_id in 
	[
	    product_group.id for product_group in ProductGroup.objects.filter(store=store)
	]
    ]

    product_groups = store.productgroup_set.all()

    return render_to_response(template, {
	    "store": store,
	    "products": products[:8],
	    "product_groups": store.productgroup_set.all(),
	    "form_set": af.store_forms,
    }, context_instance=RequestContext(request))

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

def display_product(request, store_name, product_id, template="store/product.html", form_class=ShoppingCartForm):
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

    product = get_object_or_404(Product, pk=product_id)
    store = get_object_or_404(Store, pk=product.product_group.store_id)
    af.store_forms["shopping_cart_form"] = form

    return render_to_response(template, {
	    "store": store,
	    "product": product,
	    "product_groups": store.productgroup_set.all(),
	    "form_set": af.store_forms,
    }, context_instance=RequestContext(request))
