from django.conf.urls.defaults import *
from django.conf import settings
from haystack.views import SearchView

from django.contrib import admin
admin.autodiscover()

import os

# These views are too coupled to the project, decouple!
import store.views
import mall.views
import order.views

urlpatterns = patterns('',
    # Mall
    (r'^$', mall.views.index),
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
