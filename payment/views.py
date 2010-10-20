from django.conf import settings
from django.http import HttpResponse
from django.shortcuts import redirect, get_list_or_404
from django.template.loader import get_template
from django.template import Context

from store.models import Product, Order, OrderedItem

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
	product_cost = product.price * item[1]

	# Check if order already exists. If not create one.
	order, created = Order.objects.get_or_create(order_id=order_id, store=product.product_group.store, \
		defaults = {'buyer': request.user, 'amount': product_cost})

	# If a new order was not created, update the gotten order.
	if not created:
	    order.amount += product_cost
	    order.save()

	# Also create item entries for each order.
	OrderedItem.objects.create(order=order, product=product, quantity=item[1], cost=item[1] * product.price)

    url = get_gateway_url(order_id, order_total)

    request.session.flush()

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
    
    """ Debug """

    #from django.core.mail import send_mail

    #message = """
    #order_id: %s type: %s \n
    #amount: %s type: %s \n
    #status: %s type: %s \n
    #validation_no: %s type: %s
    #date_paid: %s type: %s
    #""" % (
    """
	    order_id, type(order_id), 
	    amount, str(type(amount)),
	    str(status), str(type(status)),
	    validation_no, str(type(validation_no)),
	    date_paid, str(type(date_paid))
    )

    send_mail("Pay4Me Mall response debug", message, "dayo@aerixnigeria.com", ["oosikoya@pay4me.com"])"""

    store_orders = get_list_or_404(Order, order_id=order_id)

    for so in store_orders:
	so.status = Order.DONE
	so.date_paid = date_paid.replace('T', ' ')
	so.validation_number = validation_no
	so.save()

	# Subtract ordered item quantity from product quantity.
	update_stock(so.ordereditem_set.all())

	# Send email notification to merchant(s) so that products can be shipped.
	store_order_info = {
	    "merchant_email": so.store.owner.email,
	    "order_id": so.order_id,
	    "buyer_address": so.buyer.get_profile().delivery_address,
	    "amount": so.amount,
	    "order_date": so.created_at,
	}
	notify_merchant(so)

    # Send email to buyer. Grab items by querying OrderedItem with order_id, pronto!
    items_ordered_by_buyer = OrderedItem.objects.filter(order__order_id=order_id)
    notify_buyer(*items_ordered_by_buyer)

    return HttpResponse(mimetype="text/plain", content="OK")

def update_stock(ordered_items):
    for oi in ordered_items:
	oi.product.quantity = oi.product.quantity - oi.quantity
	oi.product.save()

def notify_merchant(order):
    email_title = "Items Ordered on your store, %s" % order.store
    message = ""

    for item in order.ordereditem_set.all():
	message += """
	%s %s
	N%s
	""" % (item.quantity, item.product.name, item.product.price)

    send_mail(email_title, message, "oosikoya@pay4me.com", [order.store.owner.email])

def notify_buyer(*args):
    order_id = args[0].order.order_id
    buyer = args[0].order.buyer

    email_title = "Pay4Me Mall Order Confirmation - Order %s" % order_id
    order_total = reduce(add, [item.quantity * float(item.cost) for item in args])
    shipping_total = reduce(add, [item.quantity * item.product.delivery_charge for item in args])
    order_grand_total = float(order_total) + float(shipping_total)

    # Read this from a text file.
    message = """
    Thank you for your order, %s.

    Purchasing Information
    Email Address: %s

    Shipping Address:
    %s
    
    Order Grand Total: N%s

    Order Summary
    Order ID: %s
    Subtotal of Items: N%s
    Shipping & Handling: N%s

    Total for this Order: N%s

    Delivery estimate:
    Shipping estimate for these items:
    """ % (buyer.first_name, buyer.email, buyer.get_profile().delivery_address, order_grand_total, order_id, order_total, shipping_total, order_grand_total)

    # The 'sold by' info should be a link to the store.
    for item in args:
	message += """
	%s %s
	N%s
	Sold by: %s
	""" % (item.quantity, item.product.name, item.product.price, item.product.product_group.store)

    try:
	send_mail(email_title, message, "oosikoya@pay4me.com", [buyer.email])
    except:
	print_exc()
    else:
	return HttpResponse(mimetype="text/plain", content="OK")
