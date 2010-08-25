from django.conf.urls.defaults import *
from django.conf import settings
from django.views.generic import list_detail
from django.contrib import admin
from django.shortcuts import get_list_or_404
admin.autodiscover()

from haystack.views import SearchView
from store.models import Product, Store
from all_forms import *

# These views are too coupled to the project, decouple!
import store.views
import mall.views
import order.views

import os
import random

product_info = {
    "queryset": Product.objects.order_by('?')[:8],
    "template_name": "mall/index.html",
    "extra_context": base_forms,
}

urlpatterns = patterns('',
    # Mall
    url(r'^$', list_detail.object_list, product_info, name="mall_home"),
    # This should read just products_in_store; using "from store.views import products_in_store"
    url(r'^store/(?P<store_name>\w+)/$', store.views.products_in_store, name="store_home"),
    # I'm using get_absolute_url here instead of url names.
    (r'^store/(?P<store_name>\w+)/product/(?P<product_id>\d+)/$', store.views.product_detail),
    (r'^store/(?P<store_name>\w+)/browse/(?P<product_group_id>\d+)/$', store.views.products_in_store_product_group),


    (r'^departments/(?P<department_id>\d+)/$', mall.views.display_department),
    (r'^cart/details/$', mall.views.show_cart_details),
    (r'^cart/preview/$', mall.views.preview_cart),
    (r'^cart/delete/(?P<product_id>\d+)/$', mall.views.delete_from_cart),
    # Store
    # Account
    (r'^account/', include('account.urls')),
    # Order
    (r'^delivery/$', order.views.delivery),
    (r'^checkout/$', order.views.index),
    (r'^response$', order.views.process_payment_response),
    (r'^transact/$', order.views.transact),
    # Admin
    (r'^admin/', include(admin.site.urls)),
    # Search
    url(r'^search/', include('haystack.urls'), name='haystack_search'),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
			{'document_root': os.path.join(os.path.dirname(__file__), 'site_media')}),
	)
