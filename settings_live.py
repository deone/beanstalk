from settings import *

DEBUG = TEMPLATE_DEBUG = False
HAYSTACK_WHOOSH_PATH = "/home/pay4memall/pay4memall_index"

MERCHANT_CODE = '4578956780'
MERCHANT_KEY = '1984075237'
MERCHANT_SERVICE_ID = '100'
PAYMENT_URL = 'http://pay4me.demo.swgindia.com/order/payment/payprocess/v1/PID/' + MERCHANT_CODE
