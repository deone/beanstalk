// Remove these mad hacks. Django should have a better way to do redirects.
function redirectToRegister()	{
    redirectTo = document.location.pathname;
    if (redirectTo == "/account/register/") {
	redirectTo = "/";
    }
    document.location = "/account/register/?redirect_to=" + redirectTo;
}

function redirectToLogin()  {
    redirectTo = document.location.pathname;
    if (redirectTo == "/account/login/") {
	redirectTo = "/";
    }
    document.location = "/account/login/?redirect_to=" + redirectTo;
}

function pay()	{
    $.post("/transact/",
	    function(response)	{
		document.location = response.data.body;
	    });
}

function checkOut() {
    $.post("/checkout/",
	    function(response)	{
		// If request is made to login from shopping cart preview,
		// redirect_to should be "/delivery/"
		if (document.location.pathname == "/cart/preview/") {
		    if (response.data.body != "/delivery/") {
			document.location = response.data.body + "?redirect_to=/delivery/";
		    }
		} else	{
		    // This happens if the user is signed in before attempting a checkout.
		    document.location = response.data.body;
		}
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
