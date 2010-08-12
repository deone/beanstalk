from django.conf.urls.defaults import *

urlpatterns = patterns('order.views',
	(r'^$', 'index'),
)
