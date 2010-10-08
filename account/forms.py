from django import forms
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

from account.models import Profile

TITLE_CHOICES = (
	    ("Mr.", "Mr."),
	    ("Mrs.", "Mrs."),
	    ("Miss", "Miss"),
	    ("Ms.", "Ms."),
	    ("Dr.", "Dr."),
	)

def validate_alpha(value):
    if not value.isalpha():
	raise ValidationError("Names must not contain numbers")

def validate_number(value):
    pass

class RegisterForm(forms.Form):
    title = forms.ChoiceField(choices=TITLE_CHOICES)
    first_name = forms.CharField(max_length=30, validators=[validate_alpha])
    last_name = forms.CharField(max_length=30, validators=[validate_alpha])
    email = forms.EmailField(max_length=75)
    mobile = forms.CharField(max_length=13, help_text="e.g. 2348023450000. Country code + number")
    address = forms.CharField(max_length=200)
    city = forms.CharField(max_length=20)
    state = forms.CharField(max_length=20)
    country = forms.CharField(max_length=50)
    password = forms.CharField(label="Choose a password", widget=forms.PasswordInput())
    password2 = forms.CharField(label="Confirm password", widget=forms.PasswordInput())

    def clean_email(self):
	if self.cleaned_data["email"] in [object.email for object in User.objects.all()]:
	    raise forms.ValidationError("Email belongs to another user.")
	return self.cleaned_data["email"]

    def clean_mobile(self):
	if not self.cleaned_data["mobile"].isdigit():
	    raise ValidationError("Please enter a valid phone number")

    def clean(self):
	if self._errors:
	    return
	if self.cleaned_data["password"] != self.cleaned_data["password2"]:
	    raise forms.ValidationError("Your password entries must be the same.")
	return self.cleaned_data

    def save(self):
	username = email = self.cleaned_data["email"]
	password = self.cleaned_data["password"]
	title = self.cleaned_data["title"]
	first_name = self.cleaned_data["first_name"]
	last_name = self.cleaned_data["last_name"]
	mobile = self.cleaned_data["mobile"]
	address = self.cleaned_data["address"]
	city = self.cleaned_data["city"]
	state = self.cleaned_data["state"]
	country = self.cleaned_data["country"]
	
	user = User.objects.create_user(username, email, password)
	user.first_name = first_name
	user.last_name = last_name
	user.save()
	profile = Profile.objects.create(user=user, title=title, mobile=mobile, 
	    address=address, city=city, state=state, country=country)

	return username, password


class LoginForm(forms.Form):
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput())

    user = None

    def clean(self):
	if self._errors:
	    return
	email = self.cleaned_data["email"]
	password = self.cleaned_data["password"]

	user = authenticate(username=email, password=password)

	if user is None:
	    raise forms.ValidationError("Wrong Username and Password combination")
	else:
	    self.user = user

	return self.cleaned_data

    def login(self, request):
	if self.is_valid():
	    login(request, self.user)
	    return True
	return False


class DeliveryAddressForm(forms.Form):
    delivery_address = forms.CharField(max_length=200)#widget=forms.Textarea, required=False, max_length=200)

    def save(self, user):
	user_profile = user.get_profile()

	if self.cleaned_data["delivery_address"] == "":
	    user_profile.delivery_address = "%s, %s, %s, %s" % (user_profile.address, 
		    user_profile.city, user_profile.state, user_profile.country)
	else:
	    user_profile.delivery_address = self.cleaned_data["delivery_address"]

	user_profile.save()
