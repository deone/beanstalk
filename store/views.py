from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.views.generic import list_detail

from store.models import *
from mall.models import Department
from store.forms import StoreSorterForm
from shopping_cart.forms import ShoppingCartForm

from haystack.forms import SearchForm
import helpers as h

def get_store(store_slug):
    return get_object_or_404(Store, slug__iexact=store_slug)

def get_common_context(store):
    return {
	"store": store,
	"store_list": h.get_stores,
	"department_list": h.get_departments,
	"mall_search_form": SearchForm,
    }

def products_in_store(request, store_name):
    store = get_store(store_name)

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(product_group__store=store).order_by("-date_added"),
	    template_name = "store/index.html",
	    extra_context = get_common_context(store)
    )

def product_detail(request, store_name, product_id, form_class=ShoppingCartForm):
    store = get_store(store_name)
    context = get_common_context(store)
    product = Product.objects.get(pk=product_id)

    if request.method == "POST":
	form = form_class(request.POST)
	if form.is_valid():
	    try:
		# Check if product has been previously added to cart
		product_demanded = request.session[product_id]
	    except KeyError:
		quantity = int(request.POST["quantity"])
		if not product.is_quantity_available(quantity):
		    form = form_class()
		    context.update({"feedback": "Insufficient Stock"})
		else:
		    form.add_item(request, product_id, float(product.price))
		    context.update({"feedback": "Item added to cart."})
	    else:
		quantity = product_demanded[0] + int(request.POST["quantity"])
		if not product.is_quantity_available(quantity):
		    form = form_class()
		    context.update({"feedback": "Insufficient Stock"})
		else:
		    form.add_to_item(request, product_id, product_demanded)
		    context.update({"feedback": "Item updated in cart."})
    else:
	form = form_class()

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
    context.update({
		"product_list_length": product_group.product_set.count(),
		"product_group": product_group,
		"store_sorter_form": StoreSorterForm,
		})

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(product_group=product_group).order_by("-date_added"),
	    template_name = "store/product_group.html",
	    extra_context = context,
	    paginate_by = 8,
    )
