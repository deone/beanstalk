from django.db import models

from pay4memall.abstract_model import CommonInfo

class Department(CommonInfo):

    def __unicode__(self):
	return self.name

class Category(CommonInfo):
    department = models.ForeignKey(Department)

    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "categories"
