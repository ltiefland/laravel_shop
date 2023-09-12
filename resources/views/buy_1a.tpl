{extends file="buy.tpl"}
{block name="buyStep"}
<!-- $Id: buy_1a.tpl 1733 2022-07-27 12:37:59Z tiefland $ BEGIN -->
{if $ini.PayPalPlus.aktiv!=1}
    <script>
        $(function(){
            $('#continueBtn').click(function(){
                    $('#buy_form').submit();
                    return false;
            })
        })
    </script>
{/if}
        <!-- basket topNav start -->
        <div class="basketNav2">
            {if $smarty.get.account == "new" || $mode_error == "new"}
            <div class="steps_headline">
                <h1>Kundenkonto</h1>
            </div>
            <div class="steps_image desktop">
                <img onerror="this.src='/images/webelemente/bestellprozess_step1_active.png'" src="/images/webelemente/svg/bestellprozess_step1_active.svg" alt="Schritt für Schritt durch die Bestellung" />
            </div>
            {else}
            <div class="steps_headline">
                <h1>Adresse/Zahlart</h1>
            </div>
            <div class="steps_image desktop">
                <img onerror="this.src='/images/webelemente/bestellprozess_step2_active.png'" src="/images/webelemente/svg/bestellprozess_step2_active.svg" alt="Schritt für Schritt durch die Bestellung" />
            </div>
                {/if}
        </div>
        <!-- basket topNav ende -->
  
        <div class="">
            <div>
                {if $smarty.get.anfrage==1}
                <table class="basket_table">
                    <tr>
                        <th class="basket_head1" colspan="2">
                            Preisanfrage
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Diese Anfragefunktion ist f&uuml;r Kunden gedacht, die vor der Auftragserteilung ein Angebot ben&ouml;tigen.
                            Bitte gib deine pers&ouml;nlichen Daten ein. <br />Wir werden deine Anfrage so schnell wie m&ouml;glich bearbeiten und uns mit dir in Verbindung setzen.
                        
                        </td>
                    </tr>
                </table>
            
                {/if}
                {assign var=step value=2}
                <form class="basket_form" action="{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_{$step}.html" method="post" name="buy" id="buy_form">
                    <input type="hidden" name="_token" value="{csrf_token()}" />

                <table class="basket_table">
                    <tr>
                        <td class="basket_head1">
                            
                            Zahlungs- und Lieferart<br>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            {$errormsg_versand}
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {if $ini.PayPalPlus.aktiv==1||$ini.PayPalCheckout.aktiv==1}
                        {include file="paypalplus.tpl"}
                        {else}
                        {include file="update_versand.tpl"}
                        {/if}
                        </td>
                    </tr>
                </table>
                {if $ini.PayPalPlus.aktiv==1}
                <input type="hidden" name="Versand" value="{$pppVersand}" />
                {/if}
                <input type="hidden" name="action" value="Versand" />
                <input type="hidden" name="step" value="{$step}" id="step" />
                <input type="hidden" name="continue_on_email_error" value="{$smarty.post.continue_on_email_error|default:0}" id="continue_email" />
        
                {if $smarty.get.anfrage==1} 
                    <input type="hidden" name="send_anfrage" value="1" />
                    <input type="hidden" name="action" value="execute" />
                    <input type="hidden" name="buy" value="true" />
                {/if}
        
                </form>

                <div class="bottom_nav2">   
                    <div style="float:left;">
                        {if !$smarty.session.SHOP.hash}
                        <a href="/bestellen_seite_1.html" class="zurueckButton shopButton" title="zur&uuml;ck">ZUR&Uuml;CK</a>
                        {/if}
                    </div>
                    <div style="float:right">                    
                        {if $smarty.get.anfrage==1}
                        <a href="javascript:document.buy.submit();"><img class="loading_dlg" src="/images/webelemente/butt_projektanfrage_senden.png" alt="Projektanfrage" /></a>
                        {elseif $ini.PayPalCheckout.aktiv!=1}
                        <a href="javascript:document.buy.submit();" id="continueBtn" class="shopButton" title="weiter">WEITER</a>
                        {/if}
                    </div>                        
                </div>
            </div>
        </div>

        <div class="break"></div>
<!-- $Id: buy_1a.tpl 1733 2022-07-27 12:37:59Z tiefland $ END -->
{/block}