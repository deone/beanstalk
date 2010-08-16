from django.contrib import admin
from pay4memall.store.models import *

class ProductDetailInline(admin.StackedInline):
    model = ProductDetail

class ProductAdmin(admin.ModelAdmin):
    radio_fields = {"product_group": admin.VERTICAL}
    readonly_fields = ("date_added", "last_modified")
    date_hierarchy = "date_added"

    inlines = [
	ProductDetailInline,
    ]

    def queryset(self, request):
	qs = super(ProductAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	
	return qs.filter(product_group=request.user.store.productgroup_set.all())
	
class ProductGroupAdmin(admin.ModelAdmin):
    def queryset(self, request):
	qs = super(ProductGroupAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(store=request.user.store)

class ProductDetailAdmin(admin.ModelAdmin):
    def queryset(self, request):
	qs = super(ProductDetailAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(product__product_group__store=request.user.store)

admin.site.register(Store)
admin.site.register(ProductGroup, ProductGroupAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductDetail, ProductDetailAdmin)
