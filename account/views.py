from django.shortcuts import render_to_response, redirect
from django.template import RequestContext
from django.views.decorators.cache import never_cache
from django.contrib.auth import authenticate, login as auth_login

from haystack.forms import SearchForm
import helpers as h

from account.forms import *

def get_common_context():
    return {
	"department_list": h.get_departments(),
	"store_list": h.get_stores(),
	"mall_search_form": SearchForm(),
    }

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

    context = get_common_context()
    context.update({"redirect_to": redirect_to, "register_form": form,})

    return render_to_response(template, context, context_instance=RequestContext(request))

@never_cache
def login(request, template="account/login.html", form_class=LoginForm):
    if request.method == "POST":
	form = form_class(request.POST)

	if form.login(request):
	    return redirect("/")

    else:
	form = form_class()

    context = get_common_context()
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

    return render_to_response(template, {
		"delivery_form": form,
	    }, context_instance=RequestContext(request))
