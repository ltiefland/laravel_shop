<!-- $Id: widerrufsformular.tpl 3350 2019-05-27 07:11:23Z erling $ BEGIN -->
{nocache}
<script>
$(document).ready(function(){
	var datepickerOpt = { dateFormat: 'dd.mm.yy',
        prevText: '&#x3c;zurück', prevStatus: '',
        prevJumpText: '&#x3c;&#x3c;', prevJumpStatus: '',
        nextText: 'Vor&#x3e;', nextStatus: '',
        nextJumpText: '&#x3e;&#x3e;', nextJumpStatus: '',
        currentText: 'heute', currentStatus: '',
        todayText: 'heute', todayStatus: '',
        clearText: '-', clearStatus: '',
        closeText: 'schließen', closeStatus: '',
        monthNames: ['Januar','Februar','März','April','Mai','Juni',
        'Juli','August','September','Oktober','November','Dezember'],
        monthNamesShort: ['Jan','Feb','Mär','Apr','Mai','Jun',
        'Jul','Aug','Sep','Okt','Nov','Dez'],
        dayNames: ['Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag'],
        dayNamesShort: ['So','Mo','Di','Mi','Do','Fr','Sa'],
        dayNamesMin: ['So','Mo','Di','Mi','Do','Fr','Sa'] };

    $('#bestelltid').datepicker(datepickerOpt);
	//$('#datewiderrufid').datepicker(datepickerOpt);
	$('#erhaltenid').datepicker(datepickerOpt);

    $('#bestelltid').click(function(){
        $('#bestelltid').datepicker('show');
    });
    
    /**
    $('#datewiderrufid').click(function(){
        $('#datewiderrufid').datepicker('show');
    });
    **/
    /** heutiges Datum eintragen **/
    var d = new Date();
    var today = d.getDate() + "." + (d.getMonth()+1) + "." + d.getFullYear(); 
    $('#datewiderrufid').val(today);
    
    $('#erhaltenid').click(function(){
        $('#erhaltenid').datepicker('show');
    });

    $('#submit').click(function(event){
        if(!validateInput()){
            event.preventDefault();    
        }
    });
});
</script>
<style>
    #add_basket_msg {
        display:none;
    }
    .hersteller_slider {
        display:none;
    }
    .box {
        font-size:12px!important;
    }
    .text {
        float:left;
        width:140px;
    }
    p {
        padding:4px 0 4px 0!important;
    }
    hr {
        margin:4px 0 4px 0!important;
    }
    h5 {
        font-size:12px!important;        
    }
</style>

<div class="inner" style="border-radius:0 0px 5px 5px;background-color:#f9f9f9;">
    <div class="typo3content">
<form id="widerruf_form" name="Widerruf" method="post" action="index.php">

