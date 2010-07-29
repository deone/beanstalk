function addToCart()    {
    productId = $("#add_to_cart #product_id").val();
    quantity = $("#add_to_cart #id_quantity").val();

    options["data"] = "quantity=" + quantity;
    options["url"] = "/product/" + productId + "/add_to_cart/";
    options["success"] = function(response) {
	if (response.data.type != "boolean")	{
	    alert("Internal Server Error");
	} else	{
	    displayShoppingCart(getCookie("sessionid"));
	}
    }

    $.ajax(options);
}

// Merge these two!
function redirectToRegister()	{
    redirectTo = document.location.pathname;
    document.location = "/account/register/?redirect_to=" + redirectTo;
}

function redirectToLogin()  {
    redirectTo = document.location.pathname;
    document.location = "/account/login/?redirect_to=" + redirectTo;
}
