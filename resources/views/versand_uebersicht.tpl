<div class="inner" style="background-color:#fff;margin-top:20px!important;">
    <div style="padding:2% 4% 2% 2%;">
      <div class="mainnav_title"><h1>Versandkosteninformationen</h1></div>
    
    
            <table cellspacing="0" class="versanduebersicht" border="0">
                <tr>
                    <td class="" colspan="100%">
                        <p>Lieferungen sind nur an Lieferadressen in {", "|implode:$Laender} möglich.</p><br />
                        <form class="basket_form" action="{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/versand_uebersicht.html" method="get" name="uebersicht" id="uebersicht">
                            <input type="hidden" name="mode" value="versand_uebersicht" />
                            
                            <label for="Land" style="font-size:1.1em;float:left;width:220px;display:inline;">Bitte w&auml;hle dein Land aus:</label>
                            {html_options options=$Laender id="Land" name="vLand" selected=$smarty.get.vLand|default:47 onchange="document.forms.uebersicht.submit();"}<br />
                            
                            
                            <label for="rufname" style="clear:both;font-size:1.1em;margin-top:10px;float:left;width:220px;">Wie willst du bezahlen?</label>
                            
                            {html_options style="text-transform:capitalize;margin-top:10px;" options=$rufnamen id="rufname" name="vRufname" selected=$smarty.get.vRufname onchange="document.forms.uebersicht.submit();"}
                            
                            <br /><br />
                            
                        </form>                    
                    </td>
                </tr>
                <tr>
                    <td class="versand_header">Versandart und Zahlungsart</td>
                    {if $ini.versandkostentabelle.gewicht==1}
                    <td class="versand_header" style="width:100px;text-align:right;" align="right">Gewichtsbereich</td>
                    {/if}
                    {if $ini.versandkostentabelle.warenwert==1}
                    <td class="versand_header" style="width:100px;text-align:right;" align="right">Warenwert/&euro;</td>
                    {/if}

                    {if $ini.versandkostentabelle.Eigenschaft_2==1}
                    <td class="versand_header" style="text-align:center;">Versand kostenlos*</td>
                    {/if}
                    {if $ini.versandkostentabelle.Eigenschaft_4==1}
                    <td class="versand_header" style="text-align:center;">nur Abholung*</td>
                    {/if}
                    {if $ini.versandkostentabelle.Eigenschaft_1==1}
                    <td  class="versand_header" style="text-align:center;">Gro&szlig;ger&auml;t*</td>
                    {/if}

                    <td class="versand_header" style="text-align:right;">Preis/&euro;</td>
                    
                </tr>
                {foreach $versand_uebersicht.basketVersand as $item}
                
                {assign var=old_rufname value=$item.rufname}
                {if $old_rufname != $new_rufname} 
                    <tr><td class="versand_header" colspan="100%" style="border-bottom:1px solid #ccc;text-transform:capitalize;">{$old_rufname}</td></tr>
                {/if}
                {if $item.kurz!="Neue Versandoption"}
                <!-- onmouseover="this.style.backgroundColor='#A3AAB0';" -->
                <tr style="cursor:help;"
                      
                    onmouseout="this.style.backgroundColor='#fff';return nd();"
                    onmouseover="this.style.backgroundColor='#BABABA'; return overlib('{$item.beschr|replace:'"':''}', CAPTION, '', HAUTO, VAUTO,WIDTH,500); " 
                     
                >
                    <td id="td1_{$item.ID}" valign="top" style="border-bottom:1px solid #ccc;border-left:1px solid #ccc;">
                        {$item.kurz}
                         
                    </td>
                    <!-- GEWICHTSBEREICH -->
                    {if $ini.versandkostentabelle.gewicht==1}
                    <td id="td2_{$item.ID}" valign="top" align="right" class="" style="border-bottom:1px solid #ccc;border-left:1px solid #ccc;">
                        {if $item.berechung_kg_von < $item.berechnung_kg_bis}
                            {if $item.berechnung_kg_von==0.00 && $item.berechnung_kg_bis==99999.00}
                                beliebig
                            {elseif $item.berechnung_kg_bis>=99999.00}
                                ab {$item.berechnung_kg_von|number_format}&nbsp;kg
                            
                            {else}
                                {if $item.berechnung_kg_bis>=99999.00}
                                    ab {$item.berechnung_kg_von|number_format}&nbsp;kg
                                {elseif $item.berechnung_kg_von==0.00}
                                    bis {$item.berechnung_kg_bis|number_format}&nbsp;kg
                                {else}
                                    {$item.berechnung_kg_von|number_format}&nbsp;kg-{$item.berechnung_kg_bis|number_format}&nbsp;kg
                                {/if}
                            {/if}
                        
                        {/if}
                        
                    </td>
                    {/if}
                    
                    <!-- WARENWERT -->
                    {if $ini.versandkostentabelle.warenwert==1}
                    <td id="td3_{$item.ID}" valign="top" align="right" class="" style="border-bottom:1px solid #ccc;border-left:1px solid #ccc;">
                        {if $item.berechnung_preis_von < $item.berechnung_preis_bis}
                            {if $item.berechnung_preis_von==0.00 && $berechnung_preis_bis>=99999.00}
                                beliebig
                            {else}
                                {if $item.berechnung_preis_bis>=99999.00}
                                    ab {$item.berechnung_preis_von|number_format}
                                {elseif $item.berechnung_preis_von==0.00}
                                    bis {$item.berechnung_preis_bis|number_format}
                                {else}
                                    {$item.berechnung_preis_von|number_format}-{$item.berechnung_preis_bis|number_format}
                                {/if}
                            {/if}
                        
                        {elseif $item.berechnung_preis_von > 0 && $item.berechnung_preis_von == $item.berechnung_preis_bis}
                            beliebig
                        {elseif $item.berechnung_preis_bis>=99999.00}
                            ab {$item.preis_neu3|replace:'.00':''}
                        {elseif $item.berechnung_preis_von==$item.berechnung_preis_bis}
                            beliebig
                        {/if}
                        
                    </td>
                    {/if}

                    {if $ini.versandkostentabelle.Eigenschaft_2==1}
                    <td id="td4_{$item.ID}" class="" valign="top" style="text-align:center;border-bottom:1px solid #ccc;border-left:1px solid #ccc;">
                        {if $item.Eigenschaft_2==1}
                        ja
                        {else}
                        nein
                        {/if}
                    </td>
                    {/if}
                    
                    {if $ini.versandkostentabelle.Eigenschaft_4==1}
                    <td id="td5_{$item.ID}" class="" valign="top" style="text-align:center;border-bottom:1px solid #ccc;border-left:1px solid #ccc;">
                        {if $item.Eigenschaft_4==1}
                        ja
                        {else}
                        nein
                        {/if}
                    </td>
                    {/if}
                    
                    {if $ini.versandkostentabelle.Eigenschaft_1==1}
                    <td id="td6_{$item.ID}" class="" valign="top" style="text-align:center;border-bottom:1px solid #ccc;border-left:1px solid #ccc;">
                        {if $item.Eigenschaft_1==1}
                        ja
                        {else}
                        nein
                        {/if}
                    </td>
                    {/if}
                    
                    <td id="td5_{$item.ID}" class="" valign="top" style="text-align:right;border-bottom:1px solid #ccc;border-left:1px solid #ccc;border-right:1px solid #ccc;">{$item.preis|money_format|replace:"EUR":"&euro;"}
                    </td>
                    
                </tr>
                {/if}
                {assign var=new_rufname value=$old_rufname}
                {foreachelse}
                <tr>
                    <td colspan="100%">
                        <p>Keine Zahlungsarten gefunden. &Auml;ndere bitte die Suchkriterien.</p>
                    </td>
                </tr>
                {/foreach}
                <tr>
                    <td colspan="100%">
                    {if $ini.versandkostentabelle.Eigenschaft_1==1 || 
                        $ini.versandkostentabelle.Eigenschaft_2==1 ||
                        $ini.versandkostentabelle.Eigenschaft_3==1 ||
                        $ini.versandkostentabelle.Eigenschaft_4==1 ||
                        $ini.versandkostentabelle.Eigenschaft_5==1}
                        <p style="font-size:0.9em;">*gilt nur f&uuml;r Artikel, die entsprechend gekennzeichnet sind.</p>
                    {/if}
                        <br />
                         
                        <p>Das bei den Artikeln ausgewiesene Versandgewicht stellt nicht immer das tats&auml;chliche Gewicht eines Artikels dar, sondern dient in erster Linie der Berechnung der Versandkosten.</p>

                    </td>
                </tr>
            </table>
            


    </div>    
</div>
