from django.conf.urls.defaults import *

urlpatterns = patterns('shopping_cart.views',
    url(r'^$', 'preview_cart', name='preview_cart'),
    url(r'^update/(?P<product_id>\d+)/$', 'update_cart', name='update_cart'),
    url(r'^delete/(?P<product_id>\d+)/$', 'delete_from_cart', name='delete_from_cart'),
    (r'^details/$', 'show_cart_details'),
)
