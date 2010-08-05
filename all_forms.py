from mall.forms import *
from store.forms import *
from account.forms import *

mall_forms = {
    "mall_search_form": MallSearchForm(),
    "store_select_form": StoreSelectForm(),
    "dept_select_form": DepartmentSelectForm()
}

store_forms = {
    "store_search_form": StoreSearchForm(),
    "store_sorter_form": StoreSorterForm(),
    "shopping_cart_form": ShoppingCartForm()
}
store_forms.update(mall_forms)

register_forms = {
    "register_form": RegisterForm(),
}
register_forms.update(mall_forms)

login_forms = {
    "login_form": LoginForm()
}
login_forms.update(mall_forms)
