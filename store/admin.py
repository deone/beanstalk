from django.conf import settings
from django.template import Context
from django.template.loader import get_template
from django.template.defaultfilters import slugify

from django.contrib import admin
from django.contrib.sites.models import Site
from django.contrib.auth.models import User

from store.models import *
from store.forms import StoreModelForm, ProductModelForm
from account.forms import generate_password

class ProductDetailInline(admin.TabularInline):
    model = ProductDetail


class ProductAdmin(admin.ModelAdmin):
    form = ProductModelForm
    radio_fields = {"product_group": admin.VERTICAL}
    readonly_fields = ("date_added", "last_modified")
    date_hierarchy = "date_added"

    inlines = [
	ProductDetailInline,
    ]

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
	if db_field.name == "product_group":
	    if not request.user.is_superuser:
		kwargs["queryset"] = ProductGroup.objects.filter(store=request.user.store)
		return db_field.formfield(**kwargs)
	return super(ProductAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

    def queryset(self, request):
	qs = super(ProductAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(product_group__store=request.user.store)


class ProductGroupAdmin(admin.ModelAdmin):
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
	if db_field.name == "store":
	    if not request.user.is_superuser:
		kwargs["queryset"] = Store.objects.filter(owner=request.user)
		return db_field.formfield(**kwargs)
	return super(ProductGroupAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

    def queryset(self, request):
	qs = super(ProductGroupAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(store__owner=request.user)


class StoreAdmin(admin.ModelAdmin):
    form = StoreModelForm

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
	if db_field.name == "owner":
	    # When we start creating staff who are not superusers, we would need to rewrite this to use has_perms().
	    kwargs["queryset"] = User.objects.filter(is_staff=True).exclude(is_superuser=True)
	    return db_field.formfield(**kwargs)
	return super(StoreAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

    def save_model(self, request, obj, form, change):
	if not change:
	    password = generate_password()
	    obj.owner.set_password(password)
	    obj.owner.save()

	    mail_template = get_template("store/store_creation_email.txt")
	    message = mail_template.render(Context({
				"first_name": obj.owner.first_name,
				"store_home_url": "http://%s/%s/" % (Site.objects.all()[0], slugify(obj.name)),
				"store_admin_url": "http://%s/admin/" % Site.objects.all()[0],
				"username": obj.owner.username,
				"password": password,
				"user_manual_url": "http://%s/%s" % (Site.objects.all()[0], settings.USER_MANUAL_NAME)
			    }))

	    obj.owner.email_user(settings.STORE_CREATION_EMAIL_TITLE, message, settings.EMAIL_SENDER)
	    obj.save()


class ProductDetailAdmin(admin.ModelAdmin):
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
	if db_field.name == "product":
	    if not request.user.is_superuser:
		kwargs["queryset"] = Product.objects.filter(product_group__store=request.user.store)
		return db_field.formfield(**kwargs)
	return super(ProductDetailAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

    def queryset(self, request):
	qs = super(ProductDetailAdmin, self).queryset(request)
	if request.user.is_superuser:
	    return qs
	return qs.filter(product__product_group__store__owner=request.user)


class OrderedItemInline(admin.TabularInline):
    model = OrderedItem
    extra = 0
    readonly_fields = ("product", "cost", "quantity",)


class OrderedItemAdmin(admin.ModelAdmin):
    readonly_fields = ("order", "product", "cost", "quantity",)


class OrderAdmin(admin.ModelAdmin):
    readonly_fields = ("buyer", "store", "amount",)
    list_display = ("order_id", "store", "amount", "status", "created_at", "date_paid")
    date_hierarchy = "created_at"
    fieldsets = (
	    (None, {
		'fields': (("buyer", "store", "amount", "status"),)
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


admin.site.register(Store, StoreAdmin)
admin.site.register(ProductGroup, ProductGroupAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductDetail, ProductDetailAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderedItem, OrderedItemAdmin)
