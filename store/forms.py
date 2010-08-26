from django import forms
from store.models import *

import helpers as h

SORT_CHOICES = (
	("best_selling", "Best Selling"),
	("low_to_high", "Price: Low to High"),
	("high_to_low", "Price: High to Low"),
	("recently_added", "Recently Added"),
)

class StoreSearchForm(forms.Form):
    query = forms.CharField(label="")

class StoreSorterForm(forms.Form):
    sort_items = forms.ChoiceField(label="", choices=SORT_CHOICES)

class ShoppingCartForm(forms.Form):
    quantity = forms.IntegerField(label="QTY")

    def clean(self):
	if "quantity" in self.cleaned_data:
	    if self.cleaned_data["quantity"] > 0:
		return self.cleaned_data
	    raise forms.ValidationError("Quantity cannot be zero or less")

class ProductGroupModelForm(forms.ModelForm):
    class Meta:
	model = ProductGroup
	exclude = ("store",)
