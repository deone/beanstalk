function addToCart()    {
    var productId = $("#add_to_cart #product_id").val();
    var qty = $("#add_to_cart #id_quantity").val();

    var url = "/product/" + productId + "/add_to_cart/";

    $.post(url, { quantity: qty }, 
	function(response)  {
	    if (response.data.type != "boolean")	{
		alert("Failed data type check");
	    } else	{
		displayShoppingCart();
	    }
	}
    );
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
