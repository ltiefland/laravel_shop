{extends file="buy.tpl"}
{block name="buyStep"}
<!-- $Id: buy_3.tpl 3018 2023-01-19 15:19:42Z erling $ BEGIN -->
<style>
    .left {
    display:none!important;
    }

    .right {
    display:none!important;
    }

    .content {
    width:100%!important;
    min-height:600px;
    }

    .box_middle_basket {
    padding:0!important;
    }

    .lastvisited_headline {
    display:none;
    }

    .lastvisited {
    display:none;
    }
</style>

<div class="box_2" style="float:left;width:100%;">
    <div class="basketNav2 noprint">
        <div class="steps_image desktop">
            <img onerror="this.src='/images/webelemente/bestellprozess_step4_active.png'" src="/images/webelemente/svg/bestellprozess_step4_active.svg" alt="Schritt für Schritt durch die Bestellung" />
        </div>
    </div>
    <div>
        {if $smarty.get.purchaseContractId}
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
                <div style="padding:20px 0 0 20px;" class="basket-table-items">
                    Unseren Datenschutzhinweis finden Sie
                    <a href="/index.php?id={$ini.typo3.datenschutz}" target="_blank"><u>hier</u></a>
                    .
                    <br>
                    <br>
                    <div class="midcol" style="float:left;width:100px;">
                        AGB's und
                        
                        Widerrufsrecht:
                    </div>
                    <div class="midcol" style="float:left;width:4%">
                        <input id="agb" type="checkbox" name="AGB+Widerrufsrecht" value="gelesen">
                    </div>
                    <div class="midcol" style="float:left;width:77%">
                        <label for="agb">
                            Ich habe die
                            <a href="/index.php?id={$ini.typo3.agb}" target="_blank"><u>AGB</u></a>
                            gelesen und bin mit ihnen einverstanden.
                            <br>
                            Ich habe mich &uuml;ber mein
                            <a href="/index.php?id={$ini.typo3.widerruf}" target="_blank"><u>Widerrufsrecht</u></a>
                            informiert.
                        </label>
                    </div>
                </div>
                <div style="clear: both;float:none;margin-bottom: 20px;">
                </div>
                <div class="midcol" style="float:left;padding-left:20px;">
                    <p>Bemerkung:</p>
                    <textarea style="font-size:0.7em!important;" name="Bemerkung" id="Bemerkung" cols="40" rows="4">
                        {$smarty.session["SHOP"]["buy"]["Persdata"]["Bemerkung"]}
                    </textarea>
                </div>
                <table class="basket-table-items">
                    <tr>
                        <td class="basket_head1" colspan="2">
                            Artikel
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="margin: 0px auto; border-bottom: none; width: 600px;" class="basket-items-overview">
                                <thead>
                                    <tr>
                                        <th style="text-align:left;width: 60px;">
                                            Menge
                                        </th>
                                        <th style="text-align:left;">
                                            Artikelbezeichnung
                                        </th>
                                        <th style="width:100px;" align="right">
                                            {if isset($smarty.session.sonderPreis.preisDaten)}Sonderpreis<br />Shop Preis{else}Einzelpreis{/if}
                                        </th>
                                        <th style="width:120px;" align="right">
                                            Gesamt
                                        </th>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="border-bottom: 1px dotted #909090;">
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    {section loop=$basketContent.items name=a_ind} {include file="basket_item_buy.tpl" item=$basketContent.items[a_ind]} {/section}
                                    <tr>
                                        <td>
                                        </td>
                                        <td colspan="2" style="text-align:left">
                                            {$versandInfo.title}:
                                        </td>
                                        <td style="text-align:right;">
                                            {$versandInfo.preis|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align:right">
                                            enthaltene Mehrwertsteuer (19%):
                                        </td>
                                        <td style="text-align:right;">
                                            {$basketContent.mwst|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align:right">
                                            Gesamtsumme brutto (inkl. 19% MwSt):
                                        </td>
                                        <td style="text-align:right;">
                                            {$basketContent.basketSumme_brutto|round:2|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
                <div style="text-align:right;padding:20px;clear: both;float:none;margin-bottom: 20px;">
                    <button id="place_order">
                        Kaufen
                    </button>
                </div>
            </div>
            <div id="erg">
            </div>
        </div>
        {else}
        <div class="box_top">
            <h1>
                Vielen Dank f&uuml;r {if $smarty.post.send_anfrage==1}Ihre Anfrage{else}Ihren Einkauf{/if}.
            </h1>
        </div>
        <div class="box_2">
            <table class="basket_table">
                <tr>
                    <td style="padding-top:20px;">
                        {assign var="showTrustedShops" value=1}
                        {if $smarty.post.send_anfrage==1}{assign var="showTrustedShops" value=0} Ihre Anfrage wurde an {$ini.titel_only} weitergeleitet und eine Best&auml;tigungsmail wurde an {$smarty.session.SHOP.buy.Persdata.email} geschickt. {else} Ihre Bestellung
                        wurde erfolgreich &uuml;bermittelt. Eine Best&auml;tigungsmail wurden soeben an {$smarty.session.SHOP.buy.Persdata.email} versendet. {/if}
                    </td>
                </tr>
                <tr>
                    <td>
                        {if $smarty.post.send_anfrage==1} Wir werden Ihre Anfrage schnellstm&ouml;glich bearbeiten und uns mit Ihnen in Verbindung setzen. {else} {$langstrings.buy.confirm_text} {/if}
                    </td>
                </tr>
                {if $ini.trustedShops.shop_id && $showTrustedShops==1}
                <tr>
                    <td>
                        <table width="510" border="0" cellspacing="0" cellpadding="4">
                            <tr>
                                <td width="110" style="text-align:center;">
                                    <form name="formSiegel" method="post" action="https://www.trustedshops.com/shop/certificate.php" target="_blank">
                                        <input type="image" src="/images/webelemente/siegel.gif" title="Trusted Shops G&uuml;tesiegel - Bitte hier G&uuml;ltigkeit pr&uuml;fen!">
                                        <input name="shop_id" type="hidden" value="{$ini.trustedShops.shop_id}">
                                    </form>
                                </td>
                                <td align="justify" width="400">
                                    <div id="trustedShopsCheckout" style="display: none;">
                                        <span id="tsCheckoutOrderNr">{$smarty.session.SHOP.bestellId|default:$bestellId}</span>
                                        <span id="tsCheckoutBuyerEmail">{$smarty.session.SHOP.buy.Persdata.email}</span>
                                        <span id="tsCheckoutOrderAmount">{$smarty.session.SHOP.SUMMEINCVERSAND|number_format:2:".":""}</span>
                                        <span id="tsCheckoutOrderCurrency">EUR</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                {/if}
                {if $ini.google.trustedstores_aktiv == 1}
                <tr>
                    <td>
                        <!-- START Google Zertifizierte Haendler Order -->
                        <div id="gts-order" style="display:none;" translate="no">
                            <!-- start order and merchant information -->
                            <span id="gts-o-id">{$bestellId}</span>
                            <span id="gts-o-domain">{$smarty.server.SERVER_NAME}</span>
                            <span id="gts-o-email">{$smarty.session.SHOP.buy.Persdata.email}</span>
                            <span id="gts-o-country">DE</span>
                            <span id="gts-o-currency">EUR</span>
                            <span id="gts-o-total">{$smarty.session.SHOP.SUMMEINCVERSAND|number_format:2:".":""}</span>
                            {if $smarty.session.SHOP.RABATT !=0.00}
                            <span id="gts-o-discounts">{$smarty.session.SHOP.RABATT|round:2|number_format:2:".":""}</span>
                            {else}
                            <span id="gts-o-discounts">0</span>
                            {/if}
                            <span id="gts-o-shipping-total">{$versandInfo.preis|number_format:2:".":""} </span>
                            <span id="gts-o-tax-total">{$smarty.session.SHOP.MWSTVONSUMME|round:2|number_format:2:".":""}</span>
                            <span id="gts-o-est-ship-date">{"+1 day"|strtotime|date_format:"Y-m-d"}</span>
                            {if $smarty.session.SHOP.buy.Persdata.liefer_Land_Name == "Deutschland"}
                            <span id="gts-o-est-delivery-date">{"+2 day"|strtotime|date_format:"Y-m-d"}</span>
                            {else}
                            <span id="gts-o-est-delivery-date">{"+5 day"|strtotime|date_format:"Y-m-d"}</span>
                            {/if}
                            {assign var="hasPreorder" value=false}
                            {foreach $basketContent.items as $index => $item}
                                {if $item.LieferstatusValue > 1}
                                {assign var="hasPreorder" value=true}       
                                {/if}
                            {/foreach}
                            {if $hasPreorder}
                            <span id="gts-o-has-preorder">Y</span>  
                            {else}
                            <span id="gts-o-has-preorder">N</span>  
                            {/if}
                            <span id="gts-o-has-digital">N</span>
                            <!-- end order and merchant information -->
                        
                            <!-- start repeated item specific information -->
                            <!-- item example: this area repeated for each item in the order -->
                            {foreach $basketContent.items as $index => $item}
                            <span class="gts-item">
                                <span class="gts-i-name">{$item.kurzbezeichnung_erweitert|default:$item.kurzbezeichnung}</span>
                                <span class="gts-i-price">{$item.preis|number_format:2:".":""}</span>
                                <span class="gts-i-quantity">{$item.Menge}</span>
                                <span class="gts-i-prodsearch-id">{$item.ID}</span>
                                <span class="gts-i-prodsearch-store-id">{$ini.google.merchant_id}</span>
                            </span>
                            {/foreach}
                            <!-- end item 1 example -->
                            <!-- end repeated item specific information -->
                        </div>
                        <!-- END Google Zertifizierte Haendler Order -->
                    </td>
                </tr>
                {/if}
                <tr>
                    <td>
                        {if $zahlungsformular}
                        {if $versandInfo.versandart=="finanzierung"}
                            <script type="text/javascript">
                                $(function(){
                                    $('#finanzierungsDialog').dialog({
                                        resizable:false,
                                        width:1000,
                                        height:800,
                                        modal:true
                                    });
                                })
                            </script>
                            <div id="finanzierungsDialog">
                                <iframe width="100%" height="700" src="{$zahlungsformular}"></iframe>
                            </div>
                        {elseif $versandInfo.versandart=="payever"}
                            <script type="text/javascript">
                                $(function(){
                                    $('#finanzierungsDialog2').dialog({
                                        resizable:false,
                                        width:1000,
                                        height:800,
                                        modal:true
                                    });
                                })
                            </script>
                            <div id="finanzierungsDialog2">
                                <iframe width="100%" height="700" src="{$zahlungsformular}"></iframe>
                            </div>
                        {else}
                            {$zahlungsformular}
                        {/if}
                        {else}
                            {$meld}
                        {/if}
                    </td>
                </tr>
            </table>
            <div class="bottom_nav">
                <p>
                    <a href="/"><img class="butt_hover" src="/images/webelemente/butt_zurueck_zum_shop.png" alt="zur&uuml;ck zum Shop" /></a>
                </p>
            </div>
        </div>
        {/if}
    </div>
</div>
{if $ini.facebook.pixel_aktiv==1 && isset($ini.facebook.id)}
<script>
  fbq('track', 'Purchase');
</script>
{/if}


        {if $ini.google.kundenrezension_aktiv==1}
        <script type="text/plain" data-usercentrics="Google Kundenrezensionen">
            function ISODateString(d) {
                function pad(n) { return n<10 ? '0'+n : n }
                return d.getUTCFullYear()+'-'
                + pad(d.getUTCMonth()+1)+'-'
                + pad(d.getUTCDate())
            }
            console.log("google...");
            
            window.renderOptIn = function() {
                // estimated_delivery_date
                var edd = new Date();
                var addDays = {$ini.google.estimated_delivery_date};
                edd.setDate(edd.getDate() + addDays);
                edd_formatted = ISODateString(edd);
                
                {if $smarty.session.bestellId}
                    
                    window.gapi.load('surveyoptin', function() {
                        window.gapi.surveyoptin.render( {
                            "merchant_id": {$ini.google.merchant_id},
                            "order_id": "{$smarty.session.bestellId}",
                            "email": "{$smarty.session.SHOP.buy.Persdata.email}",
                            "delivery_country": "DE",
                            "estimated_delivery_date":edd_formatted,
                            "opt_in_style": "CENTER_DIALOG"
                        {if $smarty.session.google.products}
                            ,"products": {$smarty.session.google.products}
                        {/if}
                        });
                    });
                {/if}
            }
        </script>
        <!-- ANFANG Sprachcode für Opt-in-Modul von Google Kundenrezensionen -->
        <script>
            window.___gcfg = {
            lang: 'de_DE'
        };
        </script>
        <!-- END GCR Language Code -->        
        {/if}

<!-- $Id: buy_3.tpl 3018 2023-01-19 15:19:42Z erling $ END -->
{/block}