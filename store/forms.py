from django import forms
from store.models import *

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

class ProductGroupModelForm(forms.ModelForm):
    class Meta:
	model = ProductGroup
	exclude = ("store",)
