function addToCart()	{

    $("#add_to_cart_btn").attr({disabled: "disabled", value: "Please Wait..."});

    var productId = $("#add_to_cart #product_id").val();
    var qty = $("#add_to_cart #id_quantity").val();

    var url = "/product/" + productId + "/add_to_cart/";

    $.post(url, { quantity: qty }, 
	function(response)  {
	    $("#add_to_cart_btn").attr({disabled: "", value: "Add To Cart"});
	    if (response.data.type != "boolean")    {
		alert("Failed data type check");
	    } else	{
		displayShoppingCart();
	    }
	}
    );
}
