from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.http import Http404
from django.template import RequestContext
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.conf import settings
from django.contrib.sessions.models import Session

from pay4memall.store.models import *
from pay4memall.mall.forms import *
from pay4memall.store.forms import *

import pay4memall.helpers as h

# We need to remove redundancies in these views.

# Fix this - DRY!
class FormSet:
    store_select_form = StoreSelectForm
    dept_select_form = DepartmentSelectForm
    mall_search_form = MallSearchForm
    store_search_form = StoreSearchForm
    store_sorter_form = StoreSorterForm
    shopping_cart_form = ShoppingCartForm

def index(request, store_name, template="store/index.html", form_set=FormSet):

    store = get_object_or_404(Store, account_name=store_name)

    products = [
	product for product in Product.objects.all().order_by("-date_added") if product.product_group_id in 
	[
	    product_group.id for product_group in ProductGroup.objects.filter(store=store)
	]
    ]
    
    return render_to_response(template, {
	    "store": store,
	    "products": products[:5],
	    "form_set": form_set(),
    }, context_instance=RequestContext(request))

def display_product_group(request, store_name, product_group_id, template="store/product_group.html", form_set=FormSet):

    store = get_object_or_404(Store, account_name=store_name)
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

    return render_to_response(template, {
	    "store": store,
	    "product_group": product_group,
	    "products": products,
	    "product_list_length": product_list_length,
	    "form_set": form_set(),
    }, context_instance=RequestContext(request))

def display_product(request, store_name, product_id, template="store/product.html", form_set=FormSet):

    store = get_object_or_404(Store, account_name=store_name)
    product = get_object_or_404(Product, pk=product_id)

    return render_to_response(template, {
	    "store": store,
	    "product": product,
	    "form_set": form_set(),
    }, context_instance=RequestContext(request))
