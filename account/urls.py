from django.conf.urls.defaults import *

urlpatterns = patterns('account.views',
    url(r'^$', 'index', name='account_profile'),
    url(r'^register/$', 'register', name='account_register'),
    url(r'^set_delivery/$', 'set_delivery_address', name='delivery_form'),
    url(r'^login/$', 'login', name='account_login'),
    #url(r'^change_password/$', 'change_password', name='change_password'),
)

urlpatterns += patterns('django.contrib.auth.views',
    url(r'^logout/$', 'logout', {'next_page': '/'}, name='account_logout'),
)
