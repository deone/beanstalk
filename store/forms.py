from django import forms
from django.conf import settings
from store.models import *

import Image

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


class StoreModelForm(forms.ModelForm):
    class Meta:
	model = Store

    def clean_logo(self):
	logo = Image.open(self.cleaned_data["logo"])
	if logo.format not in settings.IMAGE_FORMATS:
	    raise forms.ValidationError("Incorrect image format.")
	if logo.size[0] != settings.STORE_LOGO_WIDTH:
	    raise forms.ValidationError("Logo width must be %spx." % settings.STORE_LOGO_WIDTH)
	return self.cleaned_data["logo"]

    def clean_banner(self):
	banner = Image.open(self.cleaned_data["banner"])
	if banner.format not in settings.IMAGE_FORMATS:
	    raise forms.ValidationError("Incorrect image format.")
	if banner.size[0] != settings.STORE_BANNER_WIDTH:
	    raise forms.ValidationError("Banner width must be %spx." % settings.STORE_BANNER_WIDTH)
	return self.cleaned_data["banner"]


class ProductModelForm(forms.ModelForm):
    class Meta:
	model = Store

    def clean_image(self):
	image = Image.open(self.cleaned_data["image"])
	if image.format not in settings.IMAGE_FORMATS:
	    raise forms.ValidationError("Incorrect image format.")
	if image.size[0] != image.size[1]:
	    raise forms.ValidationError("Product image must be square.")
	if image.size[0] < settings.PRODUCT_IMAGE_MIN_WIDTH:
	    raise forms.ValidationError("Product image width should not be less than %s pixels." % settings.PRODUCT_IMAGE_MIN_WIDTH)
	return self.cleaned_data["image"]
