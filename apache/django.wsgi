import os
import sys
import django.core.handlers.wsgi

sys.stdout = sys.stderr

sys.path.append("/usr/local/www")
sys.path.append("/usr/local/www/pay4memall")

os.environ["DJANGO_SETTINGS_MODULE"] = "pay4memall.settings"

application = django.core.handlers.wsgi.WSGIHandler()
