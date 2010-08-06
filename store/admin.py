from django.contrib import admin
from pay4memall.store.models import *

class StoreAdmin(admin.ModelAdmin):
    def queryset(self, request):
	qs = super(StoreAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(owner=request.user)

class ProductAdmin(admin.ModelAdmin):
    def queryset(self, request):
	qs = super(ProductAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(product_group__store__owner=request.user)
	
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

admin.site.register(Store, StoreAdmin)
admin.site.register(ProductGroup, ProductGroupAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductDetail, ProductDetailAdmin)
