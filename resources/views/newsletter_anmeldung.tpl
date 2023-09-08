<div class="newsletter_anmeldung">
    <h3>Newsletteranmeldung</h3>
    <p style="font-size:1.1rem;">Melde dich an und erhalte regelm&auml;&szlig;ig aktuelle Informationen zu tollen Angeboten.</p>    
    <form id="newsletter_register" name="newsletter_register" onsubmit="return false;">
        <input id="newsletter_email" type="text" name="newsletter_email" placeholder="Deine E-Mailadresse f&uuml;r unseren Newsletter" />
        <input type="hidden" value="newsletter_reg" name="action" />
        <input type="text" name="newsletter_email_capt" style="display:none;" value="" />
        <input class="shopButton" type="submit" id="butt_ok" value="Anmelden" />  
    </form>
    
    <div id="newsletter_msg"></div>    
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
        $('#newsletter_msg').css("background-color","#fff");
    });
});
</script>

<style>
    .newsletter_anmeldung {
        width:96%;
        margin:2% auto;
        padding: 1% 2%;
        display:block;
        text-align:center;
        background:#fff;
        padding:2%;
        color:#112530;
        
    }
    .newsletter_anmeldung h3 {
        padding:1% 0;
        font-size:1.4rem;
    }
    #newsletter_register {
        display:flex;
        gap:10px;
        justify-content: center;
    }
    #newsletter_email {
        margin:0;
    }
    .newsletter_anmeldung input[type=text] {
        outline: none;
        border-style: none;
        border: none;
        border-radius: 5px;
        padding: 10px 10px;
        z-index: 10;
        float: left;
        margin-top: 10px;
        display: block;
        width: 100%;
        max-height: 30px;
        background-color:#898989!important;
        color: #fff;                
    }
    /* newsletter anmeldung im footer */
    #newsletter_msg {
        padding: 2%;
        background-color:transparent!important;
        text-align:center;
    }
    #newsletter_email {
        outline: none;
        padding: 6px 2%;
        border-style: none;
        z-index: 10;
        float: left;
        width: 60%;
        height:31px;
    }
    #butt_ok {
        border-style:none;
        border-radius:5px;
        outline: none;
        float: left;
        margin: 0px 0px !important;
        font-size:15.4px;
        height:43px;
        color:#fff;
        background:#ffd03a;
        transition:all 200ms ease;
    }
    #butt_ok:hover,
    #butt_ok:focus {
        background-color:#ea5802;
    }
    
    
</style>