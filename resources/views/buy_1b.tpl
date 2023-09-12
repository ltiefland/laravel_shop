{extends file="buy.tpl"}
{block name="buyStep"}
<!-- $Id: buy_1b.tpl 2985 2022-12-08 11:27:15Z tiefland $ BEGIN -->
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
            {*<div class="steps_image desktop">
                <img onerror="this.src='/images/webelemente/bestellprozess_step1_active.png'" src="/images/webelemente/svg/bestellprozess_step1_active.svg" alt="Schritt für Schritt durch die Bestellung" />
            </div>*}
            {else}
            <div class="steps_headline">
                <h1>Adresse/Zahlart</h1>
            </div>
            {*<div class="steps_image desktop">
                <img onerror="this.src='/images/webelemente/bestellprozess_step2_active.png'" src="/images/webelemente/svg/bestellprozess_step2_active.svg" alt="Schritt für Schritt durch die Bestellung" />
            </div>*}
                {/if}
        </div>
        <!-- basket topNav ende -->
  
        <div class="">
            <div class="bestellvorgang">
                {assign var=step value=2}
                {if $smarty.session.SHOP.VERSAND.versandart=="easycredit"}
                <div>{$errormsg_easycredit}</div>
                {/if}
                <form class="basket_form" action="{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_{$step}.html" method="post" name="buy" id="buy_form">
                    <input type="hidden" name="_token" value="{csrf_token()}" />

                <table class="basket_table">
                    <tr>
                        <td colspan="2" class="basket_head1">
                            
                            Zahlungs- und Lieferart<br/>
                            
                        </td>
                    </tr>
                    {if $smarty.session.SHOP.VERSAND.versandart=="easycredit"}
                   <tr>
                        <td colspan="2">Ich stimme folgendem zu:</td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">
                            <input type="hidden" name="zustimmungDatenuebertragungPaymentPage" value="0" />
                            <input type="checkbox" name="zustimmungDatenuebertragungPaymentPage" id="zustimmungDatenuebertragungPaymentPage" value="1" />
                        </td>
                        <td>
                            <label for="zustimmungDatenuebertragungPaymentPage" style="cursor:pointer">{$smarty.session.easycredit.texte->zustimmungDatenuebertragungPaymentPage}</label>
                        </td>
                    </tr>
                    {elseif $smarty.session.SHOP.VERSAND.versandart=="crefopay"||$smarty.session.SHOP.VERSAND.versandart=="crefopayKK"||$smarty.session["SHOP"]["paypalCheckout"]["rechnung"]===true}
                        <tr>
                            <td colspan="2">{$langstrings.buy.geburtsdatum_info}</td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top">
                                <label for="birthday" style="cursor:pointer">Geburtsdatum</label>
                                <input type="date" name="birthDay" id="birthDay" value="{$smarty.session.SHOP.buy.Persdata.bDay}" required="true" />
                            </td>
                            <td style="color:red;">{$errormsg_crefopay}</td>
                        </tr>
                    {/if}
                </table>&nbsp;
                <input type="hidden" name="action" value="{$smarty.session.SHOP.VERSAND.versandart}" />
                <input type="hidden" name="step" value="{$step}" />
                <input type="hidden" name="continue_on_email_error" value="{$smarty.post.continue_on_email_error|default:0}" id="continue_email" />
        
                </form>

                <div class="bottom_nav2">   
                    <div style="float:left;">
                        {if !$smarty.session.SHOP.hash}
                        <a href="/bestellen_seite_1.html" class="zurueckButton shopButton" title="zur&uuml;ck"><img src="/images/webelemente/doppelpfeil-links-schwarz.png" width="12" height="12" alt=""/> ZUR&Uuml;CK</a>
                        {/if}
                    </div>
                    <div style="float:right">                    
                        {if $smarty.get.anfrage==1}
                        <a href="javascript:document.buy.submit();"><img class="loading_dlg" src="/images/webelemente/butt_projektanfrage_senden.png" alt="Projektanfrage" /></a>
                        {else}
                        <a href="javascript:document.buy.submit();" id="continueBtn" class="weiterButton" title="weiter">WEITER <img src="/images/webelemente/doppelpfeil-rechts-weiss.png" width="12" height="12" alt="Gastkunde weiter"/></a>
                        {/if}
                    </div>                        
                </div>
            </div>
        </div>

        <div class="break"></div>
<!-- $Id: buy_1b.tpl 2985 2022-12-08 11:27:15Z tiefland $ END -->
{/block}