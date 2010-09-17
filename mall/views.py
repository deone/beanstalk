from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404, redirect
from django.template import RequestContext
from django.views.generic import list_detail

from mall.models import Department
from store.models import Product, Store

import helpers as h

from haystack.forms import SearchForm

def products_in_department(request, department_name):
    department = get_object_or_404(Department, slug__iexact=department_name)
    
    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(category__department=department),
	    template_name = "mall/department.html",
	    extra_context = {
		"department": department,
		"department_list": h.get_departments,
		"store_list": h.get_stores,
		"mall_search_form": SearchForm,
	    }
    )
