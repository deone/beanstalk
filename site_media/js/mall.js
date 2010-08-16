function addToCart()	{

    $("#add_to_cart #id_quantity").attr("disabled", "disabled");
    $("#add_to_cart_btn").attr({disabled: "disabled", value: "Please Wait..."});

    var productId = $("#add_to_cart #product_id").val();
    var qty = $("#add_to_cart #id_quantity").val();

    var url = "/product/" + productId + "/add_to_cart/";

    if (qty == "")  {
	alert("Quantity field cannot be empty");
    } else if (parseInt(qty) <= 0)  {
	alert("Quantity field cannot be zero or less");
    } else  {
	$.post(url, { quantity: qty }, 
	    function(response)  {
		if (response.data.type != "boolean")    {
		    alert("Failed data type check");
		} else	{
		    displayShoppingCart();
		}
			
	    }
	);
    }

    $("#add_to_cart #id_quantity").attr("disabled", "");
    $("#add_to_cart_btn").attr({disabled: "", value: "Add To Cart"});

}
