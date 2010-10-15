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

    def add_item(self, request, product_id, item_price):
	# We would eliminate item_price when we re-write show_cart_details().
	item = []
	item.append(self.cleaned_data["quantity"])
	item.append(item_price)
	request.session[product_id] = item
	
	return request.session[product_id]

    def add_to_item(self, request, product_id, item):
	item[0] += self.cleaned_data["quantity"]
	request.session[product_id] = item

	return request.session[product_id]

    def change_item_quantity(self):
	pass

    def save(self, request, product_id):
	product = get_object_or_404(Product, pk=product_id)
	item_price = product.price

	quantity_demanded, price = self.cleaned_data["quantity"], float(item_price)
	
	cart_item = []
	cart_item.append(quantity_demanded)
	cart_item.append(price)

	item = request.session.get(product_id)

	# Save object
	if item is not None:
	    item[0] += quantity_demanded
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
