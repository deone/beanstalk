from django.conf.urls.defaults import *

urlpatterns = patterns('django.views.generic.simple',
	url(r'^$', 'direct_to_template', {'template': 'about/index.html'}),
	url(r'^contact/$', 'direct_to_template', {'template': 'about/contact.html'}),
	url(r'^delivery_policy/$', 'direct_to_template', {'template': 'about/delivery_policy.html'}),
	url(r'^privacy_policy/$', 'direct_to_template', {'template': 'about/privacy_policy.html'}),
	url(r'^terms/$', 'direct_to_template', {'template': 'about/terms.html'}),
	url(r'^how_to_pay/$', 'direct_to_template', {'template': 'about/how_to_pay.html'}),
	url(r'^faq/$', 'direct_to_template', {'template': 'about/faq.html'}),
)
