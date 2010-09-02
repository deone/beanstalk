from django.conf.urls.defaults import *
from django.conf import settings
from django.views.generic import list_detail
from django.contrib import admin
admin.autodiscover()

from haystack.views import SearchView
from store.models import Product, Store
from all_forms import *

# These views are too coupled to the project, decouple!
import store.views
import mall.views
import order.views

import os

product_info = {
    "queryset": Product.objects.order_by('?')[:8],
    "template_name": "mall/index.html",
    "extra_context": base_forms,
}

urlpatterns = patterns('',
    url(r'^$', list_detail.object_list, product_info, name="mall_home"),
    (r'^account/', include('account.urls')),
    (r'^cart/', include('mall.urls')),


    # This should read just products_in_store; using "from store.views import products_in_store"
    # I'm using get_absolute_url here instead of url names.
    (r'^(?P<store_name>\w+)/products/(?P<product_id>\d+)/$', store.views.product_detail),
    (r'^(?P<store_name>\w+)/browse/(?P<product_group_id>\d+)/$', store.views.products_in_store_product_group),
    # Order
    (r'^delivery/$', order.views.delivery),
    (r'^checkout/$', order.views.index),
    (r'^response$', order.views.process_payment_response),
    (r'^transact/$', order.views.transact),
    # Admin
    (r'^admin/', include(admin.site.urls)),
    # Search
    url(r'^search/', include('haystack.urls'), name='haystack_search'),


    url(r'^departments/(?P<department_name>[-A-za-z0-9_]+)/$', mall.views.products_in_department, name="department_home"),
    url(r'^(?P<store_name>\w+)/$', store.views.products_in_store, name="store_home"),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
			{'document_root': os.path.join(os.path.dirname(__file__), 'site_media')}),
	)
