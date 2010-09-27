from django import forms
from django.shortcuts import get_object_or_404
from store.models import Store, Product

class ShoppingCartForm(forms.Form):
    product_id = forms.IntegerField(widget=forms.HiddenInput)
    quantity = forms.IntegerField(label="QTY")

    def clean(self):
	product = get_object_or_404(Product, pk=self.cleaned_data["product_id"])

	if "quantity" in self.cleaned_data:
	    if not product.is_quantity_available(self.cleaned_data["quantity"]):
		raise forms.ValidationError("Insufficient Stock. Please check back later.")

	    if self.cleaned_data["quantity"] > 0:
		return self.cleaned_data
	    raise forms.ValidationError("Quantity cannot be zero or less")

    def save(self, request, product_id):
	product = get_object_or_404(Product, pk=product_id)
	item_price = product.price
	stock_quantity = product.quantity

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
