<div class="box">
    <img src="/images/popup/keyvisual_kochschinken.jpg" alt="" />
    <div style="font-family:thirsty_roughregular_one;font-size:2.3em;color:#EA5802;">Herzlich Willkommen</div>
    <div>
        F&uuml;r Ihren ersten Einkauf erhalten Sie einen exclusiven <strong>5 &euro; Willkommensrabatt*</strong> an Ihre E-Mailadresse.<br /><br />
        <strong>E-Mail Adresse eingeben:</strong><br />
    </div>
    <form id="newsletter_register" name="newsletter_register" onsubmit="return false;">
        <input id="newsletter_email" type="text" name="newsletter_email" placeholder="Ihre E-Mailadresse" style="float:left;"/>
        <input type="image" src="/images/popup/but_jetzt-absenden.png" id="butt_ok" style="float:left;max-width:190px;height:auto;" />
        <div id="newsletter_msg" style="text-align:left;float:left;padding:10px;"></div>
        <input type="hidden" value="newsletter_reg" name="action" />
        <input type="text" name="newsletter_email_capt" style="display:none;" value="" />  
    </form>
    <div style="clear:both;float:none;font-size:11px;">Der Gutscheincode ist einmalig g&uuml;ltig.<br />
    Einl&ouml;sbar ab einem Mindestbestellwert von 25 &euro;</div>
        
</div>
<script>
$(document).ready(function(){
    $("#newsletter_register").keyup(function(e) {
       if(e.keyCode == 13) {
          $("#butt_ok").trigger("click");
       }
    });

    $('#butt_ok').click(function(){
        var formdata = $('#newsletter_register').serialize();
        $('#newsletter_msg').load('/module/newsletter_register.php', formdata, function(data){});
    });
});
</script>