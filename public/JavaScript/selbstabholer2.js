
<!--
    var media4less_361983_bigImgLoad = false;
    var media4less_361983_kleinimg;
    var media4less_361983_div = "";
    var media4less_361983_img = "";
    var media4less_361983_href = "";
    var media4less_361983_title = "";
    var media4less_361983_ID = "361983";
    var media4less_361983_fadeIn = 45;
    
    var media4less_361983_IsfadeIn = false;
    var media4less_361983_IsfadeOut = false;

    load_img = new Image();
    load_img.src = 'http://www.media4less.at/images/webelemente/selbstabholer_detailseite.jpg';
    
    //load_img2 = new Image();
    //load_img2.src = 'http://rating.media4less.de/de-de/small/upmy/361983.jpg';
    
    document.write("<div id='media4less_361983_div' style='display:none; cursor:pointer; position:absolute; left:0px; top:0px; width:134px; height:265px; z-index:99999;'></div>");
    
    function media4less_361983_OnMouseOver(el) {
        if (!media4less_361983_bigImgLoad) {
            media4less_361983_bigImgLoad = true;
            
            if (this.noHref) {
                media4less_361983_varOnClick = " style='cursor:auto;' ";
                media4less_361983_href = "";
                media4less_361983_title = document.getElementById('media4less_361983').getAttribute('alt', 0);
            } else {
                media4less_361983_varOnClick = " onClick='JavaScript:media4less_361983_onClick()' style='cursor:hand;' ";
                media4less_361983_href = document.getElementById('media4less_361983').getAttribute('href', 0);
                media4less_361983_title = document.getElementById('media4less_361983').getAttribute('title', 0);
            }

/*
            media4less_361983_div = "<img src='http://rating.media4less.de/de-de/big/upmy/361983.jpg' ";
            media4less_361983_div += " alt='" + media4less_361983_title + "' ";
            media4less_361983_div += " align='absmiddle' width='134' height='265' border='0' ";
            media4less_361983_div += " onMouseOut='media4less_361983_OnMouseOut(this)' ";
            media4less_361983_div += media4less_361983_varOnClick;
            media4less_361983_div += ">";
*/

           media4less_361983_div = '<div name="selbstabholer" onMouseOut="media4less_361983_OnMouseOut(this)"';
           media4less_361983_div += media4less_361983_varOnClick + '>';
            media4less_361983_div = '<form action="#" method="post" name="selbstabholer">';
           media4less_361983_div += '<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td>Name</td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td><label for="Name"></label>';
           media4less_361983_div += '<input type="text" name="Name" id="Name" /></td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td>Telefon</td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td><input type="text" name="Name" id="Name" /></td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td>E-Mail</td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td><input type="text" name="Name" id="Name" /></td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td><p>Sie k&ouml;nnen Ihre reservierte Ware innerhalb von 5 Werktagen bei uns vor Ort abholen:</p>';
           media4less_361983_div += '<p>Mo.-Fr.:   09:00 - 20:00 Uhr<br />';
           media4less_361983_div += 'Sa.:        10:00 - 20:00 Uhr</p>';
           media4less_361983_div += '<p>Bitte beachten Sie, dass Ihre Bestellung erst nach Best&auml;tigung per E-Mail g&uuml;ltig ist.';
           media4less_361983_div += '</p></td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '<tr>';
           media4less_361983_div += '<td><img class="slImage" src="/images/webelemente/selbstabholer_bt_ok.gif" alt="ok?" /></td>';
           media4less_361983_div += '</tr>';
           media4less_361983_div += '</table>';
           media4less_361983_div += '</form></div>';
        
            media4less_361983_fadeIn = 45;
            document.getElementById('media4less_361983_div').style.height = media4less_361983_fadeIn; + "px";
            
            document.getElementById('media4less_361983_div').style.overflow = "hidden";
            document.getElementById('media4less_361983_div').style.top = media4less_361983_absTop(el) + "px";
            document.getElementById('media4less_361983_div').style.left = media4less_361983_absLeft(el) + "px";
            document.getElementById('media4less_361983_div').innerHTML = media4less_361983_div; 
            document.getElementById('media4less_361983_div').style.display =  ""; 
            
            media4less_361983_IsfadeIn = true;
            if (!media4less_361983_IsfadeOut) {
                media4less_361983_fade();
            }
        }
    }

    function media4less_361983_fade() {
            media4less_361983_fadeIn += 20;
            document.getElementById('media4less_361983_div').style.height = media4less_361983_fadeIn + "px";
            
            if (media4less_361983_fadeIn < 265) {
                window.setTimeout("media4less_361983_fade()", 20);
            } else {
                media4less_361983_IsfadeIn = false;
                if (media4less_361983_IsfadeOut == true) {
                    media4less_361983_fadeOut();
                }
            }
    }
    
    function media4less_361983_fadeOut() {
            media4less_361983_fadeIn -= 20;
            document.getElementById('media4less_361983_div').style.height = media4less_361983_fadeIn + "px";
            if (media4less_361983_fadeIn > 35) {
                window.setTimeout("media4less_361983_fadeOut()", 20);
            } else {
                document.getElementById('media4less_361983_div').style.display = "none"; 
                media4less_361983_bigImgLoad = false;
                
                media4less_361983_IsfadeOut = false;
                if (media4less_361983_IsfadeIn == true) {
                    media4less_361983_fade();
                }
            }
    }

    function media4less_361983_onClick() {
        if (this.varmedia4lessWinOpenParam) { 
            media4less_361983_fen = window.open(media4less_361983_href, "media4less_361983_fen", varmedia4lessWinOpenParam); 
        } else { 
            media4less_361983_fen = window.open(media4less_361983_href, "media4less_361983_fen"); 
        }
        //media4less_361983_fen = window.open(media4less_361983_href, "media4less_361983_fen");
        media4less_361983_fen.focus();
    }

    function media4less_361983_OnMouseOut(el) {
        //if (media4less_361983_bigImgLoad) {
            media4less_361983_IsfadeOut = true;
            if (!media4less_361983_IsfadeIn) {
                media4less_361983_fadeOut();
            }
            //document.getElementById('media4less_361983_div').style.display =  "none"; 
            //media4less_361983_bigImgLoad = false;
        //}
    }

    function media4less_361983_absLeft(el) {
        return document.getElementById('media4less_361983_content').offsetLeft;
    }

    function media4less_361983_absTop(el) {
        return document.getElementById('media4less_361983_content').offsetTop;
    }
    

//-->