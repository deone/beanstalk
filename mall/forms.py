from django import forms
from mall.models import *

import helpers as h

class DepartmentSelectForm(forms.Form):
    departments = forms.ChoiceField(label="", choices=h.fetch(Department))

class MallSearchForm(forms.Form):
    query = forms.CharField(label="")
