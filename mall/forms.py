from django import forms
from django.shortcuts import get_object_or_404
from mall.models import *
from store.models import Store, Product

import helpers as h

class StoreSelectForm(forms.Form):
    stores = forms.ChoiceField(label="", choices=h.fetch(Store))

class DepartmentSelectForm(forms.Form):
    departments = forms.ChoiceField(label="", choices=h.fetch(Department))

class MallSearchForm(forms.Form):
    query = forms.CharField(label="")

class ShoppingCartForm(forms.Form):
    quantity = forms.IntegerField(label="QTY")

    def clean(self):
	if "quantity" in self.cleaned_data:
	    if self.cleaned_data["quantity"] > 0:
		return self.cleaned_data
	    raise forms.ValidationError("Quantity cannot be zero or less")

    def save(self, request, product_id):
	item_price = get_object_or_404(Product, pk=product_id).price
	quantity, price = int(self.cleaned_data["quantity"]), float(item_price)

	cart_item = []
	cart_item.append(quantity)
	cart_item.append(price)

	item = request.session.get(product_id)
	print item

	# Save object
	if item is not None:
	    item[0] += quantity
	    request.session[product_id] = item
	else:
	    request.session[product_id] = cart_item

	return request.session[product_id]

    def update_cart(self, request, product_id):
	quantity = int(self.cleaned_data["quantity"])
	item = request.session.get(product_id)

	if item is not None:
	    item[0] = quantity
	    request.session[product_id] = item

	return request.session[product_id]
