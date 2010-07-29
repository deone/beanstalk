from django.db import models
from django.contrib.auth.models import User

from pay4memall.abstract_model import CommonInfo

GENDER_CHOICES = (
	("Male", "Male"),
	("Female", "Female"),
)

class Store(CommonInfo):
    user = models.ForeignKey(User, unique=True)
    account_name = models.CharField(max_length=100, unique=True)
    logo = models.ImageField(upload_to="store/logos")
    office_number = models.CharField(max_length=9, null=True, blank=True)
    street_address = models.CharField(max_length=100)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)

    def __unicode__(self):
	return self.name

class StoreOwner(models.Model):
    store = models.ForeignKey(Store, unique=True)
    gender = models.CharField(max_length=6, choices=GENDER_CHOICES)
    mobile_number = models.CharField(max_length=11, unique=True)

    def __unicode__(self):
	return "%s %s" % (self.store.user.first_name, self.store.user.last_name)

class ProductGroup(CommonInfo):
    store = models.ForeignKey(Store)
    
    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "Product Groups"

class Product(CommonInfo):
    product_group = models.ForeignKey(ProductGroup)
    thumbnail = models.ImageField(upload_to="products/thumbs")
    large_image = models.ImageField(upload_to="products/large")
    price = models.DecimalField(max_digits=20, decimal_places=2)

    def __unicode__(self):
	return self.name

class ProductDetail(CommonInfo):
    product = models.ForeignKey(Product)

    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "Product Details"
