from django.contrib import admin
from order.models import *

class TransactionAdmin(admin.ModelAdmin):
    readonly_fields = ("transaction_id", "amount", "status", "created_at", "date_paid", "validation_number")

admin.site.register(Transaction, TransactionAdmin)
admin.site.register(OrderedItem)
