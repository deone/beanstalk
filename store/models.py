from django.db import models
from django.contrib.auth.models import User
from django.template.defaultfilters import slugify
from mall.models import Category

from pay4memall.abstract_model import CommonInfo
import datetime

GENDER_CHOICES = (
	("Male", "Male"),
	("Female", "Female"),
)

class Store(CommonInfo):
    owner = models.OneToOneField(User)
    slug = models.SlugField(max_length=100, unique=True, editable=False)
    logo = models.ImageField(upload_to="store/logos/", help_text="Required width: 160px, height preferably 95px. Allowed formats: JPEG, PNG, GIF.")
    banner = models.ImageField(upload_to="store/banners/", help_text="Required width: 750px, height preferably 254px. Allowed formats: JPEG, PNG, GIF.")
    office_number = models.CharField(max_length=9, null=True, blank=True)
    street_address = models.CharField(max_length=100)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)

    def save(self):
	self.slug = slugify(self.name)
	super(Store, self).save()

    def get_absolute_url(self):
	return "/%s/" % self.slug

    def __unicode__(self):
	return self.name


class ProductGroup(CommonInfo):
    store = models.ForeignKey(Store)

    def get_absolute_url(self):
	return "/%s/browse/%s/" % (self.store.slug, self.id)
    
    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "Product Groups"


# Custom-validate admin form!
class Product(CommonInfo):
    product_group = models.ForeignKey(ProductGroup)
    category = models.ForeignKey(Category)
    image = models.ImageField(upload_to="products", help_text="Allowed formats: JPEG, PNG, GIF. Must be square, larger than or equal to 300 X 300 pixels")
    price = models.DecimalField(max_digits=20, decimal_places=2)
    delivery_charge = models.DecimalField(max_digits=20, decimal_places=2)
    quantity = models.PositiveSmallIntegerField()
    date_added = models.DateTimeField(default=datetime.datetime.now)
    last_modified = models.DateTimeField(default=datetime.datetime.now)

    def get_absolute_url(self):
	return "/%s/products/%s/" % (self.product_group.store.slug, self.id)

    def __unicode__(self):
	return self.name

    def is_quantity_available(self, quantity_demanded):
	if quantity_demanded > self.quantity:
	    return False
	return True


class ProductDetail(CommonInfo):
    product = models.ForeignKey(Product)

    def __unicode__(self):
	return self.name

    class Meta:
	verbose_name_plural = "Product Details"


class Order(models.Model):
    # Change this to PAYMENT_PENDING, PAYMENT_SUCCESSFUL, ORDER_DELIVERED
    PENDING, DONE = 1, 0
    # Change this to ORDER_STATUS_CHOICES
    PAYMENT_STATUS_CHOICES = (
	    (PENDING, "Pending"),
	    (DONE, "Payment Successful"),
    )

    order_id = models.CharField(max_length=20)
    store = models.ForeignKey(Store)
    buyer = models.ForeignKey(User)
    amount = models.DecimalField(max_digits=20, decimal_places=2)
    status = models.SmallIntegerField(choices=PAYMENT_STATUS_CHOICES, default=PENDING)
    created_at = models.DateTimeField(default=datetime.datetime.now)
    date_paid = models.DateTimeField(null=True)
    validation_number = models.CharField(max_length=20, null=True)
    payment_mode = models.CharField(max_length=20, null=True)
    bank_name = models.CharField(max_length=20, null=True)
    bank_branch = models.CharField(max_length=20, null=True)

    def __str__(self):
	return "%s's share of order %s" % (self.store.name, self.order_id)


class OrderedItem(models.Model):
    order = models.ForeignKey(Order)
    product = models.ForeignKey(Product)
    quantity = models.IntegerField()
    product_total = models.DecimalField(max_digits=20, decimal_places=2)
    delivery_total = models.DecimalField(max_digits=10, decimal_places=2)

    def __unicode__(self):
	return self.product.name

    class Meta:
	verbose_name_plural = "Ordered Items"
