from django import forms
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User

from account.models import Profile

TITLE_CHOICES = (
	    ("Mr.", "Mr."),
	    ("Mrs.", "Mrs."),
	    ("Miss", "Miss"),
	    ("Ms.", "Ms."),
	    ("Dr.", "Dr."),
	)

class RegisterForm(forms.Form):
    title = forms.ChoiceField(choices=TITLE_CHOICES)
    first_name = forms.CharField()
    last_name = forms.CharField()
    email = forms.EmailField()
    mobile = forms.CharField()
    address = forms.CharField()
    city = forms.CharField()
    state = forms.CharField()
    country = forms.CharField()
    password = forms.CharField(label="Choose a password", widget=forms.PasswordInput())
    password2 = forms.CharField(label="Confirm password", widget=forms.PasswordInput())

    def clean(self):
	if "password" in self.cleaned_data and "password2" in self.cleaned_data:
	    if self.cleaned_data["password"] != self.cleaned_data["password2"]:
		raise forms.ValidationError("Your password entries must be the same")
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
	account = Profile.objects.create(user=user, title=title, mobile=mobile, address=address, 
		city=city, state=state, country=country)

	return username, password

class LoginForm(forms.Form):
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput())

    user = None

    def clean(self):
	email = self.cleaned_data["email"]
	password = self.cleaned_data["password"]

	user = authenticate(username=email, password=password)

	if user is None:
	    raise forms.ValidationError("Wrong Username and Password combination")
	return self.cleaned_data

    def login(self, request):
	login(request, self.user)
	return True
