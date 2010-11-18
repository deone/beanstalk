from django.shortcuts import render_to_response, redirect, get_object_or_404
from django.template import RequestContext, Context
from django.template.loader import get_template, render_to_string
from django.conf import settings
from django.core.mail import send_mail, EmailMultiAlternatives
from django.utils.html import strip_tags

from django.contrib.sites.models import Site
from django.contrib.auth import authenticate, login as auth_login

import helpers as h
from traceback import print_exc

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
	    # This ain't DRY.
	    username, password = form.save()
	    user = get_object_or_404(User, username__iexact=username)

	    subject, from_email, to = settings.WELCOME_EMAIL_TITLE, settings.EMAIL_SENDER, user.email

	    html_content = render_to_string("account/welcome_email.html",
		    {"first_name": user.first_name,
		    "username": username,
		    "password": password,
		    "login_url": "http://%s/account/login/" % Site.objects.all()[0]}
		    )
	    text_content = strip_tags(html_content)

	    msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
	    msg.attach_alternative(html_content, "text/html")

	    try:
		msg.send()
	    except Exception, e:
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
