from django import forms
from django.shortcuts import get_object_or_404
from store.models import Store, Product

class ShoppingCartForm(forms.Form):
    quantity = forms.IntegerField(label="QTY")

    def clean(self):
	if "quantity" in self.cleaned_data:
	    if self.cleaned_data["quantity"] > 0:
		return self.cleaned_data
	    raise forms.ValidationError("Quantity cannot be zero or less")

    def add_item(self, request, product_id):
	request.session[product_id] = self.cleaned_data["quantity"]
	return request.session[product_id]

    def add_to_item(self, request, product_id, item_quantity_in_cart):
	item_quantity_in_cart += self.cleaned_data["quantity"]
	request.session[product_id] = item_quantity_in_cart

	return request.session[product_id]

    def change_item_quantity(self, request, product_id):
	item = request.session.get(product_id)

	if item is not None:
	    item[0] = self.cleaned_data["quantity"]

	request.session[product_id] = item

	return request.session[product_id]
