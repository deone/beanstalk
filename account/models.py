from django.db import models
from django.contrib.auth.models import User

class Account(models.Model):
    user = models.ForeignKey(User, unique=True)
    title = models.CharField(max_length=4)
    mobile = models.CharField(max_length=15)
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)
    country = models.CharField(max_length=50)
    
    def __unicode__(self):
	return self.user.email
