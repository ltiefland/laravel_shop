<!-- $Id: buy_2_guest.tpl 1760 2022-07-29 08:23:53Z tiefland $ BEGIN -->
{if $smarty.get.purchaseContractId}
    {$amazon_wallet}
{elseif $smarty.get.access_token}
    <div class="onprint" style="display:none;">
        <p>Kontrollausdruck Ihrer Bestelldaten vor dem Abschicken der Bestellung</p>
    </div>


<div class="box_2" style="float:left;width:100%;">
    <div class="basketNav2 noprint">
        <div class="steps_image desktop">
            <img onerror="this.src='/images/webelemente/bestellprozess_step3_active.png'" src="/images/webelemente/svg/bestellprozess_step3_active.svg" alt="Schritt für Schritt durch die Bestellung" />
        </div>
    </div>

    <h1 class="noprint headline" style="margin-bottom:0.5%;"><strong>Bestellung pr&uuml;fen und absenden</strong></h1>
    <div class="">
        <div>
        <div class="box_top">
            &nbsp;
        </div>
        <div class="box_2">
            <div id="amazon" style="padding-top:20px;">
                <div style="padding-left:20px;">
                    {$amazon_address}
                </div>
                <div style="float: left;width:10px;">
                    &nbsp;
                </div>
                <div style="padding-left:20px;">
                    {$amazon_wallet}
                </div>
                <div style="clear:both;float:none;margin-bottom:10px;">
                </div>
                <div style="padding:20px 0 0 20px;">
                    Unseren Datenschutzhinweis finden Sie
                    <a href="/index.php?id={$ini.typo3.datenschutz}" target="_blank"><u>hier</u></a>.
                    <br/>
                    <br/>
                    <p><strong>AGB's und Widerrufsrecht:</strong></p>
                    <div class="midcol" style="float:left;width:4%">
                        
                        <input id="agb" type="checkbox" name="AGB+Widerrufsrecht" value="gelesen" {if $smarty.session.AGB===true}checked="checked"{/if}/>
                    </div>
                    <div class="midcol" style="float:left;width:77%">
                        <label for="agb">
                            Ich habe die
                            <a href="/index.php?id={$ini.typo3.agb}" target="_blank"><u>AGB</u></a>
                            gelesen und bin mit ihnen einverstanden.
                            <br/>
                            Ich habe mich &uuml;ber mein
                            <a href="/index.php?id={$ini.typo3.widerruf}" target="_blank"><u>Widerrufsrecht</u></a>
                            informiert.
                        </label>
                    </div>
                </div>
                <div style="clear: both;float:none;margin-bottom: 20px;">
                </div>
                <div class="midcol" style="float:left;padding-left:30px;">
                    Bemerkung:<br />
                    <textarea name="Bemerkung" id="Bemerkung" cols="40" rows="4">{$smarty.session["SHOP"]["buy"]["Persdata"]["Bemerkung"]}</textarea>
                </div>
                <table class="basket_table basket_table_artikel">
                    <tr>
                        <td class="basket_head1" colspan="2">Artikel</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table border="0" style="background-color:#fff;margin: 0px auto; border-bottom: none; width: 100%;" class="basket-items-overview">
                                <thead>
                                    <tr>
                                        <th style="text-align:center;width: 60px;">Menge</th>
                                        <th style="text-align:center;" class="desktop">Bild</th>
                                        <th style="text-align:left;">Artikelbezeichnung</th>
                                        <th style="text-align:right;padding-right:2px;">
                                            {if isset($smarty.session.sonderPreis.preisDaten)}Sonderpreis<br />Shop Preis{else}Einzelpreis{/if}
                                        </th>
                                        <th style="text-align:right;padding-right:2px;">Gesamt</th>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="border-bottom: 1px dotted #909090;"></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $basketContent.items as $itemID => $itemDaten}                             
                                    {include file="basket_item_buy.tpl" item=$itemDaten}
                                    {/foreach}
                                    
                                    {if $smarty.session.SHOP.VERSAND.versand_abschlag!=0.00 && $smarty.session.SHOP.VERSAND.versand_abschlag}
                                    <tr>
                                        <td style="text-align:center;">1</td>
                                        <td>{$smarty.session.SHOP.VERSAND.versand_abschlag} % Skonto</td>
                                        <td style="text-align:right;">{$smarty.session.SHOP.RABATT|money_format|replace:"EUR":"&euro;"}</td>
                                        <td style="text-align:right;">{$smarty.session.SHOP.RABATT|money_format|replace:"EUR":"&euro;"}</td>
                                    </tr>
                                    {/if}
                                    
                                    <tr>
                                        <td></td>
                                        <td colspan="2" style="text-align:left">
                                            {$versandInfo.title}
                                            {if $smarty.session.SHOP.paypalCheckout.rechnung===true}
                                                Rechnungskauf
                                            {/if}
                                            :
                                        </td>
                                        <td style="text-align:right;">

                                            {$versandInfo.preis|money_format|replace:"EUR":"&euro;"} 
                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width:100%;"><hr /></td>
                                    </tr>
                                    {foreach $smarty.session.SHOP.MWST as $mwst => $value}
                                    <tr>
                                        <td colspan="3" style="text-align:right">
                                            enthaltene Mehrwertsteuer ({$mwst}%):
                                        </td>
                                        <td style="text-align:right;">
                                        {if $smarty.session.SHOP.MWSTVERSAND[$mwst]}
                                            {($value + $smarty.session.SHOP.MWSTVERSAND[$mwst])|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        {else}
                                            {$value|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        {/if}
                                        </td>
                                    </tr>
                                    {/foreach}
                                    <tr>
                                        <td colspan="3" style="text-align:right">
                                            Gesamtsumme brutto (inkl. MwSt):
                                        </td>
                                        <td style="text-align:right;">
                                            <strong>{$smarty.session.SHOP.SUMMEINCVERSAND|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
                <div style="text-align:right;padding:20px;clear: both;float:none;margin-bottom: 20px;">
                    <button id="place_order" class="shopButton">Kaufen</button>
                </div>
            </div>
            <div id="erg">
            </div>
        </div>
    </div>
</div>
{else}
    <div class="onprint" style="display:none;">
        <p>Kontrollausdruck Ihrer Bestelldaten vor dem Abschicken der Bestellung</p>
    </div>
{*
    {if $ini.ssl_buy==1}
        {if $smarty.server.HTTPS != "" && $smarty.server.HTTPS != "off"}
        <div class="basket_comodo">
            <script type="text/javascript">TrustLogo("https://{$smarty.server.SERVER_NAME}/images/webelemente/comodo_secure_76x26_transp.png", "SC5", "none");</script>        
        </div>
        {/if}
    {/if}
*}
     
    <div class="basketNav2 noprint">
        <div class="steps_image desktop">
            <img onerror="this.src='/images/webelemente/bestellprozess_step3_active.png'" src="/images/webelemente/svg/bestellprozess_step3_active.svg" alt="Schritt für Schritt durch die Bestellung" />
        </div>
    </div>

    <div class="box_2">
        <div>
            <span class="noprint" style="float:left;padding-bottom:5px;"><strong>Bestellung pr&uuml;fen und absenden</strong></span> 
            {assign var=step value=$smarty.session.SHOP.buy.step+1}
            <form action="{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_{$step}.html" method="post" id="buy" name="buy">
                <input type="hidden" name="paypalexpress" value="{$smarty.session['PayPalExpress']['versand']}" />
                <table style="width:100%;padding:10px 0;float:left;">
                    <tr>
                        <td>
                            <div class="noprint">
                                Bitte bestätigen Sie unsere AGB sowie das Widerrufsrecht.<br /> Durch das Anklicken des Buttons "Jetzt Kaufen" lösen Sie eine zahlungspflichtige Bestellung aus.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">{$errormsg_kontrolle}</td>
                    </tr>
                    <tr>
                        <td colspan="1" valign="top">
                            <div class="confirm_box">
                                <div class="noprint">
                                    <div class="checkbox">
                                        <input id="AGB" type="checkbox" class="checkbox" name="AGB" value="gelesen" {if $smarty.post.AGB||$smarty.session.AGB===true}checked="checked"{/if} />
                                    </div>
                                    <div class="checkbox_text">
                                    
                                       <label for="AGB">Ich habe die <a style="font-weight:bold;" href="/cms/agb" target="_blank">AGB</a> gelesen bin mit ihnen einverstanden.<br />Ich habe mich &uuml;ber mein <a style="font-weight:bold;" href="/cms/widerruf" target="_blank">Widerrufsrecht</a> informiert.</label>
                                        <input type="hidden" name="buy" value="true" />
                                        <input type="hidden" name="action" value="execute" />
                                        <input type="hidden" name="step" value="3" />
                                        <input type="hidden" name="req[AGB]" value="text" />
                                         
                                    </div>
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
                                
                                {assign var="adult" value=false}
                                {if is_array($basketContent.items)} 
                                    {foreach $basketContent.items as $key => $value}
                                        {if $value.adult==true}
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
                                        <strong>Bitte bestätigen.</strong><br />
Der Schnelltest darf nur vom berechtigten Kundenkreise im Sinne des &sect;3 MPAV angewandt werden. Bei medizinischen Laien kann es zur falschen Anwendung und Beurteilung des Tests kommen.

                                   </label>
                                   <input type="hidden" name="req[adult]" value="text" />
                                     
                                </div>
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
                                 {$smarty.session.SHOP.buy.Persdata.liefer_Vorname_pst} {$smarty.session.SHOP.buy.Persdata.liefer_Nachname_pst}<br />
                                {$smarty.session.SHOP.buy.Persdata.liefer_Strasse_pst} &nbsp; {$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer_pst}<br />
                                {$smarty.session.SHOP.buy.Persdata.liefer_PLZ_pst} {$smarty.session.SHOP.buy.Persdata.liefer_Ort_pst}<br />
                                {$smarty.session.SHOP.buy.Persdata.liefer_Land_Name_pst}
                        {else}
                            {if $smarty.session.SHOP.buy.Persdata.liefer_Firma}
                                {$smarty.session.SHOP.buy.Persdata.liefer_Firma}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.Vorname}
                                {$smarty.session.SHOP.buy.Persdata.liefer_Vorname} {$smarty.session.SHOP.buy.Persdata.liefer_Nachname}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.liefer_Strasse && $smarty.session.SHOP.buy.Persdata.liefer_Hausnummer}
                                {$smarty.session.SHOP.buy.Persdata.liefer_Strasse} &nbsp; {$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer}<br />
                            {/if}
                            {if $smarty.session.SHOP.buy.Persdata.liefer_PLZ && $smarty.session.SHOP.buy.Persdata.liefer_Ort}
                                {$smarty.session.SHOP.buy.Persdata.liefer_PLZ} {$smarty.session.SHOP.buy.Persdata.liefer_Ort}<br />
                            {/if}
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
                        <td class="basket_head1" colspan="2"><strong>Artikel</strong></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="margin: 0px auto; border-bottom: none; width: 100%;" class="basket-items-overview">
                                <thead>
                                    <tr>
                                        <th style="text-align:left;width: 60px;">Menge</th>
                                        <th style="text-align:center;"><div class="desktop">Bild</div></th>
                                        <th style="text-align:left;">Artikelbezeichnung</th>
                                        <th style="width:100px;" align="right">
                                            {if isset($smarty.session.sonderPreis.preisDaten)}Sonderpreis<br />Shop Preis{else}Einzelpreis{/if}
                                        </th>
                                        <th style="width:120px;padding-right:7px;" align="right">Gesamt</th>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="border-bottom: 1px dotted #909090;"></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $basketContent.items as $itemID => $itemDaten}                             
                                    {include file="basket_item_buy.tpl" item=$itemDaten}
                                    {/foreach}
                                    {assign var="summe" value=$smarty.session.SHOP.SUMMEINCVERSAND}
                                    {assign var="mwst" value=$smarty.session.SHOP.MWSTVONSUMME}
                                    {if $smarty.session.SHOP.VERSAND.versand_abschlag!=0.00 && $smarty.session.SHOP.VERSAND.versand_abschlag}
                                        {assign var="rabatt" value=($smarty.session.SHOP.SUMMEINCVERSAND*-1*$smarty.session.SHOP.VERSAND.versand_abschlag/100)}
                                        {assign var="summe" value=($smarty.session.SHOP.SUMMEINCVERSAND+$rabatt)}
                                    {elseif $smarty.session.SHOP.VERSAND.option.versand_abschlag!=0.00 && $smarty.session.SHOP.VERSAND.option.versand_abschlag}
                                        {assign var="rabatt" value=($smarty.session.SHOP.SUMMEINCVERSAND*-1*$smarty.session.SHOP.VERSAND.option.versand_abschlag/100)}
                                        {assign var="summe" value=($smarty.session.SHOP.SUMMEINCVERSAND+$rabatt)}
                                    {/if}
                                    {if $rabatt}
                                    <tr>
                                        <td>1</td>
                                        <td><div class="desktop">&nbsp;</div></td>
                                        <td>{$smarty.session.SHOP.VERSAND.option.versand_abschlag|default:$smarty.session.SHOP.VERSAND.versand_abschlag} % Skonto</td>
                                        <td style="text-align:right;">{$rabatt|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</td>
                                        <td style="text-align:right;">{$rabatt|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</td>
                                    </tr>
                                    {/if}
                                    <tr>
                                        <td></td>
                                        <td><div class="desktop">&nbsp;</div></td>
                                        <td colspan="2" style="text-align:left">
                                            {$versandInfo.title}:
                                        </td>
                                        <td style="text-align:right;">

                                            {$versandInfo.preis|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"} 
                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="width:100%;"><hr /></td>
                                    </tr>
                                    {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            Gesamtsumme netto:
                                        </td>
                                        <td style="text-align:right;">
                                            <strong>{$summe|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            <strong>zzgl. Mehrwertsteuer:</strong>
                                        </td>
                                        <td style="text-align:right;">
                                            {assign var="mwst" value=($summe*0.19)}
                                            {$mwst|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="width:100%;"><hr /></td>
                                    </tr>
                                    {foreach $smarty.session.SHOP.MWST as $mwst => $value}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            enthaltene Mehrwertsteuer ({$mwst}%):
                                        </td>
                                        <td style="text-align:right;">
                                        {if $smarty.session.SHOP.MWSTVERSAND[$mwst]}
                                            {($value + $smarty.session.SHOP.MWSTVERSAND[$mwst])|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        {else}
                                            {$value|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        {/if}
                                        </td>
                                    </tr>
                                    {/foreach}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            Gesamtsumme brutto (inkl. MwSt):
                                        </td>
                                        <td style="text-align:right;">
                                            <strong>{$summe|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</strong>
                                        </td>
                                    </tr>
                                    {else}
                                    
                                    {foreach $smarty.session.SHOP.MWST as $mwst => $value}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            enthaltene Mehrwertsteuer ({$mwst}%):
                                        </td>
                                        <td style="text-align:right;">
                                        {if $smarty.session.SHOP.MWSTVERSAND[$mwst]}
                                            {($value + $smarty.session.SHOP.MWSTVERSAND[$mwst])|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        {else}
                                            {$value|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        {/if}
                                        </td>
                                    </tr>
                                    {/foreach}
                                    <tr>
                                        <td colspan="4" style="text-align:right">
                                            Gesamtsumme brutto (inkl. MwSt):
                                        </td>
                                        <td style="text-align:right;">
                                            <strong>{$summe|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</strong>
                                        </td>
                                    </tr>
                                    {/if}
                                    {if $smarty.session.easycredit.finanzierung}
                                    <tr>
                                        <td colspan="3" style="text-align:right">
                                            <strong>zzgl. Zinsen</strong>
                                        </td>
                                        <td style="text-align:right">
                                            <strong>{$smarty.session.easycredit.ratenplan->zinsen->anfallendeZinsen|money_format|replace:"EUR":"€"}</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align:right">
                                            <strong>Gesamtkosten</strong>
                                        </td>
                                        <td style="text-align:right">
                                            <strong>{$smarty.session.easycredit.ratenplan->gesamtsumme|money_format|replace:"EUR":"€"}</strong>
                                        </td>
                                    </tr>
                                    {/if}
                                    <tr>
                                        <td colspan="5" style="text-align:right;padding-top:10px;">
                                            <a href="javascript:document.buy.submit();" class="jetztKaufenButton loading_dlg" title="Jetzt kaufen">
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
{/if}
</div>
<!-- $Id: buy_2_guest.tpl 1760 2022-07-29 08:23:53Z tiefland $ END -->
