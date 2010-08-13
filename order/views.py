from django.conf import settings
from django.shortcuts import render_to_response, redirect
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

@h.json_response
def transact(request):
    """
	* Generate transaction_id.
	* Insert transaction_id and total_amount into transaction table.
	* Insert each item into ordered_item table.
	* Make payment through pay4me API.
    """
    # Grab cart items from session
    session_object = request.session._session
    cart = h.get_cart_from_session(session_object)

    # Create entry in transaction table
    total = reduce(h.add, [item[1][0] * item[1][1] for item in cart])
    transaction_id = h.generate_id()
    transaction = Transaction.objects.create(transaction_id=transaction_id, amount=str(total))

    for item in cart:
	product = Product.objects.get(pk=item[0])
	OrderedItem.objects.create(transaction=transaction, user=request.user, \
		product=product, quantity=item[1][0], cost=str(item[1][0] * item[1][1]))

    auth_token = base64.b64encode(settings.MERCHANT_CODE + ':' + settings.MERCHANT_KEY)
    t = get_template("order/request.xml")

    data = t.render(Context({
	'cart_id': h.generate_id(),
	'merchant_service_id': settings.MERCHANT_SERVICE_ID,
	'txn_no': transaction_id,
	'order_total': total
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
    transaction_id = item.find('transaction-number').string
    amount = Decimal(item.amount.string)
    status = int(item.status.code.string)
    validation_no = item.find('validation-number').string
    date_paid = item.find('payment-date').string 

    #message = """
    #transaction_id: %s type: %s \n
    #amount: %s type: %s \n
    #status: %s type: %s \n
    #validation_no: %s type: %s
    #date_paid: %s type: %s
    #""" % (
    """
	    transaction_id, type(transaction_id), 
	    amount, str(type(amount)),
	    str(status), str(type(status)),
	    validation_no, str(type(validation_no)),
	    date_paid, str(type(date_paid))
    )

    send_mail("Pay4Me Mall response debug", message, "dayo@aerixnigeria.com", ["oosikoya@pay4me.com"])"""

    try:
	transaction = Transaction.objects.get(transaction_id=transaction_id)
    except Transaction.DoesNotExist, e:
	raise Http404
    else:
	transaction.status = Transaction.DONE
	transaction.validation_number = validation_no
	transaction.date_paid = date_paid.replace('T', ' ')
	transaction.save()

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
