$(document).ready(function(){
    /* usercentrics override buttoncolor */
    var bgc = $('#uc-btn-accept-banner').css("background");
    console.log("bgc: " + bgc);
    $('#uc-btn-deny-banner').css("background-color",bgc + "!important");
    
     
});