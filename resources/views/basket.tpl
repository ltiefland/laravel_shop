{extends file="page.tpl"}
{block name=content}
<!-- $Id: basket.tpl 2551 2022-10-13 09:33:09Z erling $ BEGIN -->
<div class="inner" style="z-index:1;border-radius:0 0 5px 5px;">
{if !$smarty.session.SHOP.BASKET->items}
    {include file="basket_empty.tpl"}
{else}
    <!--
    <script type="text/javascript" src="/JavaScript/infolayer.js"></script>
    -->
    <script>
            function changeTarget(basketItemID) {
                $('#basket_'+basketItemID).submit();
            }  
            $(document).ready(function(){
                $('#versandoptionen').load("/update_versand?param=single&Land=" + $('#versand_laenderauswahl').val() );
                $('#versand_laenderauswahl').change(function(){
                    $('#versandoptionen').load("/update_versand?param=single&Land=" + $('#versand_laenderauswahl').val() );
                });
            });
    </script>
    
    <div id="divh" class="box_2_basket">
        
        <div class="box_middle_basket">
            <input type="submit" name="recalculate" style="display:none" />
            <div class="basket_table_right desktop">

                
            </div>
            <div class="basket_table_left">
                {include file="basket_item_table.tpl"}
            </div>
            
        {if $ini.modules.gutschein == 1 && $ini.gutschein.redeem==1 && $smarty.session.no_voucher==false}
        
            <details class="gutschein_toggle">
                <summary>{$langstrings.buy.certificate_redeem}</summary>
                <div class="gutschein_table">
                    {if isset($ini.gutschein.max_anz) && $smarty.session.anz_gs < $ini.gutschein.max_anz && $ini.gutschein.max_anz > 0}
                        <div class="gutschein_container">
                            <input type="text" name="gs_code" id="gs_code" value="" placeholder="Ihr Gutscheincode"/>
                            <button id="gutschein" class="shopButton">{$langstrings.buy.certificate_redeem}</button>
                        </div>
                        <div id="gs_check_result"></div>
                    {else}
                        <div class="basket_versand_item">
                            Sie haben einen Gutschein eingetragen, der direkt vom Warenwert abgezogen wird.
                        </div>
                    {/if}
                </div>

            </details>
        
            
        {/if}
        </div>
        
        {*
        {if $ini.PayPalPlus.aktiv==1 && $ini.PayPalPlus.clientId}
        <div data-pp-message data-pp-amount="{$smarty.session.SHOP.SUMME}" style="padding:2%;"></div>
        {/if}
        *}
                
        <div class="break"></div>

        
        <div class="versand_laenderauswahl">
            Versand nach:
            {if $smarty.session.SHOP.BASKET->shippingCountries|count==1}
                {foreach $smarty.session.SHOP.BASKET->shippingCountries as $land}
                    {$land}
                {/foreach}
            {else}
                {html_options options=$smarty.session.SHOP.BASKET->shippingCountries id="versand_laenderauswahl" name="Land" selected=$smarty.session.versand_laenderauswahl|default:$defaultLandID}
            {/if}
            <div id="versandoptionen">
            </div>
        </div>
        
 
    </div>

    <div class="bottom_nav">
        {if $ini.easycredit.aktiv==1}
            <div class="easycredit_box">
                <div><img src="/images/webelemente/za_easycredit.png" alt="easycredit Logo"></div>
                <div id="finanzierung"></div>
            </div>
        

            <link rel="stylesheet" type="text/css" href="https://ratenkauf.easycredit.de/ratenkauf/js/ratenrechner/v1/ratenrechner.css"/>
            <script type="text/javascript" src="https://ratenkauf.easycredit.de/ratenkauf/js/ratenrechner/v1/ratenrechner.js"></script>
            <script type="text/javascript">
                $(function(){
                    var options={
                        webshopId: "{$ini.easycredit.shop_id}",
                        finanzierungsbetrag: {$smarty.session.SHOP.BASKET->paymentInfo.Total},
                        euro:"ISO",
                        textVariante:'LANG'
                    }
                    rkPlugin.anzeige("finanzierung",options)
                })
            </script>
        {/if}            

       
        {if $ini.amazon.aktiv ==1}
        <div class="">
            {$amazon_buy_btn}
        </div>
        
        {/if}
        {if $ini.PayPalExpress.aktiv == 1}
        <div class="">
            {$ppe_buy_btn}
        </div>
        {/if}
        <div class="">
            <a class="shopButton" href="{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_1.html" onmouseout="window.status='Weiter zum Bestellformular';return false;" class="zurKasseButton" title="zur Kasse">
                weiter 
            </a>
        </div>

    </div>
{/if}
</div>
<!-- $Id: basket.tpl 2551 2022-10-13 09:33:09Z erling $ END -->
{/block}
