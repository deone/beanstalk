from django.db import models
from django.template.defaultfilters import slugify

from pay4memall.abstract_model import CommonInfo

class Department(CommonInfo):
    slug = models.SlugField(max_length=40, unique=True, editable=False)

    def save(self):
	self.slug = slugify(self.name)
	super(Department, self).save()

    def get_absolute_url(self):
	return "/departments/%s/" % self.slug

    def __unicode__(self):
	return self.name

class Category(CommonInfo):
    department = models.ForeignKey(Department)

    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "categories"
