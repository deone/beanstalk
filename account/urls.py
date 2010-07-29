from django.conf.urls.defaults import *

urlpatterns = patterns('account.views',
    (r'^$', 'index'),
    (r'^register/$', 'register'),
    (r'^login/$', 'login'),
    (r'^logout/$', 'logout'),
)
