<!-- $Id: basket_info.tpl 2969 2022-11-29 14:29:26Z tiefland $ BEGIN -->
<div class="inner">
{if $smarty.session.SHOP.SUMME && count($smarty.session.SHOP.BASKET)>0}
    {foreach $basketContent.items as $index => $item}
        {if $item["ID"] && $item["Father"] > 0}
        <div class="basket_info_a">
            <div style="float:left;padding-right:1%;width:29%;">
                <a href="{$item["itemLink"]}">
                <img style="background-color:#fff;border:1px solid #ccc;padding:2px;" src="{$item.medien[0]->medium.bild_url_mini}" />
                </a>
            </div>
            <div style="text-align:left;float:right;width:70%;">
                <a href="{$item.itemLink}">{$item.Menge}x 
                {$item.kurzbezeichnung_erweitert} {if $item.Menge>1}({$item.preis_brutto|money_format|replace:"EUR":"&euro;"}){/if}
                {if $item.auspraegung}
                    {$item.auspraegung}
                {/if}<br />
        
                <div class="basket_info_preis">{($item.preis_brutto * $item.Menge)|money_format|replace:"EUR":"&euro;"}</div></a>
            </div>
        </div>
        {/if}
    {/foreach}

    <div class="basket_info_sum"><a href="{$buy_link_base}/basket.html">Summe: {$smarty.session.SHOP.SUMME|money_format|replace:"EUR":"&euro;"}</a></div>

    <div class="basket_info_msg">
        {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
        {$langstrings.shop.price_msg} 
        {else}
        {$langstrings.shop.price_msg_brutto}
        {/if}
        <a href="/versand_uebersicht.html">Versand</a>
    </div>
    
    <a style="float:right;margin:10px -10px 0 0;" href="{$buy_link_base}/basket.html"><img class="butt_hover" src="/images/webelemente/butt_zur_Kasse.png" /></a>		
{else}
    Sie haben noch keine Artikel im Einkaufswagen.
{/if}
</div>

<!-- 
onmouseover="return overlib('<img src={$basketContent.items[b_ind].medien[0]->medium.bild_url_mini} />',VAUTO,HAUTO,WIDTH,70,HEIGHT,70);" onmouseout="return nd();"
-->
<!-- $Id: basket_info.tpl 2969 2022-11-29 14:29:26Z tiefland $ END -->
