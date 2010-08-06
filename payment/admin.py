from django.contrib import admin
from payment.models import *

admin.site.register(Transaction)
admin.site.register(OrderedItem)
