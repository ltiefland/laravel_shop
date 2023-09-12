{extends file="buy.tpl"}
{block name="buyStep"}
    {$old = old()}
<!-- $Id: buy_1.tpl 2508 2022-10-12 11:26:41Z erling $ BEGIN -->
    {if !$smarty.session.SHOP.Login && !$smarty.get.account && !$smarty.post.step && !$mode_error && !$smarty.get.anfrage}
    <div class="basketNav2">
        <div class="steps_headline mobile">
            <h1>Kundenkonto</h1>
        </div>
        {*
        <div class="steps_image desktop">
            <img onerror="this.src='/images/webelemente/bestellprozess_step1_active.png'" src="/images/webelemente/svg/bestellprozess_step1_active.svg" alt="Schritt f�r Schritt durch die Bestellung" />
        </div>
        *}
    </div> 
{if $smarty.session.isMobile == true}
    <div class="mobile_options_buy_1">
    <div class="grid-container">
    <div class="buttons_selection">
    <div class="mobil_buy_buttons_options">
    <div class="options_buy_1">
    <div class="bestellartButtons_mobile">
        <a href="/bestellen_seite_1.html?account=guest" class="weiterButton_mobile" title="Gastkunde weiter">
            {$langstrings.buy.gast_Kunde_short}
        </a>
    </div>
                
    <div class="bestellartButtons_mobile">
        <a href="/bestellen_seite_1.html?account=new"class="weiterButton_mobile" title="Neukunde weiter">
            {$langstrings.buy.neuer_Kunde_short}
        </a>
    </div>
    </div>
    </div>
    </div>
    <div class="mobile_buy_login">
    <div class="login-page">
    <p>{$langstrings.buy.registrierter_Kunde_headline}</p>
  <div class="form_mobile_buy1">
    <form class="login-form_mobile" action="{$SCRIPT_NAME}" method="post" name="login" id="login">
        <input type="hidden" name="_token" value="{csrf_token()}" />
      <input type="text" name="email" value="{$smarty.session.SHOP.buy.Persdata.email}" placeholder="{$langstrings.login.username}"/>
      <input type="password" name="password" placeholder="{$langstrings.login.password}"/>
      <button onclick="document.login.submit();">Anmelden</button>
      <input type="hidden" name="return" value="true" />
      <input type="hidden" name="mode" value="loginOrder" />
      <div style="clear: both;">{$langstrings.buy.forgot_pw}</div>
    </form>
    </div>
    </div>
    </div>
    </div>
    </div>

    {else}
     <div class="box_2" style="float:left;width:100%;padding: 50px 0;">
        <div class="bestellartWrapper">
            <span class="bestellartHeadline">{$langstrings.buy.gast_Kunde_headline}</span>
            <div class="bestellartbox">                  
                <div class="bestellartInfoText">{$langstrings.buy.gast_Kunde}</div>
                <div class="bestellartButtons">
                    <a href="/bestellen_seite_1.html?account=guest" class="shopButton" title="Gastkunde weiter">
                        WEITER 
                    </a>
                </div>
            </div>
        </div>

        <div class="bestellartWrapper">
            <span class="bestellartHeadline">{$langstrings.buy.neuer_Kunde_headline}</span>
            <div class="bestellartbox"> 
                <div class="bestellartInfoText">{$langstrings.buy.neuer_Kunde}</div><br />
                <div class="bestellartButtons">
                    <a href="/bestellen_seite_1.html?account=new" class="shopButton" title="Neukunde weiter">
                        WEITER 
                    </a>
                </div>
            </div>
        </div>
        <div class="bestellartWrapper">
            <span class="bestellartHeadline">{$langstrings.buy.registrierter_Kunde_headline} </span>
            <div class="bestellartbox">
                <div class="bestellartInfoText">
                    <form action="{$SCRIPT_NAME}" method="post" name="login" id="login">
                        <input type="hidden" name="_token" value="{csrf_token()}" />
                        <div class="bestellartLogin">
                            <input  class="input input1" type="text" name="email" value="{$smarty.session.SHOP.buy.Persdata.email}" placeholder="{$langstrings.login.username}" />
                        </div>
                        <div class="bestellartLogin">
                            <input  class="input input1" type="password" name="password" placeholder="{$langstrings.login.password}"/>
                        </div>
                        
                        <input type="hidden" name="return" value="true" />
                        <input type="hidden" name="mode" value="loginOrder" />
                    </form>
                    <br />
                    <div style="clear: both;">{$langstrings.buy.forgot_pw}</div>
                </div>
                <div class="bestellartButtons">
                    <input type="submit" id="login_button" value="LOGIN" onclick="document.login.submit();"/>
                </div>
            </div>
        </div>
        
    </div>
    {/if}
    {else}
        <script>
            {if $smarty.session.SHOP.Lieferadresse=="true"}
            var land = {$smarty.session.SHOP.buy.Persdata.liefer_Land|default:$defaultLandID:47};
            {else}
            var land = {$smarty.session.SHOP.buy.Persdata.Land|default:$defaultLandID:47};
            {/if}
        </script>
        <div class="basketNav2">
            {if $smarty.get.account == "new" || $mode_error == "new"}
                <div class="steps_headline mobile">
                    <h1>Kundenkonto</h1>
                </div>
                {*
                <div class="steps_image desktop">
                    <img onerror="this.src='/images/webelemente/bestellprozess_step1_active.png'" src="/images/webelemente/svg/bestellprozess_step1_active.svg" alt="Schritt f�r Schritt durch die Bestellung" />
                </div>
                *}
            {else}
                <div class="steps_headline mobile">
                    <h1>Kundenkonto</h1>
                </div>
                {*
                <div class="steps_image desktop">
                    <img onerror="this.src='/images/webelemente/bestellprozess_step2_active.png'" src="/images/webelemente/svg/bestellprozess_step2_active.svg" alt="Schritt f�r Schritt durch die Bestellung" />
                </div>
                *}
            {/if}
        </div>
        <div class="box_2" id="kundendaten">
            <div>
                {if $smarty.get.anfrage==1}
                <table class="basket_table">
                    <tr>
                        <th class="basket_head1" colspan="2">Projektanfrage</th>
                    </tr>
                    <tr>
                        <td>
                            Diese Anfragefunktion ist f&uuml;r Kunden gedacht, die vor der Auftragserteilung ein Angebot ben&ouml;tigen.
                            Bitte geben Sie Ihre pers&ouml;nlichen Daten ein. <br />Wir werden Ihre Anfrage so schnell wie m&ouml;glich bearbeiten und uns mit Ihnen in Verbindung setzen.
                        </td>
                    </tr>
                </table>
                {/if}
                
                {assign var=step value=$smarty.session.SHOP.buy.step}
                
                {if $smarty.get.account == "guest" || $mode_error != "guest"}
                    {assign var=step value=$step+1}
                {/if}
                {if $ini.klarna.aktiv==1||$ini.PayPalPlus.aktiv==1||$ini.PayPalCheckout.aktiv==1}
                {assign var=step value="1a"}
                {/if}
                <form class="basket_form" action="{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_{$step}.html?account={$accountMode}" method="post" name="buy" id="buy_form">
                    <input type="hidden" name="_token" value="{csrf_token()}" />
                    {if $smarty.get.account == "new" || $mode_error == "new"}
                        <input type="hidden" name="Lieferadresse" value="false" />
                        {include file="buy_1_newuser.tpl" bestellvorgang=true}
                        {include file="rechnung.tpl"}
                    {else}
                        {include file="rechnung.tpl"}
                    {/if}

                        
                        {if $smarty.get.anfrage!=1}
                        <div class="adressdaten">
                            <div>
                                <br /><br />
                                <div class="placeholder">Bemerkungen:</div>
                                <textarea name="Persdata[Bemerkung]" cols="40" rows="4">{$smarty.session.SHOP.buy.Persdata.Bemerkung}</textarea>
                            </div>
                        </div>
                        
                        <div class="break" style="height:15px;"></div>
                        <table class="basket_table" style="width:100%;">
                            
                            <tr>
                                <th class="basket_head1">{$langstrings.buy.choose_shipping_address}</th>
                            </tr>
                            
                        </table>
                        <table style="width:100%;background-color:#f8f8f8;font-size:14px!important;">
                            <tr>
                                <td class="liefer_select">
                                    
                                    <input type="radio" class="radio lieferadresseChangeRadio" id="Lieferadresse_f" name="Lieferadresse" value="false" {if ( $smarty.session.SHOP.Lieferadresse != "true" )} checked="checked"{/if} /><label for="Lieferadresse_f"> Wie Rechnungsadresse</label>
                                    
                                    <input style="margin-left:15px;" type="radio" class="radio lieferadresseChangeRadio" id="Lieferadresse_t" name="Lieferadresse" value="true" {if ( $smarty.session.SHOP.Lieferadresse == "true" )} checked="checked"{/if} /><label for="Lieferadresse_t" style=""> andere</label>
                                        
                                    {if $ini.logistiker.dhlID}
                                    <label for="Lieferadresse_p" style="margin-left:15px;cursor:pointer;">
                                        <input type="radio" class="radio lieferadresseChangeRadio" id="Lieferadresse_p" name="Lieferadresse" value="packstation"  {if $smarty.session.SHOP.Lieferadresse=="packstation"} checked="checked"{/if}/>
                                        <img src="/images/webelemente/packstation-small.png" /> / Postfiliale
                                    </label>
                                    {/if}
                                </td>
                            </tr>
                        </table>
                        <div id="Lieferadresse" style="{if $smarty.session.SHOP.Lieferadresse!="true" || $smarty.session.SHOP.Lieferadresse=="packstation"}display:none;{/if}float:left;width:100%;">
                            
                            <style>
