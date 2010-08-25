from django.conf.urls.defaults import *
from django.conf import settings
from django.views.generic import list_detail
from django.contrib import admin
from django.shortcuts import get_list_or_404
admin.autodiscover()

from haystack.views import SearchView
from haystack.forms import SearchForm
from store.models import Product, Store
from mall.forms import *
# These views are too coupled to the project, decouple!
import store.views
import mall.views
import order.views

import os
import random

product_info = {
    "queryset": Product.objects.order_by('?')[:8],
    "template_name": "mall/index.html",
    "extra_context": {
	"mall_search_form": SearchForm,
	"store_select_form": StoreSelectForm,
	"department_select_form": DepartmentSelectForm,
    }
}

urlpatterns = patterns('',
    # Mall
    (r'^$', list_detail.object_list, product_info),
    (r'^departments/(?P<department_id>\d+)/$', mall.views.display_department),
    (r'^cart/details/$', mall.views.show_cart_details),
    (r'^cart/preview/$', mall.views.preview_cart),
    (r'^cart/delete/(?P<product_id>\d+)/$', mall.views.delete_from_cart),
    # Account
    (r'^account/', include('account.urls')),
    # Order
    (r'^delivery/$', order.views.delivery),
    (r'^checkout/$', order.views.index),
    (r'^response$', order.views.process_payment_response),
    (r'^transact/$', order.views.transact),
    # Store
    (r'^store/(?P<store_name>\w+)/$', store.views.index),
    (r'^store/(?P<store_name>\w+)/browse/(?P<product_group_id>\d+)/$', store.views.display_product_group),
    (r'^store/(?P<store_name>\w+)/product/(?P<product_id>\d+)/$', store.views.display_product),
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
