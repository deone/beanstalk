from django.conf import settings
from django.shortcuts import render_to_response, redirect, get_list_or_404
from django.template import Context, RequestContext
from django.template.loader import get_template
from django.contrib.auth.models import User
from django.http import Http404, HttpResponse
from django.core.mail import send_mail

from order.models import *
from order.forms import *
from store.models import Product

import base64
import urllib2
from decimal import Decimal
from BeautifulSoup import BeautifulStoneSoup

import helpers as h

@h.json_response
def index(request):
    if not request.user.id:
	return ("string", "/account/login/")
    else:
	return ("string", "/delivery/")

def compute_cart(request):
    # Grab cart items from session
    session_object = request.session._session
    cart = h.get_cart_from_session(session_object)

    # Create entry in order table
    total = reduce(h.add, [item[1][0] * item[1][1] for item in cart])
    order_id = h.generate_id()

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

    return order_id, total

@h.json_response
def transact(request):
    order_details = compute_cart(request)

    auth_token = base64.b64encode(settings.MERCHANT_CODE + ':' + settings.MERCHANT_KEY)
    t = get_template("order/request.xml")

    data = t.render(Context({
	'cart_id': h.generate_id(),
	'merchant_service_id': settings.MERCHANT_SERVICE_ID,
	'txn_no': order_details[0],
	'order_total': order_details[1]
    }))

    req = urllib2.Request(settings.PAYMENT_URL, data)
    req.add_header("Authorization", "Basic %s" % auth_token)
    req.add_header("Content-type", "application/xml; charset=utf-8")
    req.add_header("Accept", "application/xml; charset=utf-8")

    response = urllib2.urlopen(req)
    soup = BeautifulStoneSoup(response.read())

    url = soup.find("redirect-url").string

    request.session.flush()

    return ("string", url)

def process_payment_response(request):
    # Process response from pay4me.
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

def delivery(request, template="order/delivery.html", form_class=DeliveryForm):
    if request.method == "POST":
	form = form_class(request.POST)
	if form.is_valid():
	    form.save(request.user)
	    return redirect("/cart/preview/")

    else:
	form = form_class()

    return render_to_response(template, {
		"delivery_form": form,
	    }, context_instance=RequestContext(request))
