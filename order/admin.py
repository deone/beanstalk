from django.contrib import admin
from order.models import *

class OrderAdmin(admin.ModelAdmin):
    readonly_fields = ("order_id", "amount", "status", "created_at", "date_paid", "validation_number")

admin.site.register(Order, OrderAdmin)
admin.site.register(OrderedItem)
