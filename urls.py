from django.conf.urls.defaults import *
from django.conf import settings
from django.contrib import admin
admin.autodiscover()

# These views are too coupled to the project, decouple!
import mall.views
import payment.views

import os

urlpatterns = patterns('',
    url(r'^$', mall.views.index, name="mall_home"),
    # Merge these payment urls in production
    url(r'^payment/$', payment.views.index, name="payment"),
    url(r'^response$', payment.views.process_payment_response, name="payment_response"),
    url(r'^search/', include('haystack.urls'), name='haystack_search'),
    (r'^account/', include('account.urls')),
    (r'^about/', include('about.urls')),
    (r'^cart/', include('shopping_cart.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^departments/(?P<department_name>[-A-za-z0-9_]+)/$', mall.views.products_in_department),
    (r'^categories/(?P<category_name>[-A-za-z0-9_]+)/$', mall.views.products_in_category),
    (r'^(?P<store_name>[-A-za-z0-9_]+)/', include('store.urls')),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
			{'document_root': os.path.join(os.path.dirname(__file__), 'site_media')}),
	)
