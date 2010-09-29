from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.views.generic import list_detail

from store.models import *
from mall.models import Department
from store.forms import StoreSorterForm
from shopping_cart.forms import ShoppingCartForm

from haystack.forms import SearchForm
import helpers as h

def get_store(store_account_name):
    return get_object_or_404(Store, account_name__iexact=store_account_name)

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

def add_item_to_cart(request, product_id, quantity, feedback="", action="add"):
    """ Increment quantity of an existing item, or add a new item to cart. 
	Returns feedback to be displayed in template. """

    product = Product.objects.get(pk=product_id)

    if not product.is_quantity_available(quantity):
	form = ShoppingCartForm()
	return form, {"feedback": "Insufficient Stock."}
    else:
	form = ShoppingCartForm(request.POST)
	if form.is_valid():
	    if action == "update":
		form.update_cart(request, product_id)
	    else:
		form.save(request, product_id)
	return form, {"feedback": feedback}

def product_detail(request, store_name, product_id):
    store = get_store(store_name)
    context = get_common_context(store)

    if request.method == "POST":
	quantity = int(request.POST["quantity"])
	try:
	    product_demanded = request.session[product_id]
	except KeyError:
	    form, feedback = add_item_to_cart(request, product_id, quantity, feedback="Item added to cart")
	else:
	    total_quantity = product_demanded[0] + quantity
	    form, feedback = add_item_to_cart(request, product_id, total_quantity, feedback="Item updated in cart.")
	context.update(feedback)
    else:
	form = ShoppingCartForm(initial={"product_id": product_id})

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
