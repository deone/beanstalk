from django.conf import settings
from django.shortcuts import redirect
from django.template.loader import get_template
from django.template import Context, RequestContext

from store.models import Product, Order, OrderedItem

import helpers as h

import datetime
import random
import base64
import urllib
import urllib2
from BeautifulSoup import BeautifulStoneSoup

def add(x, y):
    """ Adds up the value of items in the cart and returns total """
    return x + y

def generate_unique_id():
    digits = datetime.datetime.now().timetuple()[:6] + (random.randint(0, 999),)
    return ''.join(map(str, digits))

def get_order_details(request):
    """ Computes and returns the value of the order together with a generated unique order identifier """
    cart = h.get_cart_from_session(request.session._session)

    order_id = generate_unique_id()
    order_total = reduce(add, [item[1][0] * item[1][1] for item in cart])

    return cart, order_id, order_total

def index(request):
    """ Submits a payment request to Pay4Me """
    order_details = get_order_details(request)

    cart = order_details[0]
    order_id = order_details[1]
    order_total = order_details[2]

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

    # Create order entry in database
    for item in cart:
	product = Product.objects.get(pk=item[0])
	product_cost = product.price * item[1][0]
	
	try:
	    order = Order.objects.get(order_id=order_id, store=product.product_group.store)
	except Order.DoesNotExist:
	    order = Order.objects.create(order_id=order_id, store=product.product_group.store, amount=product_cost)
	else:
	    order.amount += product_cost
	    order.save()

	OrderedItem.objects.create(order=order, buyer=request.user, \
	    product=product, quantity=item[1][0], cost=str(item[1][0] * item[1][1]))

    request.session.flush()

    return redirect(urllib.unquote(url))

def process_payment_response(request):
    """ Gets payment confirmation from Pay4Me, updates order accordingly and returns a 200 OK HttpResponse """
    soup = BeautifulStoneSoup(request.raw_post_data)
    item = soup.find('item')
    order_id = item.find('transaction-number').string
    amount = Decimal(item.amount.string)
    status = int(item.status.code.string)
    date_paid = item.find('payment-date').string 
    validation_no = item.find('validation-number').string

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

    return HttpResponse(mimetype="text/plain", content="OK")
