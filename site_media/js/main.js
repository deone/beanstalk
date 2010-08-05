function checkOut() {

    $.post("/checkout/",
	    function(response)	{
		document.location = response.data.body;
	    }
    );
}

function displayShoppingCart()	{
    $.getJSON("/cart/details/", function(response)   {
	    var price = response.data.body.price;
	    var quantity = response.data.body.quantity;

	    $("#cart_details").html(quantity + " ITEMS | " + "N" + price + ".00");
    });
}

$(function(){
    $("#id_stores").change(function()   {
	if (this.options[this.selectedIndex].value != "")	{
	    document.location = this.options[this.selectedIndex].value;
	}
    });

    displayShoppingCart();
});
