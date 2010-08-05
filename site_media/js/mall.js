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
