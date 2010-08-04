from django.db import models

from store.models import Product
from django.contrib.auth.models import User

class Transaction(models.Model):
    PENDING, DONE = 1, 0
    PAYMENT_STATUS_CHOICES = (
	    (PENDING, "Pending"),
	    (DONE, "Payment Done"),
    )

    transaction_id = models.CharField(max_length=20)
    amount = models.DecimalField(max_digits=20, decimal_places=2)
    status = models.SmallIntegerField(choices=PAYMENT_STATUS_CHOICES, default=PENDING)

    def __unicode__(self):
	return self.transaction_id

class OrderedItem(models.Model):
    transaction = models.ForeignKey(Transaction)
    user = models.ForeignKey(User)
    product = models.ForeignKey(Product)
    quantity = models.IntegerField()
    cost = models.DecimalField(max_digits=20, decimal_places=2)

    def __unicode__(self):
	return self.product.name
