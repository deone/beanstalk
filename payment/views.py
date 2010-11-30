from django.http import HttpResponse
from django.template.loader import render_to_string, get_template
from django.template import Context
from django.conf import settings
from django.shortcuts import redirect, get_list_or_404
from django.utils.html import strip_tags

from django.contrib.sites.models import Site

from store.models import Product, Order, OrderedItem 
from mail import send_notification
import helpers as h

import datetime
import random
import base64
import urllib
import urllib2
from decimal import Decimal
from BeautifulSoup import BeautifulStoneSoup

from traceback import print_exc

def add(x, y):
    return x + y

def generate_unique_id():
    """ Generates a unique identifier """
    digits = datetime.datetime.now().timetuple()[:6] + (random.randint(0, 999),)
    return ''.join(map(str, digits))

def index(request):
    """ Submits a payment request, creates order entry in database and redirects to payment gateway. """
    cart = h.get_cart(request.session._session)
    order_id = generate_unique_id()

    sub_total = reduce(add, [item[1] * Product.objects.get(pk=item[0]).price for item in cart])
    delivery_total = reduce(add, [item[1] * Product.objects.get(pk=item[0]).delivery_charge for item in cart])

    order_total = sub_total + delivery_total

    for item in cart:
	product = Product.objects.get(pk=item[0])
	delivery_charge = product.delivery_charge * item[1]
	product_cost = product.price * item[1]
	order_cost = delivery_charge + product_cost

	# Check if order already exists. If not create one.
	order, created = Order.objects.get_or_create(order_id=order_id, store=product.product_group.store, \
		defaults = {'buyer': request.user, 'amount': order_cost})

	# If a new order was not created, update the gotten order.
	if not created:
	    order.amount += order_cost
	    order.save()

	# Also create item entries for each order.
	OrderedItem.objects.create(order=order, product=product, quantity=item[1], product_total=item[1] * product.price, \
		delivery_total=item[1] * product.delivery_charge)

    items_ordered_by_buyer = OrderedItem.objects.filter(order__order_id=order_id)
    send_order_confirmation(*items_ordered_by_buyer)

    #request.session.flush()

    url = get_gateway_url(order_id, order_total)
    return redirect(urllib.unquote(url))

def get_gateway_url(order_id, order_total):
    auth_token = base64.b64encode(settings.MERCHANT_CODE + ':' + settings.MERCHANT_KEY)
    t = get_template("payment/request.xml")

    data = t.render(Context({
		'cart_id': generate_unique_id(),
		'merchant_service_id': settings.MERCHANT_SERVICE_ID,
		'txn_no': order_id,
		'order_total': order_total
		}))

    req = urllib2.Request(settings.PAYMENT_URL, data)
    req.add_header("Authorization", "Basic %s" % auth_token)
    req.add_header("Content-type", "application/xml; charset=utf-8")
    req.add_header("Accept", "application/xml; charset=utf-8")
    
    response = urllib2.urlopen(req)

    soup = BeautifulStoneSoup(response.read())
    url = soup.find("redirect-url").string

    return url

