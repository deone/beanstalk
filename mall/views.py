from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404, redirect
from django.template import RequestContext
from django.views.generic import list_detail

from mall.models import Department, Category
from store.models import Product

import helpers as h

from haystack.forms import SearchForm

def index(request):
    return list_detail.object_list(
	    request,
	    queryset = Product.objects.order_by('?')[:8],
	    template_name = "mall/index.html",
	    extra_context = h.get_global_context_variables(request.session._session),
    )

def products_in_department(request, department_name):
    department = get_object_or_404(Department, slug__iexact=department_name)

    context = h.get_global_context_variables(request.session._session)
    context.update({"department": department})

    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(category__department=department),
	    template_name = "mall/department.html",
	    extra_context = context,
    )

def products_in_category(request, category_name):
    category = get_object_or_404(Category, slug__iexact=category_name)

    context = h.get_global_context_variables(request.session._session)
    context.update({"category": category})
    
    return list_detail.object_list(
	    request,
	    queryset = Product.objects.filter(category=category),
	    template_name = "mall/category.html",
	    extra_context = context,
    )

def get_categories():
    return Category.objects.all()
