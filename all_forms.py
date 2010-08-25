from mall.forms import *
from haystack.forms import SearchForm

base_forms = {
    "mall_search_form": SearchForm,
    "store_select_form": StoreSelectForm,
    "department_select_form": DepartmentSelectForm,
}
