from django import forms
from pay4memall.mall.models import *

import pay4memall.helpers as h

class DepartmentSelectForm(forms.Form):
    departments = forms.ChoiceField(label="", choices=h.fetch(Department))

class MallSearchForm(forms.Form):
    query = forms.CharField(label="")
