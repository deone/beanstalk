from django.conf import settings
from django.shortcuts import render_to_response
from django.template import Context, RequestContext
from django.template.loader import get_template
from django.contrib.auth.models import User

from order.models import *
from order.forms import *
from store.models import Product

import base64
import urllib2
from BeautifulSoup import BeautifulStoneSoup

import helpers as h

@h.json_response
def index(request):
    if not request.user.id:
	return ("string", "/account/login/")
    """
	* Generate transaction_id.
	* Insert transaction_id and total_amount into transaction table.
	* Insert each item into ordered_item table.
	* Make payment through pay4me API.
	* Receive and process response.
    """
    # Grab cart items from session
    """session_object = request.session._session
    cart = h.get_cart_from_session(session_object)

    # Create entry in transaction table
    total = reduce(h.add, [item[1][0] * item[1][1] for item in cart])
    transaction = Transaction.objects.create(transaction_id=h.generate_id(), amount=str(total))

    for item in cart:
	product = Product.objects.get(pk=item[0])
	OrderedItem.objects.create(transaction=transaction, user=request.user, \
		product=product, quantity=item[1][0], cost=str(item[1][0] * item[1][1]))

    auth_token = base64.b64encode(settings.MERCHANT_CODE + ':' + settings.MERCHANT_KEY)
    t = get_template("store/request.xml")

    data = t.render(Context({
	'cart_id': h.generate_id(),
	'merchant_service_id': settings.MERCHANT_SERVICE_ID,
	'txn_no': h.generate_id(),
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

    return ("string", url)"""

def process_payment_response(request):
    soup = BeautifulStoneSoup(request.raw_post_data)
    f = open('/tmp/response.xml', 'w')
    f.write(soup)

    return

def delivery(request, template="order/delivery.html", form_class=DeliveryForm):
    form = form_class()

    return render_to_response(template, {
		"delivery_form": form,
	    }, context_instance=RequestContext(request))