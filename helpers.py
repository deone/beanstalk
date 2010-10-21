from django.http import HttpResponse
from django.utils import simplejson
from django.utils.functional import Promise
from django.utils.encoding import force_unicode
from haystack.forms import SearchForm

from mall.models import Department
from store.models import Store, Product

from traceback import print_exc

class LazyEncoder(simplejson.JSONEncoder):
    def default(self, obj):
	if isinstance(obj, Promise):
	    return force_unicode(obj)
	return super(LazyEncoder, self).default(obj)

def json_response(func):
    def inner_func(request, *args, **kwargs):
	try:
	    response = func(request, *args, **kwargs)
	    if isinstance(response, tuple) and len(response) == 2:
		(type, value) = response
		return HttpResponse(create_response(0, type, value), mimetype="application/json")
	    else:
		return response
	except Exception, e:
	    print_exc()
	    if hasattr(e, "message"):
		msg = e.message
	    else:
		msg = "Internal Error" + ": " + str(e)
		response = create_response(500, "string", msg)

    inner_func.__name__ = func.__name__
    inner_func.__dict__ = func.__dict__

    return inner_func

def create_response(code, type=None, value=None):
    if type == None and value == None:
	response = {
	    "code": code,
	    "data": None
	}
    else:
	response = {
	    "code": code,
	    "data": {
		"type": type,
		"body": value
	    }
	}

    return simplejson.dumps(response, cls=LazyEncoder)

def get_cart(session):
    cart = []
	
    for item in session.iteritems():
	if isinstance(item[0], unicode):
	    cart.append(item)
    
    return cart

def get_cart_details(session):
    """if session.has_key("testcookie"):
	session.delete_test_cookie()"""

    cart = get_cart(session)
	
    items_qty = items_price = 0

    for item in cart:
	items_qty += item[1]
	items_price += Product.objects.get(pk=item[0]).price * item[1]

    cart_object = {
	"quantity": items_qty,
	"price": items_price,
    }

    return cart_object

def get_global_context_variables(session):
    return {
	"department_list": Department.objects.all(),
	"store_list": Store.objects.all(),
	"mall_search_form": SearchForm(),
	"cart": get_cart_details(session),
    }
