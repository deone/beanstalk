from django.conf.urls.defaults import *
from django.conf import settings

from django.contrib import admin
admin.autodiscover()

import os

# These views are too coupled to the project, decouple!
import store.views
import mall.views

urlpatterns = patterns('',
    (r'^$', include('mall.urls')),
    (r'^account/', include('account.urls')),
    (r'^checkout/$', include('payment.urls')),
    (r'^store/(?P<store_name>\w+)/$', store.views.index),
    (r'^store/(?P<store_name>\w+)/browse/(?P<product_group_id>\d+)/$', store.views.display_product_group),
    (r'^store/(?P<store_name>\w+)/product/(?P<product_id>\d+)/$', store.views.display_product),
    (r'^product/(?P<product_id>\d+)/add_to_cart/$', mall.views.add_to_cart),
    (r'^cart/details/$', mall.views.show_cart_details),
    (r'^cart/preview/$', mall.views.preview_cart),
    (r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
			{'document_root': os.path.join(os.path.dirname(__file__), 'site_media')}),
	)
