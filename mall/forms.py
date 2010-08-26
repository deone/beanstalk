from django import forms
from mall.models import *
from store.models import Store

import helpers as h

class StoreSelectForm(forms.Form):
    stores = forms.ChoiceField(label="", choices=h.fetch(Store))

class DepartmentSelectForm(forms.Form):
    departments = forms.ChoiceField(label="", choices=h.fetch(Department))

class MallSearchForm(forms.Form):
    query = forms.CharField(label="")

class ShoppingCartEditForm(forms.Form):
    quantity = forms.IntegerField(label="")
