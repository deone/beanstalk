from django import forms
from account.models import Profile

class DeliveryForm(forms.Form):
    delivery_address = forms.CharField(widget=forms.Textarea, required=False)

    def save(self, user):
	user_profile = user.get_profile()

	if self.cleaned_data["delivery_address"] == "":
	    user_profile.delivery_address = "%s, %s, %s, %s" % (user_profile.address, 
		    user_profile.city, user_profile.state, user_profile.country)
	else:
	    user_profile.delivery_address = self.cleaned_data["delivery_address"]

	user_profile.save()
