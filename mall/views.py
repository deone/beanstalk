from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404, redirect
from django.template import RequestContext
from django.views.generic import list_detail

from mall.models import Department, Category
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

def products_in_category(request, category_name):
    category = get_object_or_404(Category, slug__iexact=category_name)
    
    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(category=category),
	    template_name = "mall/category.html",
	    extra_context = {
		"category": category,
		"department_list": h.get_departments,
		"store_list": h.get_stores,
		"mall_search_form": SearchForm,
	    }
    )

def get_categories():
    return Category.objects.all()
