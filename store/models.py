from django.db import models
from django.contrib.auth.models import User
from mall.models import Category

from pay4memall.abstract_model import CommonInfo

import datetime

GENDER_CHOICES = (
	("Male", "Male"),
	("Female", "Female"),
)

class Store(CommonInfo):
    owner = models.OneToOneField(User)
    account_name = models.CharField(max_length=100, unique=True)
    logo = models.ImageField(upload_to="store/logos/")
    banner = models.ImageField(upload_to="store/banners/")
    office_number = models.CharField(max_length=9, null=True, blank=True)
    street_address = models.CharField(max_length=100)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)

    def __unicode__(self):
	return self.name

class ProductGroup(CommonInfo):
    store = models.ForeignKey(Store)
    
    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "Product Groups"

class Product(CommonInfo):
    product_group = models.ForeignKey(ProductGroup)
    category = models.ForeignKey(Category)
    thumbnail = models.ImageField(upload_to="products/thumbs")
    large_image = models.ImageField(upload_to="products/large")
    price = models.DecimalField(max_digits=20, decimal_places=2)
    quantity = models.IntegerField()
    date_added = models.DateTimeField(default=datetime.datetime.now)
    last_modified = models.DateTimeField(default=datetime.datetime.now)

    def __unicode__(self):
	return self.name

class ProductDetail(CommonInfo):
    product = models.ForeignKey(Product)

    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "Product Details"
