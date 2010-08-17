from django.contrib import admin
from order.models import *

class OrderAdmin(admin.ModelAdmin):
    readonly_fields = ("store", "order_id", "amount", "status", "created_at", "date_paid", "validation_number")
    list_display = ("order_id", "amount", "status", "date_paid")
    
    def queryset(self, request):
	qs = super(OrderAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(store__owner=request.user)

class OrderedItemAdmin(admin.ModelAdmin):
    readonly_fields = ("order", "buyer", "product", "quantity", "cost")
    list_display = ("order", "product", "quantity", "cost")

    def queryset(self, request):
	qs = super(OrderedItemAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(order__store__owner = request.user)

admin.site.register(Order, OrderAdmin)
admin.site.register(OrderedItem, OrderedItemAdmin)
