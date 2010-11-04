from settings import *

DEBUG = TEMPLATE_DEBUG = False

""" Search engine settings """
HAYSTACK_WHOOSH_PATH = "/home/apache/pay4memall_index"

""" Payment gateway settings """
MERCHANT_CODE = '4578956780'
MERCHANT_KEY = '1984075237'
MERCHANT_SERVICE_ID = '100'
PAYMENT_URL = 'http://pay4me.demo.swgindia.com/order/payment/payprocess/v1/PID/%s' % MERCHANT_CODE

""" Database settings """
DATABASE_NAME = 'pay4memall'
DATABASE_USER = 'pay4me'
DATABASE_PASSWORD = 'pay4me'