{if $error==1}
    <p style="font-size:24px;color:#f00;font-weight:bold;">Bitte gib unbedingt die Bestellnummer mit an.</p>
{/if}
<input type="hidden" name="action" value="send_widerruf" />
<h1>Widerrufsformular</h1>
<p>
Bitte gib unbedingt deine IBAN Nummer mit an, falls du eine Zahlung per Nachnahme oder Vorkasse get&auml;tigt hast, damit eine schnelle R&uuml;ckabwicklung gew&auml;hrleistet werden kann. Im Falle einer Paypal-/Kreditkartenzahlung wird der Rechnungsbetrag ebenfalls auf das Paypal-/Kreditkartenkonto zur&uuml;ckgebucht.<br />
Hinweis: Bitte beachte, dass unfreie Pakete nicht angenommen werden k&ouml;nnen. 
</p>
<br />

	<p>
		<span class="text">
			An:
		</span>
            <br />
            {$ini.geschaeftsfuehrer_1}<br />
    		{$ini.firma}<br />
            {$ini.fa_strasse}<br />
            {$ini.fa_land}{$ini.fa_plz} {$ini.fa_ort}<br />
            Fax: {$ini.fax}<br />
            E-Mail: {$ini.infoemail}<br />
        
        
	</p>
    
    <hr />
    
    <p>
		<span class="text">
			Widerruf*:
		</span>
		<span class="">
			<textarea id="widerrufid" name="widerruf" cols="40" rows="7" class="" aria-required="true" aria-invalid="false">Hiermit widerrufe(n) ich/wir den von mir/uns abgeschlossenen Vertrag &uuml;ber den Kauf der folgenden Waren / die Erbringung der folgenden Dienstleistung:
			</textarea>
            <small><br />
			 Hinweis: Bitte Unzutreffendes streichen und um Ihren Text erg&auml;nzen.
             
            </small>
		</span>
	</p>
	<p>
		<span class="text">
			Bestellnummer*:
		</span>
		<span class="">
			<input type="number" id="bestellnummer" name="bestellnummer" value="" size="40" aria-required="true" min="99999" max="999999" required="required" />
		</span>
	</p>
	<p>
		<span class="text">
			Bestellt am*:
		</span>
		<span class="">
			<input type="text" id="bestelltid" name="bestellt" value="" size="40" class="datepicker" aria-required="true" />
		</span>
	</p>
	<p>
		<span class="text">
			Erhalten am:
		</span>
		<span class="">
			<input type="text" id="erhaltenid" name="erhalten" value="" size="40" class="datepicker" />
		</span>
	</p>
	<hr />
	<h5>
		Name des/der Verbraucher(s)
	</h5>
	<p>
		<span class="text">
			Anrede*:
		</span>
		<span class="">
			<select id="anredeid" name="anrede" class="" aria-invalid="false">
				<option value="">
					---
				</option>
				<option value="Frau">
					Frau
				</option>
				<option value="Herr">
					Herr
				</option>
			</select>
		</span>
	</p>
    
	<p style="clear:both;float:none;">
		<span class="text">
			Vorname*:
		</span>
		<span class="">
			<input type="text" id="your-firstnameid" name="your-firstname" value="" size="40" class="" aria-required="true" aria-invalid="false" />
		</span>
	</p>
	<p>
		<span class="text">
			Nachname*:
		</span>
		<span class="">
			<input type="text" id="your-nameid" name="your-name" value="" size="40" class="" aria-required="true" aria-invalid="false" />
		</span>
	</p>
	<hr />
	<h5>
		Anschrift des/der Verbraucher(s)
	</h5>
	<p>
		<span class="text">
			Stra&szlig;e/Nr.*:
		</span>
		<span class="">
			<input type="text" id="adressid" name="adress" value="" size="40" class="" aria-required="true" aria-invalid="false" />
		</span>
	</p>
	<p>
		<span class="text">
			PLZ/Ort*:
		</span>
		<span class="">
			<input type="text" id="cityid" name="city" value="" size="40" class="" aria-required="true" aria-invalid="false" />
		</span>
	</p>
	<p>
		<span class="text">
			Land
		</span>
		<span class="">
			<input type="text" id="countryid" name="country" value="" size="40" class="" aria-invalid="false" placeholder="" />
		</span>
	</p>
	<hr />
	<h5>
		Ihre E-Mail, um den Erhalt des Widerrufs unverz&uuml;glich zu best&auml;tigen
	</h5>
	<p>
		<span class="text">
			Ihre E-Mail*
		</span>
		<span class="">
			<input type="email" id="your-emailid" name="your-email" value="" size="40" class="" aria-required="true" aria-invalid="false"
			/>
		</span>
	</p>

	<p>
		<span class="text">
			Widerrufsdatum*:
		</span>
		<span class="">
			<input type="text" id="datewiderrufid" name="datewiderruf" readonly="readonly" size="40" class="" aria-required="true" />
		</span>
	</p>
	<p>
        <div class="onprint"><br />
            <input type="text" style="width:300px;" /><br />
            Unterschrift
        </div>
        {if $smarty.session.debug!=1}
		Zum erkl&auml;ren des Widerrufes bitte das Captcha lösen!
		<div id="recaptchaid"></div>
        {/if}
		
      {*  <input style="padding:4px;" type="submit" id="submit" value="Widerruf erkl&auml;ren" /> *}        
	</p>
	<small>
		* Pflichtfelder<br />
        <div class="noprint">HINWEIS: Sie k&ouml;nnen dieses Formular auch <a style="text-decoration:underline!important;" href="javascript:print();">ausdrucken</a> und z.B. per Post oder Fax verschicken.</div>
	</small>
    <input type="hidden" name="no_docs" value="1" />
    <input type="hidden" name="action" value="send_widerruf" />
</form>
    </div>
</div>
{/nocache}
<!-- $Id: widerrufsformular.tpl 3350 2019-05-27 07:11:23Z erling $ END -->