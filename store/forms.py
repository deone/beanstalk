from django import forms
from pay4memall.store.models import *

import pay4memall.helpers as h

SORT_CHOICES = (
	("best_selling", "Best Selling"),
	("low_to_high", "Price: Low to High"),
	("high_to_low", "Price: High to Low"),
	("recently_added", "Recently Added"),
)

class StoreSelectForm(forms.Form):
    stores = forms.ChoiceField(label="", choices=h.fetch(Store))

class StoreSearchForm(forms.Form):
    query = forms.CharField(label="")

class StoreSorterForm(forms.Form):
    sort_items = forms.ChoiceField(label="", choices=SORT_CHOICES)

class ShoppingCartForm(forms.Form):
    quantity = forms.IntegerField()