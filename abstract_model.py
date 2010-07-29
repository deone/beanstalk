from django.db import models

class CommonInfo(models.Model):
    name = models.CharField(max_length=100, unique=True)
    description = models.TextField(blank=True)

    class Meta:
	abstract = True
