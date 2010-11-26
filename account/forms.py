from django import forms
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.core import urlresolvers
from django.utils.translation import ugettext_lazy as _, ugettext
from django.conf import settings
from django.contrib.sites.models import Site

from account.models import Profile
from mail import send_notification

import random
import string

TITLE_CHOICES = (
	    ("Mr.", "Mr."),
	    ("Mrs.", "Mrs."),
	    ("Miss", "Miss"),
	    ("Ms.", "Ms."),
	    ("Dr.", "Dr."),
	)

def generate_password():
    return "".join(random.sample(string.letters + string.digits, 8))

def validate_alpha(value):
    if not value.isalpha():
	raise ValidationError(ugettext("Names must not contain numbers"))

class RegisterForm(forms.Form):
    title = forms.ChoiceField(label=_('Title'), 
	    choices=TITLE_CHOICES)
    first_name = forms.CharField(label=_('First Name'), 
	    max_length=30, validators=[validate_alpha])
    last_name = forms.CharField(label=_('Last Name'), 
	    max_length=30, validators=[validate_alpha])
    email = forms.EmailField(label=_('Email Address'), 
	    max_length=75)
    mobile = forms.CharField(label=_('Mobile Phone No.'), max_length=13, 
	    help_text=_("e.g. 2348023450000. Country code + number"))
    address = forms.CharField(label=_('Address'), max_length=200)
    city = forms.CharField(label=_('City'), max_length=20)
    state = forms.CharField(label=_('State'), max_length=20)
    country = forms.CharField(label=_('Country'), max_length=50)
    next = forms.CharField(max_length=200, required=False, widget=forms.HiddenInput())

    def clean_email(self):
	if self.cleaned_data["email"] in [object.email for object in User.objects.all()]:
	    raise forms.ValidationError(ugettext("Email belongs to another user."))
	if len(self.cleaned_data["email"]) > 30:
	    raise forms.ValidationError(ugettext("Email too long."))
	return self.cleaned_data["email"]

    def clean_mobile(self):
	if not self.cleaned_data["mobile"].isdigit():
	    raise ValidationError("Please enter a valid phone number")
	return self.cleaned_data["mobile"]

    def save(self, request):
	data = self.cleaned_data
	username = email = data["email"]
	password = generate_password()
	title = data["title"]
	first_name = data["first_name"]
	last_name = data["last_name"]
	mobile = data["mobile"]
	address = data["address"]
	city = data["city"]
	state = data["state"]
	country = data["country"]
	
	# Create user and corresponding profile
	user = User.objects.create_user(username, email, password)
	user.first_name = first_name
	user.last_name = last_name

	user.save()
	profile = Profile.objects.create(user=user, title=title, mobile=mobile, 
	    address=address, city=city, state=state, country=country)

	# Authenticate and log user in
	user = authenticate(username=username, password=password)
	login(request, user)

	# Send welcome email
	subject, sender = settings.WELCOME_EMAIL_TITLE, settings.EMAIL_SENDER

	recipients = []
	recipients.append(user.email)
	recipients.append(settings.EMAIL_COPY_ADDRESS)

	mail_template = 'account/welcome_email.html'

	context_vars = {
		'first_name': user.first_name,
		'username': username,
		'password': password,
		'login_url': "http://%s%s" % (Site.objects.get_current().domain, urlresolvers.reverse('account_login')) 
	}

	result = send_notification(subject, sender, mail_template, *recipients, **context_vars)

	if not result:
	    user.delete()

	return user


class LoginForm(forms.Form):
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput())

    user = None

    def clean(self):
	if self._errors:
	    return
	email = self.cleaned_data['email']
	password = self.cleaned_data['password']

	user = authenticate(username=email, password=password)

	if user is None:
	    raise forms.ValidationError(ugettext('Wrong Username and Password combination'))
	else:
	    self.user = user

	return self.cleaned_data

    def login(self, request):
	if self.is_valid():
	    login(request, self.user)
	    return True
	return False


class DeliveryAddressForm(forms.Form):
    delivery_address = forms.CharField(max_length=200, required=False)

    def save(self, user):
	user_profile = user.get_profile()

	if self.cleaned_data['delivery_address'] == '':
	    user_profile.delivery_address = '%s, %s, %s, %s' % (user_profile.address, 
		    user_profile.city, user_profile.state, user_profile.country)
	else:
	    user_profile.delivery_address = self.cleaned_data['delivery_address']

	user_profile.save()
