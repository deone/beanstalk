import os

# Django settings for pay4memall project.

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ("Oladayo Osikoya", "oosikoya@pay4me.com"),
)

MANAGERS = ADMINS

DATABASE_ENGINE = 'django.db.backends.mysql'           # 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
DATABASE_NAME = 'pay4memall'             # Or path to database file if using sqlite3.
DATABASE_USER = 'pay4me'             # Not used with sqlite3.
DATABASE_PASSWORD = 'pay4me'         # Not used with sqlite3.
DATABASE_HOST = ''             # Set to empty string for localhost. Not used with sqlite3.
DATABASE_PORT = ''             # Set to empty string for default. Not used with sqlite3.

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'Africa/Lagos'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# Absolute path to the directory that holds media.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT = os.path.join(os.path.dirname(__file__), "site_media")

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL = '/site_media/'

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/media/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = ')k10ffyqu!+%$3h#&ixx6j$(-tqfeory==nvc51)cl)#=64@h4'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
#     'django.template.loaders.eggs.load_template_source',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
)

ROOT_URLCONF = 'pay4memall.urls'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.join(os.path.dirname(__file__), "templates"),
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sites',
    'django.contrib.sessions',
    'django.contrib.admin',
    'account',
    'store',
    'mall',
    'shopping_cart',
    'payment',
    'haystack',
    'sorl.thumbnail',
)

HAYSTACK_SEARCH_ENGINE = "whoosh"
HAYSTACK_SITECONF = "pay4memall.search_sites"
HAYSTACK_WHOOSH_PATH = "/home/hercules/pay4memall_index"

THUMBNAIL_DEBUG = True
THUMBNAIL_SUBDIR = "thumbs"

RESULTS_PER_PAGE = 5

MERCHANT_CODE = '4578956780'
MERCHANT_KEY = '1984075237'
MERCHANT_SERVICE_ID = '100'
PAYMENT_URL = 'http://pay4me.demo.swgindia.com/order/payment/payprocess/v1/PID/' + MERCHANT_CODE

AUTH_PROFILE_MODULE = "account.Profile"

EMAIL_HOST = "smtp2289.socketlabs-od.com"
EMAIL_PORT = 25

EMAIL_SENDER = "Pay4me Mall<no-reply@notification.pay4memall.com>"
EMAIL_HOST_USER = "swglobal"
EMAIL_HOST_PASSWORD = "wnMVRrZ8Q5nZ"

IMAGE_FORMATS = ["JPEG", "PNG", "GIF"]
STORE_LOGO_WIDTH = 160
STORE_BANNER_WIDTH = 750
PRODUCT_IMAGE_MIN_WIDTH = 300

USER_MANUAL_NAME = "Pay4Me_Mall_User_Manual.pdf"

""" Email title settings """

WELCOME_EMAIL_TITLE = "Your Account on Pay4Me Mall"
STORE_CREATION_EMAIL_TITLE = "Store Created on Pay4me Mall"
BUYER_ORDER_CONFIRMATION_EMAIL_TITLE = ""
MERCHANT_ORDER_CONFIRMATION_EMAIL_TITLE = ""
PAYMENT_SUCCESSFUL_EMAIL_TITLE = ""
PAYMENT_UNSUCCESSFUL_EMAIL_TITLE = ""
