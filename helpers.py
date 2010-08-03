from django.http import HttpResponse
from django.utils import simplejson
from django.utils.functional import Promise
from django.utils.encoding import force_unicode

from traceback import print_exc
import datetime, random

def add(x, y):
    return x+y

def fetch(model):
    result_list = []

    result_list.append(("", u"Stores"))
    
    for item in model.objects.all():
	if "account_name" in dir(item):
	    store_link = "/store/%s/" % item.account_name

	result_list.append((store_link, item.name))
	
    return result_list

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

def generate_id():
    digits = datetime.datetime.now().timetuple()[:6] + (random.randint(0, 999),)
    return ''.join(map(str, digits))
