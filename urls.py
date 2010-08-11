from django.conf.urls.defaults import *
from django.conf import settings

from django.contrib import admin
admin.autodiscover()

import os

# These views are too coupled to the project, decouple!
import store.views
import mall.views
import payment.views

urlpatterns = patterns('',
    # Mall
    (r'^$', mall.views.index),
    (r'^product/(?P<product_id>\d+)/add_to_cart/$', mall.views.add_to_cart),
    (r'^cart/details/$', mall.views.show_cart_details),
    (r'^cart/preview/$', mall.views.preview_cart),
    # Account
    (r'^account/', include('account.urls')),
    # Payment
    (r'^checkout/$', payment.views.index),
    (r'^response/$', payment.views.process_payment_response),
    # Store
    (r'^store/(?P<store_name>\w+)/$', store.views.index),
    (r'^store/(?P<store_name>\w+)/browse/(?P<product_group_id>\d+)/$', store.views.display_product_group),
    (r'^store/(?P<store_name>\w+)/product/(?P<product_id>\d+)/$', store.views.display_product),
    # Admin
    (r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
			{'document_root': os.path.join(os.path.dirname(__file__), 'site_media')}),
	)
