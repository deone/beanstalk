from django.core import urlresolvers
from django.http import HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response, redirect, get_object_or_404
from django.contrib.auth import authenticate, login as auth_login

import helpers as h
from traceback import print_exc

from account.forms import *

def index(request, template="account/index.html"):
    """ Account home, shows the user's account settings. """

    context = h.get_global_context_variables(request.session._session)

    return render_to_response(template, context, context_instance=RequestContext(request))

def register(request, redirect=None, template="account/register.html"):
    """ Buyers' registration page. """

    if request.method == "POST":
	form = RegisterForm(request.POST)
	if form.is_valid():
	    user = form.save(request)

	    next = request.POST.get('next', '')
	    if not next:
		if redirect:
		    next = redirect
		else:
		    next = urlresolvers.reverse('account_profile')
	    return HttpResponseRedirect(next)
    else:
	initial_data = {}
	initial_data['next'] = request.GET.get('next', '')
	form = RegisterForm(initial=initial_data)

    context = h.get_global_context_variables(request.session._session)
    context.update({"register_form": form,})

    return render_to_response(template, context, context_instance=RequestContext(request))

def login(request, template="account/login.html", form_class=LoginForm):
    # We might need to re-write this to look something
    # like `django.contrib.auth.views.login` soon.
    if request.method == "POST":
	form = form_class(request.POST)

	if form.login(request):
	    return redirect("/")

    else:
	form = form_class()

    context = h.get_global_context_variables(request.session._session)
    context.update({"form": form,})

    return render_to_response(template, context, context_instance=RequestContext(request))

def set_delivery_address(request, template="account/delivery.html", form_class=DeliveryAddressForm):
    if request.method == "POST":
	form = form_class(request.POST)
	if form.is_valid():
	    form.save(request.user)
	    return redirect("/cart/")

    else:
	form = form_class()

    context = h.get_global_context_variables(request.session._session)
    context.update({"delivery_form": form,})
    return render_to_response(template, context, context_instance=RequestContext(request))
