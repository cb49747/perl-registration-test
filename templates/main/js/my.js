function isReady(form) {
	if (isElement(form.firstname) == false) {
		alert("Please Include Your First Name");
		return false;
	}
	if (isElement(form.lastname) == false) {
		alert("Please Include Your Last Name");
		return false;
	}
	if (isElement(form.address1) == false) {
		alert("Please Include Your Address Line 1");
		return false;
	}
	if (isElement(form.city) == false) {
		alert("Please Include Your City");
		return false;
	}
		if (isElement(form.state) == false) {
		alert("Please Include Your State");
		return false;
	}
	if (isElement(form.zip) == false) {
		alert("Please Include Your Zip");
		return false;
	}
	if (isElement(form.country) == false) {
		alert("Please Include Your Country");
		return false;
	}
	
	if (form.firstname.value.length > 25) {
		alert("Your First Name Can Not Be Greater Than 25 Characters.");
		return false;
	}
	if (form.lastname.value.length > 25) {
		alert("Your Last Name Can Not Be Greater Than 25 Characters.");
		return false;
	}
	if (form.address1.value.length > 45) {
		alert("Your Address Line 1 Can Not Be Greater Than 45 Characters.");
		return false;
	}
	if (form.address2.value.length > 45) {
		alert("Your Address Line 2 Can Not Be Greater Than 45 Characters.");
		return false;
	}
	if (form.city.value.length > 45) {
		alert("Your City Can Not Be Greater Than 45 Characters.");
		return false;
	}
	if (form.state.value.length > 2) {
		alert("Your State Name Can Not Be Greater Than 2 Characters.  Please Use 2 Character Code For Your State.");
		return false;
	}
	if (form.zip.value.length > 10 || form.zip.value.length < 5) {
		alert("Your zip code Can Not Be Greater Than 9 Digits Or Less Than 5 Digits.");
		return false;
	}
	if (form.country.value.length > 2) {
		alert("Your Country Name Can Not Be Greater Than 2 Characters.  Please Use A 2 Character Code For Your Country.");
		return false;
	}
	
    var pattern1 = new RegExp(/^[a-z0-9 ]+$/i); //acceptable chars not null
    var pattern2 = new RegExp(/^[a-z0-9 ]*$/i); //acceptable chars null
    var pattern3 = new RegExp(/^[A-Z]+$/i);     //acceptable chars not null
    var pattern4 = new RegExp(/^[0-9-]+$/i);    //acceptable chars not null
    
    if (pattern1.test(form.firstname.value)) { 1; } else {
        alert("Please only use standard alphanumerics for your First Name.");
        return false;
    }
    if (pattern1.test(form.lastname.value)) { 1; } else {
        alert("Please only use standard alphanumerics for your Last Name.");
        return false;
    }
    if (pattern1.test(form.address1.value)) { 1; } else {
        alert("Please only use standard alphanumerics for your Address Line 1.");
        return false;
    }
    if (pattern2.test(form.address2.value)) { 1; } else {
        alert("Please only use standard alphanumerics for your Address Line 2.");
        return false;
    }
    if (pattern1.test(form.city.value)) { 1; } else {
        alert("Please only use standard alphanumerics for your City Name.");
        return false;
    }
    if (pattern3.test(form.state.value)) { 1; } else {
        alert("Please only use standard alpha characters for your State Name.");
        return false;
    }

    if (pattern4.test(form.zip.value)) { 1; } else {
        alert("Please only use standard numerics and a dash for your Zip Code.");
        return false;
    }
    if (pattern3.test(form.country.value)) { 1; } else {
        alert("Please only use standard alpha characters for your Country Name.");
        return false;
    }
    
    var ls = form.state.value;
    var lc = form.country.value;
    form.state.value = ls.toUpperCase();
    form.country.value = lc.toUpperCase();
	
	return true;
}

function isElement(elm) {
	if (elm.value !="") return true;
	else return false;
}