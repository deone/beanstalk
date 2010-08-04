function checkOut(userId) {
    var sessionId = getCookie("sessionid");

    $.post("/checkout/", { session_id: sessionId, user_id: userId },
	    function(response)	{
		document.location = response.data.body;
	    }
    );
}

function displayShoppingCart()	{
    $.getJSON("/cartdetails/", function(response)	{
	    var price = response.data.body.price;
	    var quantity = response.data.body.quantity;

	    $("#cart_details").html(quantity + " ITEMS | " + "N" + price + ".00");
    });
}

// Temporary hack - demo purposes.
// Using session_id in this url is problematic.
// If a user logs in or registers from the checkout button,
// the session_id in the cookie changes and this url becomes bogus.
// And we can't redirect to the shopping cart page anymore.
function previewCart()	{
    sessionId = getCookie("sessionid");
    document.location = "/cart/" + sessionId + "/preview/";
}

$(function(){
    $("#id_stores").change(function()   {
	if (this.options[this.selectedIndex].value != "")	{
	    document.location = this.options[this.selectedIndex].value;
	}
    });

    displayShoppingCart();
});
