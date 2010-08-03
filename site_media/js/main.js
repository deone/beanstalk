var options = {
    url: null,
    type: "POST",
    data: null,
    dataType: "json",
    success: null,
    error: function(response)	{
	alert(response);
    }
}

function checkOut(userId) {
    var sessionId = getCookie("sessionid");

    $.post("/order/checkout/", { session_id: sessionId, user_id: userId },
	    function(response)	{
		alert(response.data.body);
		document.location = response.data.body;
	    }
    );
}

function getCookie(cookieName)	{
    if (document.cookie)    {
	var results = document.cookie.match('(^|;) ?' + cookieName + '=([^;]*)(;|$)');
	if (results)    {
	    return (unescape(results[2]));
	} else  {
	    return null;
	}
    }
}

function displayShoppingCart(sessionId)	{

    options["url"] = "/cart/" + sessionId + "/";
    options["success"] = function(response) {
	quantity = response.data.body.items_quantity
	price = response.data.body.items_price
	if (quantity < 1)   {
	    $("#cart_indicator input").attr("disabled", "disabled");
	} else	{
	    $("#cart_indicator input").attr("disabled", "");
	}
	$("#cart_details").html(quantity + " items, " + "N" + price + ".00");
    }

    $.ajax(options);
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

    var sessionId = getCookie("sessionid");
    displayShoppingCart(sessionId);
});
