from django.shortcuts import render_to_response, redirect
from django.template import RequestContext
from django.contrib.auth import authenticate, login as auth_login

import all_forms as af
from account.forms import *

def index(request, template="account/index.html"):
    """ Account home, shows the user's account settings. """

    return render_to_response(template, {
    }, context_instance=RequestContext(request))

def register(request, template="account/register.html", form_class=RegisterForm):
    """ Buyers' registration page. """

    try:
	redirect_to = request.GET.get("redirect_to")
    except KeyError:
	pass

    if request.method == "POST":
	form = form_class(request.POST)

	if form.is_valid():
	    username, password = form.save()
	    user = authenticate(username=username, password=password)
	    auth_login(request, user)
	    return redirect(redirect_to)
    else:
	form = form_class()
	
    return render_to_response(template, {
		"redirect_to": redirect_to,
		"register_form": form,
		"form_set": af.mall_forms,
	    }, context_instance=RequestContext(request))

def login(request, template="account/login.html", form_class=LoginForm):
    try:
	redirect_to = request.GET.get("redirect_to")
    except KeyError:
	pass

    if request.method == "POST":
	form = form_class(request.POST)

	if form.is_valid():
	    if form.login(request):
		try:
		    store = request.user.store
		    print store
		except:
		    pass
		    
		return redirect(redirect_to)
	return False

    else:
	form = form_class()

    return render_to_response(template, {
		"redirect_to": redirect_to,
		"login_form": form,
		"form_set": af.mall_forms,
	    }, context_instance=RequestContext(request))

def logout(request, template="mall/index.html"):
    request.session.flush()

    return render_to_response(template, {
	    "form_set": af.mall_forms,
    }, context_instance=RequestContext(request))