def process_payment_response(request):
    """ Gets payment confirmation from Pay4Me, updates order accordingly and returns a 200 OK HttpResponse """
    soup = BeautifulStoneSoup(request.raw_post_data)
    item = soup.find('item')
    order_id = item.find('transaction-number').string
    amount = Decimal(item.amount.string)
    status = int(item.status.code.string)
    date_paid = item.find('payment-date').string 
    validation_no = item.find('validation-number').string
    payment_mode = item.find('mode').string
    bank_name = item.bank.find('name').string
    bank_branch = item.bank.find('branch').string

    
    """ Debug """

    #from django.core.mail import send_mail

    #message = """
    #order_id: %s type: %s \n
    #amount: %s type: %s \n
    #status: %s type: %s \n
    #validation_no: %s type: %s
    #date_paid: %s type: %s
    #payment_mode: %s type: %s
    #bank_name: %s type: %s
    #bank_branch: %s type: %s
    #""" % (
    
	    #order_id, type(order_id), 
	    #amount, str(type(amount)),
	    #str(status), str(type(status)),
	    #validation_no, str(type(validation_no)),
	    #date_paid, str(type(date_paid)),
	    #payment_mode, str(type(payment_mode)),
	    #bank_name, str(type(bank_name)),
	    #bank_branch, str(type(bank_branch)),
    #)

    #send_mail("Pay4Me Mall response debug", message, "dayo@aerixnigeria.com", ["oosikoya@pay4me.com"])

    merchant_order_mail_template = get_template("store/merchant_order_confirmation_email.txt")
    payment_success_template = get_template("account/payment_successful_email.txt")

    store_orders = get_list_or_404(Order, order_id=order_id)

    for so in store_orders:
	so.status = Order.DONE
	so.date_paid = date_paid.replace('T', ' ')
	so.validation_number = validation_no
	so.payment_mode = payment_mode
	if payment_mode != "ewallet":
	    so.bank_name = bank_name
	    so.bank_branch = bank_branch
	so.save()

	# Subtract ordered item quantity from product quantity.
	update_stock(so.ordereditem_set.all())

	merchant_order_confirmation = merchant_order_mail_template.render(Context({
	    "first_name": so.store.owner.first_name,
	    "store_name": so.store.name,
	    "items": so.ordereditem_set.all(),
	    "buyer_delivery_address": so.buyer.get_profile().delivery_address,
	    "admin_url": "http://%s/admin/" % Site.objects.all()[0],
	}))

	so.store.owner.email_user(settings.MERCHANT_ORDER_CONFIRMATION_EMAIL_TITLE % so.store.name, merchant_order_confirmation, settings.EMAIL_SENDER)

    send_receipt(order_id, payment_success_template)
    return HttpResponse(mimetype="text/plain", content="OK")

def update_stock(ordered_items):
    for oi in ordered_items:
	oi.product.quantity = oi.product.quantity - oi.quantity
	oi.product.save()
    return True

def send_order_confirmation(*ordered_items):
    order_id = ordered_items[0].order.order_id
    buyer = ordered_items[0].order.buyer

    product_total = reduce(add, [item.product_total for item in ordered_items])
    delivery_total = reduce(add, [item.delivery_total for item in ordered_items])
    order_total = product_total + delivery_total

    subject, sender = settings.BUYER_ORDER_CONFIRMATION_EMAIL_TITLE % order_id, settings.EMAIL_SENDER

    recipients = []
    recipients.append(buyer.email)

    mail_template = 'account/buyer_order_confirmation_email.html'

    for item in ordered_items:
	item.store_url = "http://%s/%s" % (Site.objects.get_current().domain, item.product.product_group.store.slug)

    if ordered_items[0].order.status != 1:
	status = "Successful"
    else:
	status = "Pending"

    context_vars = {
	'first_name': buyer.first_name,
	'last_name': buyer.last_name,
	'buyer_email': buyer.email,
	'buyer_delivery_address': buyer.get_profile().delivery_address,
	'order_total': order_total,
	'order_id': order_id,
	'product_total': product_total,
	'delivery_total': delivery_total,
	'items': ordered_items,
	'order_date': ordered_items[0].order.created_at,
	'order_status': 'Payment %s' % status,
    }

    result = send_notification(subject, sender, mail_template, *recipients, **context_vars)

    return HttpResponse(mimetype="text/plain", content="OK")

def send_receipt(order_id, email_template):
    ordered_items = OrderedItem.objects.filter(order__order_id=order_id)
    amount = reduce(add, [item.product_total + item.delivery_total for item in ordered_items])

    receipt = email_template.render(Context({
		    "first_name": ordered_items[0].order.buyer.first_name,
		    "amount": amount,
		    "payment_mode": ordered_items[0].order.payment_mode,
		    "bank_name": ordered_items[0].order.bank_name,
		    "bank_branch": ordered_items[0].order.bank_branch,
		}))

    ordered_items[0].order.buyer.email_user(settings.PAYMENT_SUCCESSFUL_EMAIL_TITLE % ordered_items[0].order.order_id, \
	    receipt, settings.EMAIL_SENDER)
