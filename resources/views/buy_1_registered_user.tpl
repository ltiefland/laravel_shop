{extends file="buy.tpl"}
{block name="buyStep"}
<!-- $Id: buy_1_registered_user.tpl 2982 2022-12-08 11:12:33Z tiefland $ BEGIN -->
<style>
    .unchecked {
        transition:all 200ms ease;
        padding:2%;
        background:rgba(226,6,50,.3);
        width:fit-content;
    }
    .checked {
        transition:all 200ms ease;
        padding:2%;
        background:rgba(33,143,61,.3);
        width:fit-content;
    }
</style>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', () => {
        // AGB toggle
        const checkboxEl = document.querySelector('#AGB');
        const wrapperEl = document.querySelector('#AGBCheckboxWrapper');

        checkboxEl.addEventListener('change', () => {
            wrapperEl.className = (checkboxEl.checked) ? 'checked' : 'unchecked';
        });

        wrapperEl.addEventListener('click', (e) => {
            const tag = e.target.nodeName.toLowerCase();
            if (tag !== 'a' && tag !== 'input' && tag !== 'label') {
                checkboxEl.checked = !checkboxEl.checked;
                wrapperEl.className = (checkboxEl.checked) ? 'checked' : 'unchecked';
            }
        });
    });
</script>
{if $smarty.get.anfrage!=1}
    <style>
        #loading, #add_basket_msg{
            display:none;
        }
    </style>
    <div class="box_2" style="float:left;width:100%;">
        <div class="basketNav2">
            <div class="steps_headline">
                <h1>Adresse/Zahlart</h1>
            </div>
            <div class="steps_image">
                <img onerror="this.src='/images/webelemente/bestellprozess_step2_active.png'" src="/images/webelemente/svg/bestellprozess_step2_active.svg" alt="Schritt für Schritt durch die Bestellung" />
            </div>
        </div>

        <!-- PayPalCheckout Rückgabe Rechnungskauf BEGIN -->
        {if $smarty.session.SHOP.paypalCheckout.return.error===true && $smarty.get.ratepay_error==true}
            <div>
                <div>Fehler beim Rechnungskauf. {$langstrings.PayPalCheckout.rechnungskauf_error_add}</div>
                <div>{$smarty.session.SHOP.paypalCheckout.return.msg}</div>
            </div>
        {/if}
        <!-- PayPalCheckout Rückgabe Rechnungskauf END -->

        <div class="box_2">
            <div>
                {assign var=step value=$smarty.session.SHOP.buy.step+1}
                {if $ini.klarna.aktiv==1||$ini.PayPalPlus.aktiv==1||$ini.PayPalCheckout.aktiv==1}
                {assign var=step value="1a"}
                {/if}
                <form class="basket_form" action="/bestellen_seite_{$step}.html" method="post" name="buy" id="buy_form">
                    <input type="hidden" name="_token" value="{csrf_token()}" />
                    <table class="basket_table">
                        <tr>
                            <td>
                                {include file="adress_auswahl.tpl" name="bill_addr_id" id="billing_addr" bill=true}
                            </td>
                            <td>
                                {include file="adress_auswahl.tpl" name="ship_addr_id" id="shipping_addr" bill=false}
                            </td>
                        </tr>
                        <tr>
                            <td><span class="input_error_msg">{$errormsg_adresse["Rechnungsadresse"]}</span></td>
                            <td><span class="input_error_msg">{$errormsg_adresse["Lieferadresse"]}</span></td>
                        </tr>            
                        <tr>
                            <!--<td>
                                <input type="button" value="{$langstrings.buy.my_address_book}" id="my_address_book" />
                                <br /><br />
                            </td>-->
                            <td>
                                <span style="font-size:14px;color:red;text-align:left;">{$change_mwst}</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                {$langstrings.buy.comments}:
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea name="Persdata[Bemerkung]" cols="30" rows="4">{$smarty.session.SHOP.buy.Persdata.Bemerkung}</textarea>
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td id="addr_result"></td>
                        </tr>
                        <tr>
                            <td>
                                <div id="AGBCheckboxWrapper" class="{if $smarty.post.AGB||$smarty.session.AGB===true}checked{else}unchecked{/if}">
                                    <div class="checkbox">
                                        <input id="AGB" type="checkbox" class="checkbox" name="AGB" value="gelesen" {if $smarty.post.AGB||$smarty.session.AGB===true}checked="checked"{/if} required="required">
                                        <span class="input_error_msg">Pflichtfeld</span>
                                        <input type="hidden" name="req[AGB]" value="text">
                                    </div>

                                    <label for="AGB"> Ich akzeptiere die <a style="font-weight:bold;" href="/cms/agb" target="_blank">AGB.</a></label>

                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="break" style="height:15px;"></div>
                    <table class="basket_table" style="width:100%;">
                        {if $ini.PayPalPlus.aktiv!=1&&$ini.PayPalCheckout.aktiv!=1}
                        <tr>
                            <td>
                                <h1 class="basket_head1">{$langstrings.buy.choose_payment_shipping_01}</h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="input_error_msg">{$errormsg_versand}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="versand_optionen" style="margin-left:5px;"></div>
                            </td>
                        </tr>
                        {else}
                            <tr>
                                <td>
                                    <input type="hidden" name="Versand" value="{$ppplusVersand}" id="Versand" />
                                </td>
                            </tr>
                        {/if}
                        <tr>
                            <td>
                                <span style="margin-left:14px;">{$langstrings.buy.check_priv_policy}</span>
                            </td>
                        </tr>
                    </table>
                    
                    <input type="hidden" name="action" value="Persdata">
                    <input type="hidden" name="step" value="{$step}">
                    <input type="hidden" id="liefer_Land" value="">
                    <input type="hidden" name="continue_on_email_error" value="{$smarty.post.continue_on_email_error|default:0}" id="continue_email">
                    <input type="hidden" name="Persdata[ID]" value="{$smarty.session.SHOP.buy.Persdata.ID}">
                </form>
                
                <div class="bottom_nav2">   
                    <div style="float:left;">
                        <a href="/basket.html" class="zurueckButton shopButton" title="zur&uuml;ck">
                             ZUR&Uuml;CK
                        </a>
                    </div>
                    <div style="float:right">                    
                        {if $smarty.get.anfrage==1}
                        <a href="javascript:document.buy.submit();"><img class="loading_dlg" src="/images/webelemente/butt_anfrage.gif" alt="Preisanfrage" /></a>
                        {else}
                        <a href="javascript:document.buy.submit();" class="shopButton" title="weiter">
                            WEITER
                        </a>
                        {/if}
                    </div>                        
                </div>
            </div>
        </div>
    </div>
    <div id="new_addr_dialog" title="{$langstrings.buy.new_address}">
        {include file="edit_address.tpl" incl=true}
    </div>
{else}
    <div id="reg_container">
        {include file="register.tpl"}
    </div>
{/if}
<!-- $Id: buy_1_registered_user.tpl 2982 2022-12-08 11:12:33Z tiefland $ END -->
{/block}