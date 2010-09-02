from django.conf.urls.defaults import *

urlpatterns = patterns('store.views',
    url(r'^products/(?P<product_id>\d+)/$', 'product_detail', name='product_home'),
    url(r'^browse/(?P<product_group_id>\d+)/$', 'products_in_store_product_group', name='product_group_home'),
    url(r'^$', 'products_in_store', name='store_home'),
)
