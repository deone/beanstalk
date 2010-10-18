function displayShoppingCart()	{
    $.getJSON("/cart/details/", function(response)   {
	    var quantity = response.data.body.quantity;

	    $("#cart_details").html(quantity + " ITEMS");
    });
}

$(function()	{
    $("#nav select").change(function()   {
	if (this.options[this.selectedIndex].value != "")	{
	    document.location = this.options[this.selectedIndex].value;
	}
    });

    displayShoppingCart();
});
