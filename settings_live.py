from settings import *

DEBUG = TEMPLATE_DEBUG = False

""" Search engine settings """
HAYSTACK_WHOOSH_PATH = "/home/pay4memall/pay4memall_index"

""" Payment gateway settings """
MERCHANT_CODE = '1923717440'
MERCHANT_KEY = '5620b33533c1533d5c06029cea8d1279'
MERCHANT_SERVICE_ID = '48'
PAYMENT_URL = 'https://www.pay4me.com/order/payment/payprocess/v1/PID/%s' % MERCHANT_CODE

""" Database settings """
DATABASE_NAME = 'pay4memall'
DATABASE_USER = 'pay4me_admin'
DATABASE_PASSWORD = 'p4y4m3_4dm1n'
DATABASE_HOST = 'myinstance.csnuhzoafqcv.us-east-1.rds.amazonaws.com'
