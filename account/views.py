from django.shortcuts import render_to_response, redirect
from django.template import RequestContext
from django.contrib.auth import authenticate, login

import all_forms as af

def index(request, template="account/index.html"):
    """ Account home, shows the user's account settings. """

    return render_to_response(template, {
    }, context_instance=RequestContext(request))

def register(request, template="account/register.html"):
    """ Buyers' registration page. """

    try:
	redirect_to = request.GET.get("redirect_to")
    except KeyError:
	pass

    if request.method == "POST":
	forms = af.register_forms
	forms["register_form"](request.POST)

	if forms["register_form"].is_valid():
	    username, password = forms["register_form"].save()
	    user = authenticate(username=username, password=password)
	    login(request, user)
	    return redirect(redirect_to)
    else:
	forms = af.register_forms
	
    return render_to_response(template, {
		"redirect_to": redirect_to,
		"form_set": forms,
	    }, context_instance=RequestContext(request))

def logout(request, template="mall/index.html"):
    request.session.flush()

    return render_to_response(template, {
	    "form_set": af.mall_forms,
    }, context_instance=RequestContext(request))
