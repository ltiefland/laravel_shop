// validate Email

function validateEmail(email,err) {
    var atpos=email.indexOf("@");
    var dotpos=email.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
        alert(err);
        return false;
    }
    return true;
}