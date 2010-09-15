from django.conf.urls.defaults import *

urlpatterns = patterns('store.views',
    (r'^products/(?P<product_id>\d+)/$', 'product_detail'),
    (r'^browse/(?P<product_group_id>\d+)/$', 'products_in_store_product_group'),
    (r'^$', 'products_in_store'),
)