@media screen and (max-width:1000px) {
    #buy_form .basket_table {
        max-width:96%;
    }
    #buy_form .basket_table td:first-of-type {
        width:100%%;
        max-width:100%;
    }                           
    
}
    
@media screen and (min-width:1000px) {
    #buy_form .basket_table {
        margin:0 auto;
    }
    #buy_form .basket_table td {
        width:80%;
    }
    #buy_form .basket_table td:first-of-type {
        max-width:20%!important;
        width:20%!important;
    }
                               
    .loginInfo input, .bestellvorgang textarea, .bestellvorgang select, .bestellvorgang input[type="text"], .bestellvorgang input[type="email"], .bestellvorgang input[type="password"], #gs_code, .versand_laenderauswahl select {
            width:100%;
    } 
    
    
}                            
                            </style>
                            <div class="adressdaten">
                                <div>
                                    <br /><br />
                                    {html_options name="Persdata[liefer_Anrede]" options=$anreden selected=$smarty.session.SHOP.buy.Persdata.liefer_Anrede class="adresse"}</td>
                                </div>

                                <div class="addr_100">
                                    <div class="addr_50">
                                        <div class="placeholder">Vorname</div>
                                        <input type="text" name="Persdata[liefer_Vorname]" class="text adresse" value="{$smarty.session.SHOP.buy.Persdata.liefer_Vorname}" maxlength="31" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>

                                    <div class="addr_50">
                                        <div class="placeholder">Nachname</div>
                                        <input type="text" name="Persdata[liefer_Nachname]" class="text adresse" value="{$smarty.session.SHOP.buy.Persdata.liefer_Nachname}" maxlength="31" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>
                                </div>
                                
                                <div>
                                    <div class="placeholder">Firmenname</div>
                                    <input type="text" name="Persdata[liefer_Firma]" class="text" maxlength="31" />
                                </div>

                                <div class="addr_100">
                                    <div class="addr_50">
                                        <div class="placeholder">Stra&szlig;e</div>
                                        <input type="text" class="text" name="Persdata[liefer_Strasse]" value="{$smarty.session.SHOP.buy.Persdata.liefer_Strasse}" maxlength="31" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>

                                    <div class="addr_50">
                                        <div class="placeholder">Hausnummer</div>
                                        <input type="text" class="text adresse" name="Persdata[liefer_Hausnummer]" value="{$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer}" maxlength="31" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>
                                </div>

                                <div class="addr_100">
                                    <div class="addr_50">
                                        <div class="placeholder">PLZ</div>
                                        <input type="text" class="text" name="Persdata[liefer_PLZ]" id="plz2" size="3" value="{$smarty.session.SHOP.buy.Persdata.liefer_PLZ}" maxlength="31" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>

                                    <div class="addr_50">
                                        <div class="placeholder">Ort</div>
                                        <input type="text" name="Persdata[liefer_Ort]" id="ort2" class="text adresse" value="{$smarty.session.SHOP.buy.Persdata.liefer_Ort}" maxlength="31" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>
                                </div>
                                

                                
                                <div>
                                    {html_options options=$smarty.session.SHOP.BASKET->shippingCountries id="liefer_Land" name="Persdata[liefer_Land]"
                                    selected=$smarty.session.SHOP.buy.Persdata.liefer_Land|default:$defaultLandID class="adresse"}
                                </div>                
                            
                            </div>
                        </div>                  
                        {if $ini.logistiker.dhlID}
                        <div id="packstation" {if $smarty.session.SHOP.Lieferadresse!="packstation"}style="display:none;"{/if}>
                            <div class="adressdaten">
                                <br>
                                <br>
                                <div class="addr_100">
                                    <div class="addr_50">
                                        <div class="placeholder">Vorname</div>
                                        <input type="text" name="Persdata[liefer_Vorname_pst]" class="text" value="{$smarty.session.SHOP.buy.Persdata.liefer_Vorname_pst}"  />
                                        <input type="hidden" name="req[liefer_Vorname]" value="lieferadresse" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>
                                    <div class="addr_50">
                                        <div class="placeholder">Nachname</div>
                                        <input type="text" name="Persdata[liefer_Nachname_pst]" class="text" value="{$smarty.session.SHOP.buy.Persdata.liefer_Nachname_pst}"  />
                                        <input type="hidden" name="req[liefer_Nachname]" value="lieferadresse" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>
                                </div>

                                <div>
                                    <div class="placeholder">Postnummer</div>
                                    <input type="text" name="Persdata[liefer_Firma_pst]" class="text" value="{$smarty.session.SHOP.buy.Persdata.liefer_Firma_pst}"  />
                                    <input type="hidden" name="req[liefer_Firma]" value="lieferadresse" />
                                    <span class="input_error_msg">Pflichtfeld</span>
                                </div>

                                <div class="addr_100">
                                    <div class="addr_50">
                                        {html_options name="Persdata[liefer_Strasse_pst]" id="str_pst" output=","|explode:"Packstation,Postfiliale" values=","|explode:"Packstation,Postfiliale"}
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>
                                    <div class="addr_50">
                                        <div class="placeholder">Abholort-Daten</div>
                                        <input type="text" class="text" name="Persdata[liefer_Hausnummer_pst]" value="{$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer_pst}"  id="nr_pst" />
                                        <input type="hidden" name="req[liefer_Str_Nr]" value="lieferadresse" />
                                        <input type="button" value="Packstation / Filiale finden" id="post_finder" />
                                        <span class="input_error_msg">Pflichtfeld</span>
                                    </div>
                                </div>

                                <div class="addr_100">
                                    <div class="addr_50">
                                        <div class="placeholder">PLZ der Packstation</div>
                                        <input type="text" class="text" name="Persdata[liefer_PLZ_pst]" value="{$smarty.session.SHOP.buy.Persdata.liefer_PLZ_pst}"  id="plz_pst" />
                                        <input type="hidden" name="req[liefer_PLZ]" value="lieferadresse" />
                                    </div>
                                    <div class="addr_50">
                                        <div class="placeholder">Ort der Packstation</div>
                                        <input type="text" name="Persdata[liefer_Ort_pst]" class="text" value="{$smarty.session.SHOP.buy.Persdata.liefer_Ort_pst}"  id="ort_pst" />
                                        <input type="hidden" name="req[liefer_Ort]" value="lieferadresse" />
                                    </div>
                                </div>

                                <div>
                                    <input type="text" class="text" value="Deutschland" disabled/>
                                    <input type="hidden" value="47" name="Persdata[liefer_Land_pst]" />
                                </div>
                            </div>
                        </div>
                        {/if}
                        <div class="break" style="height:15px;"></div>
                        <table class="basket_table">
                            {if $ini.dhl.plzFinder==1}
                            <tr>
                                <td>
                                    <div id="plz_ok" style="display:none;" class="kurier">
                                        <input type="hidden" name="kurier_active" value="0" />
                                        <label>
                                            <input type="checkbox" value="1" id="kurier_active" name="kurier_active" /><a href="/kurier.html">
                            <img src="/images/webelemente/dhlkurier/sdd-icon-klein.png" alt="SDD-Versand" onmouseover="return {$item.sameDayDeliverText};" onmouseout="return nd();"/>
                        </a>Kurierzustellung aktivieren (Kosten: 19,90€)<br />
                                        </label>
                                        <table>
                                            <tr>
                                                <td>Wunschtag</td>
                                                <td>Wunschzeit</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    {assign var="datum" value=$smarty.now|date_format:"%x"}
                                                    Heute {$smarty.now|date_format:"%A"} {$datum}
                                                </td>
                                                <td>
                                                    <input type="radio" name="kurier" id="today_10" value="today_10" />
                                                    <label for="today_10">10 bis 12 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="today_12" value="today_12" />
                                                    <label for="today_12">12 bis 14 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="today_14" value="today_14" />
                                                    <label for="today_14">14 bis 16 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="today_16" value="today_16" />
                                                    <label for="today_16">16 bis 18 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="today_18" value="today_18" />
                                                    <label for="today_18">18 bis 20 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="today_20" value="today_19" />
                                                    <label for="today_19">19 bis 21 Uhr</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                {if ($smarty.now|date_format:"%u")>5}
                                                {else}
                                                {assign var=datum_mo value=($smarty.now+86400)|date_format:"%x"}
                                                Morgen {($smarty.now+86400)|date_format:"%A"} {$datum_mo}
                                                {/if}
                                                </td>
                                                <td>
                                                    <input type="radio" name="kurier" id="tomorrow_10" value="tomorrow_10" />
                                                    <label for="tomorrow_10">10 bis 12 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="tomorrow_12" value="tomorrow_12" />
                                                    <label for="tomorrow_12">12 bis 14 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="tomorrow_18" value="tomorrow_14" />
                                                    <label for="tomorrow_14">14 bis 16 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="tomorrow_16" value="tomorrow_16" />
                                                    <label for="tomorrow_16">16 bis 18 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="tomorrow_18" value="tomorrow_18" />
                                                    <label for="tomorrow_18">18 bis 20 Uhr</label>
                                                    <br />
                                                    <input type="radio" name="kurier" id="tomorrow_19" value="tomorrow_19" />
                                                    <label for="tomorrow_19">19 bis 21 Uhr</label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <input type="hidden" name="datum_today" value="{$datum}" />
                                    <input type="hidden" name="datum_tomorrow" value="{$datum_mo}" />
                                    <div id="plz_nok" style="display:none;" class="kurier">Eine Zustellung per Kurier an dies PLZ ist leider nicht möglich!</div>
                                    <div id="basket_nok" style="display:none;" class="kurier">Nicht alle Artikel in Ihrem Warenkorb sind per Kurier zustellbar!</div>
                                    <div id="day_nok" style="display:none;" class="kurier">Da Sie nach {$ini.dhl.kurierBis} Uhr bestellen, ist die Zustellung per Kurier leider nicht mehr möglich!</div>
                                </td>
                            </tr>
                            {/if}
                            {if $ini.PayPalPlus.aktiv!=1&&$ini.PayPalCheckout.aktiv!=1}
                            <tr>
                                <th class="basket_head1">{$langstrings.buy.choose_payment_shipping_01}</th>
                            </tr>
                            {if $errormsg_versand}
                            <tr>
                                <td>{$errormsg_versand}</td>
                            </tr>
                            {/if}
                            <tr>
                                <td>
                                    <div id="versand_optionen"></div>
                                </td>
                            </tr>
                            {else}
                            <tr>
                                <td>
                                    <input type="hidden" name="Versand" value="{$ppplusVersand}" id="Versand" />
                                </td>
                            </tr>
                            {/if}
                        </table>
                        {/if}
                    <input type="hidden" name="action" value="Persdata" />
                    <input type="hidden" name="step" value="{$step}" />
                    <input type="hidden" name="continue_on_email_error" value="{$smarty.post.continue_on_email_error|default:0}" id="continue_email" />
                    {if $smarty.get.account}
                    <input type="hidden" name="account" value="{$smarty.get.account}" />
                    {elseif $mode_error}
                    <input type="hidden" name="account" value="{$mode_error}" />
                    {/if}
                    
                    {if $smarty.get.anfrage==1} 
                    <input type="hidden" name="send_anfrage" value="1" />
                    <input type="hidden" name="action" value="execute" />
                    <input type="hidden" name="buy" value="true" />
                    {/if}
                </form>
                {if $smarty.session.isMobile == false}
                <div class="bottom_nav2">   
                    <div style="float:left;">
                        <a href="/bestellen_seite_1.html" class="zurueckButton shopButton" title="zur&uuml;ck">
                            ZUR&Uuml;CK
                        </a>
                    </div>
                    <div style="float:right">                    
                        {if $smarty.get.anfrage==1}
                        <a href="javascript:document.buy.submit();"><img class="loading_dlg" src="/images/webelemente/butt_projektanfrage_senden.png" alt="Projektanfrage" /></a>
                        {else}
                        <a href="javascript:document.buy.submit();" class="shopButton" title="weiter">
                            WEITER 
                        </a>
                        {/if}
                    </div>                        
                </div>
                {else}
                    <div style="display:flex">                    
                        {if $smarty.get.anfrage==1}
                        <a href="javascript:document.buy.submit();"><img class="loading_dlg" src="/images/webelemente/butt_projektanfrage_senden.png" alt="Projektanfrage" /></a>
                        {else}
                        <a href="javascript:document.buy.submit();" style = "color:white !important" class="weiterButton_mobile" title="Gastkunde weiter">
                        WEITER
                        </a>
                        {/if}
                    </div>                        
                </div>
                {/if}
            </div>
        </div>
    {/if}
<div class="break"></div>
<!-- $Id: buy_1.tpl 2508 2022-10-12 11:26:41Z erling $ END -->
{/block}
