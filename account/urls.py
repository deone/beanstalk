from django.conf.urls.defaults import *

urlpatterns = patterns('account.views',
    url(r'^$', 'index', name='account_profile'),
    url(r'^register/$', 'register', name='account_register'),
    url(r'^set_delivery/$', 'set_delivery_address', name='delivery_form'),
    url(r'^login/$', 'login', name='account_login'),
)

urlpatterns += patterns('django.contrib.auth.views',
    # Look out for extra_context implementation in later versions of django.
    # This is why we cannot use `django.contrib.auth.views.login`.
    #url(r'^login/$', 'login', {'template_name': 'account/login.html', 'extra_context': {}}, 'account_login'),
    url(r'^password_change/$', 'password_change', 
	{'template_name': 'registration/password_change_form.html'}, 'auth_password_change'),
    url(r'^password_change/done/$', 'password_change_done', 
	{'template_name': 'registration/password_change_done.html'}, 'auth_password_change_done'),
    url(r'^logout/$', 'logout', {'next_page': '/'}, name='account_logout'),
)
