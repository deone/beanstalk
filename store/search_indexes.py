from haystack.indexes import *
from haystack import site
from store.models import Product

class ProductIndex(RealTimeSearchIndex):
    text = CharField(document=True, use_template=True)
    
site.register(Product, ProductIndex)
