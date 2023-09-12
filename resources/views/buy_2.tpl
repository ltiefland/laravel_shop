{extends file="buy.tpl"}
{$pi = $smarty.session.SHOP.BASKET->paymentInfo}
{block name="buyStep"}
<!-- $Id: buy_2.tpl 2986 2022-12-08 11:44:53Z tiefland $ BEGIN -->
    <div class="basket_process">
        <img src="/images/webelemente/svg/bestellprozess_step3_active.svg" />
    </div>

    <div class="onprint" style="display:none;">
        <p>Kontrollausdruck Ihrer Bestelldaten vor dem Abschicken der Bestellung</p>
    </div>

    <div class="basketNav2 noprint">
    </div>
    {if $liefertagSamstag}
    <div class="">
        <div>
            <h2>Samstags-Lieferung</h2>
            Sie ehalten Ihre Lieferung am {$liefertagSamstag|date_format:"d.m.Y"}
        </div>
    </div>
    {/if}

    <div class="">
        <div>
            <span class="noprint" style="float:left;padding-bottom:5px;"><strong>Bestellung pr&uuml;fen und absenden</strong></span> 
            {assign var=step value=$smarty.session.SHOP.buy.step+1}
            <form action="{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_{$step}.html" method="post" id="buy" name="buy">
                <input type="hidden" name="_token" value="{csrf_token()}" />
                <input type="hidden" name="paypalexpress" value="{$smarty.session['PayPalExpress']['versand']}" />
                <table style="width:100%;padding:10px 0;float:left;">
                    <tr>
                        <td>
                            <div class="noprint">
                                Bitte bestätigen Sie unsere AGB sowie das Widerrufsrecht.<br /> Durch das Anklicken des Buttons "Kaufen" lösen Sie eine zahlungspflichtige Bestellung aus.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">{$errormsg_kontrolle}</td>
                    </tr>
                    <tr>
                        <td colspan="1" valign="top">
                            <div class="confirm_box">
                                <div class="noprint bestell_checkbox">

                                    <div class="checkbox">
                                        <input id="AGB" type="checkbox" class="checkbox" name="AGB" value="gelesen" {if $smarty.post.AGB||$smarty.session.AGB==="gelesen"}checked="checked"{/if} />
                                    </div>
                                    <div class="checkbox_text">
                                    
                                       <label for="AGB">Ich habe die <a style="font-weight:bold;" href="/index.php?id={$ini.typo3.agb}" target="_blank">AGB</a> gelesen und bin mit ihnen einverstanden.<br />Ich habe mich &uuml;ber mein <a style="font-weight:bold;" href="/index.php?id={$ini.typo3.widerruf}" target="_blank">Widerrufsrecht</a> informiert.</label>
                                       <br />
                                        <input type="hidden" name="buy" value="true" />
                                        <input type="hidden" name="action" value="execute" />
                                        <input type="hidden" name="step" value="3" />
                                        <input type="hidden" name="req[AGB]" value="text" />
                                         
                                    </div><br />
                                    
                                    {* AltersprÃƒÂ¼fung *}
                                    {assign var="adult" value=false}
                                    {if is_array($smarty.session.SHOP.BASKET->items)} 
                                        {foreach $smarty.session.SHOP.BASKET->items as $key => $value}
                                            {if $value->adult==true}
                                                {$adult=true}
                                            {/if}
                                        {/foreach}
                                    {/if}
                                    {if $adult===true}
                                    <div class="checkbox">
                                        <input type="hidden" name="adultCheck" value="true" />    
                                        <input id="adult" type="checkbox" class="checkbox" name="adult" value="gelesen" {if ($smarty.post.adult)}checked="checked"{/if} />
                                    </div>
                                    <div class="checkbox_text">
                                    
                                       <label for="adult">
                                        Sie m&ouml;chten Artikel kaufen, die nur f&uuml;r Erwachsene geeignet sind.<br>
                                        <b>Ich best&auml;tige, dass ich &uuml;ber 18 Jahre alt bin.</b>
                                       </label>
                                       <input type="hidden" name="req[adult]" value="text" />
                                         
                                    </div>
                                    {/if}
                                </div>
                                <br />
                                {if $ini.modules.mailverteiler_id && $user_not_in_list && $smarty.session.SHOP.Login}
                                <div class="break"></div>
                                <div class="noprint">
                                    <div class="checkbox">
                                        <input id="Newsletter" type="checkbox" class="checkbox" name="Newsletter" value="{$ini.modules.mailverteiler_id}" {if ($smarty.post.Newsletter)}checked="checked"{/if} />
                                    </div>
                                    <div class="checkbox_text">
                                        <label for="Newsletter">{$langstrings.buy.newsletter}</label>
                                    </div>
                                </div>
                                {/if}
                                {if isset($smarty.session.PayPalExpress)}
                                <div class="break"></div>
                                <div class="noprint">
                                    Bitte geben Sie für eventuelle Rückfragen Ihre Telefonnummer ein.
                                </div>
                                <div class="noprint">
                                    <div class="checkbox">
                                        <label for="phone">Telefonnummer</label>
                                    </div>
                                    <div class="checkbox_text">
                                        <input id="phone" type="phone" value="{$smarty.post.Persdata.telefon}" name="Persdata[telefon]" />
                                    </div>
                                </div>
                                {/if}
                                {if $ini.logistiker.logistiker_mail==1}
                                <div class="noprint">
                                    <div class="checkbox">
                                        <input type="hidden" name="logistiker_mail" value="0" />
                                        <input id="logistiker_mail" type="checkbox" class="checkbox" name="logistiker_mail" value="1" {if ($smarty.post.logistiker_mail)}checked="checked"{/if} />
                                    </div>
                                    <div class="checkbox_text">
                                        <label for="logistiker_mail">{$langstrings.logistiker.logistiker_mail}</label>
                                    </div>
                                </div>
                                <div style="clear: both;float:none;margin-bottom: 20px;"></div>
                                {/if}
                            </div>
                        </td>
                    </tr>
                </table>
                <table class="basket_table" style="width: 30%;clear:both;float:left;">
                    <tr class="basket_balken">
                        <td class="basket_head1"><strong>Rechnungsadresse</strong></td>
                    </tr>
                    <tr>
                        <td class="midcol" align="left" style="vertical-align:top;">
                            {if $smarty.session.SHOP.buy.Persdata.Firma}
                                {$smarty.session.SHOP.buy.Persdata.Firma}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Anrede}
                                {$smarty.session.SHOP.buy.Persdata.Anrede}
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Vorname}
                                {$smarty.session.SHOP.buy.Persdata.Vorname} {$smarty.session.SHOP.buy.Persdata.Nachname}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Strasse && $smarty.session.SHOP.buy.Persdata.Hausnummer}
                                {$smarty.session.SHOP.buy.Persdata.Strasse} &nbsp; {$smarty.session.SHOP.buy.Persdata.Hausnummer}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.PLZ && $smarty.session.SHOP.buy.Persdata.Ort}
                                {$smarty.session.SHOP.buy.Persdata.PLZ} {$smarty.session.SHOP.buy.Persdata.Ort}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Land_Name}
                                {$smarty.session.SHOP.buy.Persdata.Land_Name}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Telefon}
                                {$smarty.session.SHOP.buy.Persdata.Telefon}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.email}
                                <br />{$smarty.session.SHOP.buy.Persdata.email}
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Bemerkung}
                                <br /><br />{$smarty.session.SHOP.buy.Persdata.Bemerkung}
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="basket_head1"><strong>Lieferadresse</strong></td>
                    </tr>
                    <tr>
                        <td class="midcol" align="left" style="vertical-align:top;">
                        {if $smarty.session.SHOP.Lieferadresse=="packstation"}
                                {$smarty.session.SHOP.buy.Persdata.liefer_Firma_pst}<br />
                                {$smarty.session.SHOP.buy.Persdata.liefer_Anrede_pst}
                            {$smarty.session.SHOP.buy.Persdata.liefer_Vorname_pst} {$smarty.session.SHOP.buy.Persdata.liefer_Nachname_pst}<br />
                            {$smarty.session.SHOP.buy.Persdata.liefer_Strasse_pst} &nbsp; {$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer_pst}<br />
                            {$smarty.session.SHOP.buy.Persdata.liefer_PLZ_pst} {$smarty.session.SHOP.buy.Persdata.liefer_Ort_pst}<br />
                            {$smarty.session.SHOP.buy.Persdata.liefer_Land_Name}
                        {else}
                            {if $smarty.session.SHOP.buy.Persdata.liefer_Firma}
                                {$smarty.session.SHOP.buy.Persdata.liefer_Firma}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Anrede}
                                {$smarty.session.SHOP.buy.Persdata.liefer_Anrede}
                            {/if}
                            {$smarty.session.SHOP.buy.Persdata.liefer_Vorname} {$smarty.session.SHOP.buy.Persdata.liefer_Nachname}<br />
                            {$smarty.session.SHOP.buy.Persdata.liefer_Strasse} &nbsp; {$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer}<br />
                            {$smarty.session.SHOP.buy.Persdata.liefer_PLZ} {$smarty.session.SHOP.buy.Persdata.liefer_Ort}<br />
                            {$smarty.session.SHOP.buy.Persdata.liefer_Land_Name}
                        {/if}
                        </td>
                    </tr>   
                </table>
                <table class="basket_table basket_table_artikel">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                
                    <tr>
                        <td class="basket_head1" colspan="2">Artikel</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table border="0" style="margin: 0px auto; border-bottom: none; width: 100%;" class="basket-items-overview">
                                <thead>
                                    <tr>
                                        <th style="text-align:center;width: 60px;">Menge</th>
                                        <th style="text-align:center;" class="desktop">Bild</th>
                                        <th style="text-align:left;">Artikelbezeichnung</th>
                                        <th style="text-align:right;padding-right:2px;">Einzelpreis</th>
                                        <th style="text-align:right;padding-right:2px;">Gesamt</th>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="border-bottom: 1px dotted #909090;"></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $smarty.session.SHOP.BASKET->items as $itemID => $itemDaten}                             
                                    {include file="basket_item_buy.tpl" item=$itemDaten}
                                    {/foreach}
                                    {assign var="summe" value=$pi.Total}
                                    {if $smarty.session.SHOP.VERSAND.versand_abschlag!=0.00 && $smarty.session.SHOP.VERSAND.versand_abschlag}
                                    {assign var="rabatt" value=($summe*-1*$smarty.session.SHOP.VERSAND.versand_abschlag/100)}
                                    {assign var="summe" value=($summe+$rabatt)}
                                    
                                    <tr>
                                        <td>1</td>
                                        <td></td>
                                        <td>{$smarty.session.SHOP.VERSAND.versand_abschlag} % Skonto</td>
                                        <td style="text-align:right;">{$rabatt|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</td>
                                        <td style="text-align:right;">{$rabatt|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</td>
                                    </tr>
                                    {/if}
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td colspan="2" style="text-align:left">
                                            {$versandInfo.title}:
                                        </td>
                                        
                                        <td style="text-align:right;">

                                            {$versandInfo.preis|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"} 
                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5"><hr /></td>
                                    </tr>
                                    
                                    {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.module.netto_preise == true}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            <strong>Gesamtsumme netto</strong>:
                                        </td>
                                        <td style="text-align:right;">
                                            <strong>{$summe|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</strong>
                                        </td>
                                    </tr>
                                    {foreach $pi.Tax as $mwst => $value}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            zzgl. Mehrwertsteuer ({$pi.TaxRates[$mwst]}%):
                                        </td>
                                        <td style="text-align:right;">
                                            {assign var="summe" value=($summe+$value)}
                                        </td>
                                    </tr>
                                    {/foreach}
                                    <tr>
                                        <td colspan="5"><hr /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            Gesamtsumme brutto (inkl. MwSt):
                                        </td>
                                        <td style="text-align:right;">
                                        <strong>
                                            {$summe|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        </strong>
                                                
                                        </td>
                                    </tr>
                                    {else}                                
                                    {foreach $pi.Tax as $mwst => $value}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            enthaltene Mehrwertsteuer ({$pi.TaxRates[$mwst]}%):
                                        </td>
                                        <td style="text-align:right;">
                                            {$value|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        </td>
                                    </tr>
                                    {/foreach}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            Gesamtsumme brutto (inkl. MwSt):
                                        </td>
                                        <td style="text-align:right;">
                                            <strong>
                                                {$summe|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                            </strong>
                                        </td>
                                    </tr>
                                    {/if}
                                    {if $smarty.session.easycredit.finanzierung}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            <strong>zzgl. Zinsen</strong>
                                        </td>
                                        <td style="text-align:right">
                                            <strong>{$smarty.session.easycredit.ratenplan->zinsen->anfallendeZinsen|money_format|replace:"EUR":"€"}</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            <strong>Gesamtkosten</strong>
                                        </td>
                                        <td style="text-align:right">
                                            <strong>{$smarty.session.easycredit.ratenplan->gesamtsumme|money_format|replace:"EUR":"€"}</strong>
                                        </td>
                                    </tr>
                                    {/if}
                                    <tr>
                                        <td colspan="5" style="text-align:right;padding-top:10px;">
                                            <a href="javascript:document.buy.submit();" class="shopButton loading_dlg" title="Jetzt kaufen">
                                                JETZT KAUFEN 
                                            </a>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
                    <input type="hidden" name="versandart" value="{$versandInfo.versandart}" />
                    {if $accountMode}
                    <input type="hidden" name="account" value="{$accountMode}" />
                    {/if}
            </form>
        </div>
    </div>
    <div class="break"></div>
<!-- $Id: buy_2.tpl 2986 2022-12-08 11:44:53Z tiefland $ END -->
{/block}
