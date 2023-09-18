{extends file="buy.tpl"}
{block name="buyStep"}
<!-- $Id: buy_4.tpl 2392 2022-10-06 14:16:38Z tiefland $ BEGIN -->
<style>
	.left {
	display:none!important;
	}

	.right {
	display:none!important;
	}

	.content {
	/*margin-left:190px!important;
	        width:650px!important;*/
	min-height:600px;
	background-color:#fff;
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
{if $smarty.get.access_token}
<div class="box_2">
    <div class="basketNav2 noprint">
        <div class="steps_image desktop">
            <img onerror="this.src='/images/webelemente/bestellprozess_step4_active.png'" src="/images/webelemente/svg/bestellprozess_step4_active.svg" alt="Schritt für Schritt durch die Bestellung" />
        </div>
    </div>
    <div>
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

                        <br />
                        <br />

                        {if $Versandtextbaustein}
                            {$Versandtextbaustein}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>
                        {if $smarty.post.send_anfrage==1} Wir werden Ihre Anfrage schnellstm&ouml;glich bearbeiten und uns mit Ihnen in Verbindung setzen. {else} {$langstrings.buy.confirm_text} {/if}
                    </td>
                </tr>
                {if $ini.trustedShops.shop_id && $showTrustedShops==1}
                <!--
                <tr>
                    <td>
                        <table width="400" border="0" cellspacing="0" cellpadding="4">
                            <tr>
                                <td width="90">
                                    <form name="formSiegel" method="post" action="https://www.trustedshops.com/shop/certificate.php" target="_blank">
                                        <input type="image" src="/images/webelemente/siegel.gif" title="Trusted Shops G&uuml;tesiegel - Bitte hier G&uuml;ltigkeit pr&uuml;fen!">
                                        <input name="shop_id" type="hidden" value="{$ini.trustedShops.shop_id}">
                                    </form>
                                </td>
                                <td align="justify">
                                    <form id="formTShops" name="formTShops" method="post" action="https://www.trustedshops.com/shop/protection.php" target="_blank">
                                        <input name="_charset_" type="hidden" value="UTF-8">
                                        <input name="shop_id" type="hidden" value="{$ini.trustedShops.shop_id}">
                                        <input name="email" type="hidden" value="{$smarty.session.SHOP.buy.Persdata.email}">
                                        <input name="amount" type="hidden" value="{$smarty.session.SHOP.SUMMEINCVERSAND|number_format:2:".":""}">
                                        <input name="curr" type="hidden" value="EUR">
                                        <input name="paymentType" type="hidden" value="">
                                        <input name="KDNR" type="hidden" value="{$smarty.session.SHOP.buy.Persdata.ID}">
                                        <input name="ORDERNR" type="hidden" value="{{$smarty.session.SHOP.bestellId|default:$bestellId}}">
                                        Als zus&auml;tzlichen Service bieten wir Ihnen den Trusted Shops K&auml;uferschutz an. Wir &uuml;bernehmen alle Kosten dieser Garantie, Sie m&uuml;ssen sich lediglich anmelden.
                                        <br>
                                        <br>
                                        <input type="submit" id="btnProtect" name="btnProtect" value="Anmeldung zum Trusted Shops K&auml;uferschutz">
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                -->
                {/if}
                {if $ini.google.trustedstores_aktiv == 1}
                <tr>
                    <td>
                        <!-- START Google Zertifizierte Händler Order -->
                        <div id="gts-order" style="display:none;" translate="no">
                            <!-- start order and merchant information -->
                            <span id="gts-o-id">{{$smarty.session.SHOP.bestellId|default:$bestellId}}</span>
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
                                <span class="gts-i-name">{$item.kurzbezeichnung_erweitert|default:$item->name}</span>
                                <span class="gts-i-price">{$item.preis|number_format:2:".":""}</span>
                                <span class="gts-i-quantity">{$item.Menge}</span>
                                <span class="gts-i-prodsearch-id">{$item.ID}</span>
                                <span class="gts-i-prodsearch-store-id">{$ini.google.merchant_id}</span>
                            </span>
                            {/foreach}
                            <!-- end item 1 example -->
                            <!-- end repeated item specific information -->
                        </div>
                        <!-- END Google Zertifizierte Händler Order -->
                    </td>
                </tr>
                {/if}
            </table>
        </div>
    </div>
</div>
{else}
<div class="box_static">
	<div class="box_top">
		<h1>
            {assign var="abbruch" value=0}
            {if $meld|stristr:"abgebrochen"}
                 Kaufvorgang abgebrochen.
                 {assign var="abbruch" value=1}
            {else}
			     Vielen Dank f&uuml;r Ihren Einkauf.
            {/if}
		</h1>
	</div>
	<div>
		<p style="padding:20px;">
			{$meld}
		</p>
		{if $ini.trustedShops.shop_id && $abbruch==0}
		<table width="400" border="0" cellspacing="0" cellpadding="4">
			<tr>
				<td width="90">
					<form name="formSiegel" method="post" action="https://www.trustedshops.com/shop/certificate.php" target="_blank">
						<input type="image" src="/images/webelemente/siegel.gif" title="Trusted Shops G&uuml;tesiegel - Bitte hier G&uuml;ltigkeit pr&uuml;fen!">
						<input name="shop_id" type="hidden" value="{$ini.trustedShops.shop_id}">
					</form>
				</td>
				<td align="justify">
					<form id="formTShops" name="formTShops" method="post" action="https://www.trustedshops.com/shop/protection.php" target="_blank">
						<input name="_charset_" type="hidden" value="">
						<input name="shop_id" type="hidden" value="{$ini.trustedShops.shop_id}">
						<input name="email" type="hidden" value="{$smarty.session.SHOP.buy.Persdata.email}">
						<input name="amount" type="hidden" value="{$basketContent.basketSumme_brutto|number_format:2:". ":" "}">
						<input name="curr" type="hidden" value="EUR">
						<input name="paymentType" type="hidden" value="">
						<input name="KDNR" type="hidden" value="{$smarty.session.SHOP.buy.Persdata.ID}">
						<input name="ORDERNR" type="hidden" value="{$smarty.session.SHOP.buy.bestellID}">
						Als zus&auml;tzlichen Service bieten wir Ihnen den Trusted Shops K&auml;uferschutz an. Wir &uuml;bernehmen alle Kosten dieser Garantie, Sie m&uuml;ssen sich lediglich anmelden.
						<br>
						<br>
						<input type="submit" id="btnProtect" name="btnProtect" value="Anmeldung zum Trusted Shops K&auml;uferschutz">
					</form>
				</td>
			</tr>
		</table>
		{/if}
	</div>
</div>
{/if}
<!-- $Id: buy_4.tpl 2392 2022-10-06 14:16:38Z tiefland $ END -->
{/block}
