{forEach $smarty.session.SHOP.BASKET->items as $index => $data}
    {assign var="anzahlArtikel" value= $anzahlArtikel + $data->Menge}
{/foreach}
<div>
    <a href="{$buy_link_base}/basket.html" title="{if $anzahlArtikel>0}{$anzahlArtikel} Artikel im Warenkorb.{else}Warenkorb ist leer.{/if}" style="display:block;width:100%;text-align:center;">
        {if is_array($smarty.session.SHOP.BASKET->items) && count($smarty.session.SHOP.BASKET->items)>0}
            <div class="basketIconWrapper desktop"><img class="basketIcon" src="/images/webelemente/icon_warenkorb_active.svg" alt="Mein Warenkorb" /></div>
            <div class="basketIconWrapper mobile"><img class="basketIcon" src="/images/webelemente/icon_warenkorb_active.svg" alt="Mein Warenkorb" /></div>
    
        {else}
            <div class="basketIconWrapper desktop"><img class="basketIcon" src="/images/webelemente/icon_warenkorb.svg" alt="Mein Warenkorb" /></div>
            <div class="basketIconWrapper mobile"><img class="basketIcon" src="/images/webelemente/icon_warenkorb.svg" alt="Mein Warenkorb" /></div>
        {/if}
        {*
        <div class="{if count($smarty.session.SHOP.BASKET)>=10}header_wk_anzahl_10{else}header_wk_anzahl{/if} desktop">{$anzahlArtikel|default: 0}</div>
         <div class="wk_text bold desktop uppercase">Warenkorb</div> 
        <div class="desktop uppercase small">{$anzahlArtikel|default: 0} Artikel:  {$smarty.session.SHOP.SUMME|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</div>
        *}
    </a>
</div>
{*
<div id="wk_open" class="warenkorb_menu hd_warenkorb">
    {include file="basket_info.tpl"}
</div>
*}
