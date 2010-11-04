from settings import *

DEBUG = TEMPLATE_DEBUG = False

""" Search engine settings """
HAYSTACK_WHOOSH_PATH = "/home/pay4memall/pay4memall_index"

""" Payment gateway settings """
MERCHANT_CODE = '4578956780'
MERCHANT_KEY = '1984075237'
MERCHANT_SERVICE_ID = '48'
PAYMENT_URL = 'https://www.pay4me.com/order/payment/payprocess/v1/PID/%s' % MERCHANT_CODE

""" Database settings """
DATABASE_NAME = 'pay4memall'
DATABASE_USER = 'pay4me_admin'
DATABASE_PASSWORD = 'p4y4m3_4dm1n'
DATABASE_HOST = 'myinstance.csnuhzoafqcv.us-east-1.rds.amazonaws.com
