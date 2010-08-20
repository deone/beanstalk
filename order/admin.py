from django.contrib import admin
from django import forms
from order.models import *

class OrderedItemInline(admin.TabularInline):
    model = OrderedItem
    extra = 0
    readonly_fields = ("buyer", "product", "cost", "quantity",)

class OrderAdmin(admin.ModelAdmin):
    readonly_fields = ("order_id", "amount", "status",)
    list_display = ("order_id", "amount", "status", "date_paid")
    date_hierarchy = "created_at"
    fieldsets = (
	    (None, {
		'fields': (("order_id", "amount", "status"),)
	    }),
    )

    inlines = [
	OrderedItemInline,
    ]
    
    def queryset(self, request):
	qs = super(OrderAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(store__owner=request.user)

admin.site.register(Order, OrderAdmin)
admin.site.register(OrderedItem)
