from django.shortcuts import render_to_response, redirect, get_object_or_404
from django.template import RequestContext
from django.contrib.auth import authenticate, login as auth_login

import helpers as h

from account.forms import *

def index(request, template="account/index.html"):
    """ Account home, shows the user's account settings. """

    return render_to_response(template, {
    }, context_instance=RequestContext(request))

def register(request, template="account/register.html", form_class=RegisterForm):
    """ Buyers' registration page. """

    if request.method == "POST":
	form = form_class(request.POST)
	if form.is_valid():
	    username, password = form.save()
	    try:
		user = get_object_or_404(User, username=username)
		user.email_user("Welcome to Pay4Me Mall", "Test Message", "oosikoya@pay4me.com")
	    except Exception,e:
		user.delete()
	    else:
		user = authenticate(username=username, password=password)
		auth_login(request, user)

	    template = "account/feedback.html"
    else:
	form = form_class()

    context = h.get_global_context_variables(request.session._session)
    context.update({"register_form": form,})

    return render_to_response(template, context, context_instance=RequestContext(request))

def login(request, template="account/login.html", form_class=LoginForm):
    if request.method == "POST":
	form = form_class(request.POST)

	if form.login(request):
	    return redirect("/")

    else:
	form = form_class()

    context = h.get_global_context_variables(request.session._session)
    context.update({"login_form": form,})

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
