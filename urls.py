from django.conf.urls.defaults import *
from django.conf import settings
from django.views.generic import list_detail
from django.contrib import admin
admin.autodiscover()

from haystack.forms import SearchForm
from store.models import Product, Store
from mall.models import Department

# These views are too coupled to the project, decouple!
import mall.views
import payment.views

import os

product_info = {
    "queryset": Product.objects.order_by('?')[:8],
    "template_name": "mall/index.html",
    "extra_context": {
	"department_list": Department.objects.all, 
	"store_list": Store.objects.all,
	"mall_search_form": SearchForm,
    }
}

urlpatterns = patterns('',
    url(r'^$', list_detail.object_list, product_info, name="mall_home"),
    # Merge these payment urls in production
    url(r'^payment/$', payment.views.index, name="payment"),
    url(r'^response$', payment.views.process_payment_response, name="payment_response"),
    url(r'^search/', include('haystack.urls'), name='haystack_search'),
    (r'^account/', include('account.urls')),
    (r'^cart/', include('shopping_cart.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^departments/(?P<department_name>[-A-za-z0-9_]+)/$', mall.views.products_in_department),
    (r'^(?P<store_name>\w+)/', include('store.urls')),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
			{'document_root': os.path.join(os.path.dirname(__file__), 'site_media')}),
	)
