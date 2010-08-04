from django.shortcuts import render_to_response, redirect
from django.template import RequestContext

from django.contrib.auth import authenticate, login

from mall.forms import *
from store.forms import *
from account.forms import *

class FormSet:
    store_select_form = StoreSelectForm
    dept_select_form = DepartmentSelectForm
    mall_search_form = MallSearchForm
    register_form = RegisterForm
    login_form = LoginForm

def index(request, template="account/index.html", form_set=FormSet):
    """ Account home, shows the user's account settings. """

    return render_to_response(template, {
    }, context_instance=RequestContext(request))

def register(request, template="account/register.html", form_set=FormSet):
    """ Buyers' registration page. """

    try:
	redirect_to = request.GET.get("redirect_to")
    except KeyError:
	pass

    if request.method == "POST":
	form = RegisterForm(request.POST)
	if form.is_valid():
	    username, password = form.save()
	    user = authenticate(username=username, password=password)
	    login(request, user)
	    return redirect(redirect_to)
	form_set.register_form = form
    else:
	form = RegisterForm()
	form_set.register_form = form
	
    return render_to_response(template, {
		"redirect_to": redirect_to,
		"form_set": form_set(),
	    }, context_instance=RequestContext(request))

def logout(request, template="mall/index.html", form_set=FormSet):
    request.session.flush()
    return render_to_response(template, {
	    "form_set": form_set(),
    }, context_instance=RequestContext(request))
