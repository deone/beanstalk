from django.contrib.auth.models import User
from django.forms.fields import email_re

class BasicBackend:
    def get_user(self, user_id):
	try:
	    return User.objects.get(pk=user_id)
	except User.DoesNotExist:
	    return None

class EmailBackend(BasicBackend):
    def authenticate(self, username=None, password=None):
	if email_re.search(username):
	    try:
		user = User.objects.get(email=username)
	    except User.DoesNotExist:
		return None
	else:
	    try:
		user = User.objects.get(username=username)
	    except User.DoesNotExist:
		return None
	if user.check_password(password):
	    return user
