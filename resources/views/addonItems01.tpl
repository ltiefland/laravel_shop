<div style="max-width:324px;width:100%;clear:both;none;padding:1%;">{$langstrings.item.addonitems}:<br /></div>
      
<div class="addonItems_click">
    {foreach $addonitems as $item}
    <!-- ANFANG Artikel -->
    <div class="box_addons" id="a_{$item.ID}"> 
        <a style="cursor:pointer;">
            <img src="{$item.medien[0]->medium.bild_url_mini}" width="50" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" {/if} />
        </a>
    </div>
    <!-- ENDE Artikel -->

    <div class="hidden addonItemZoom" id="{$item.ID}">
        <div class="addon_items_close">
            X
        </div>
        <div>
            <div style="width:100%;display:table-cell;vertical-align:middle;text-align:center;height:125px;">
                <a href="{$item.itemLink}">
                    <img src="{$item.medien[0]->medium.bild_url_mini|urldecode}" style="max-width:125px;max-height:120px;" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" {/if} />
                </a>
            </div>
            <div style="text-align:center;">
                <div class="small" style="">
                <a href="{$item.itemLink}">{$item.kurzbezeichnung|truncate:100:"...":true:false}</a>
                </div>
                
                <div style="margin:15px 0 0 0;">
                    <strong class="item_slider_preis">{$item.preis|money_format|replace:"EUR":"&euro;"}<br /></strong>
                </div>
                <div style="font-size:0.8em;text-transform:none;">{$langstrings.shop.price_msg_brutto}<a href="/versand_uebersicht.html" class="link" style="cursor:pointer;" onmouseover="return overlib('{$item.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg_link}</a></div>
            </div>
            <div style="text-align:center;height:40px;margin-top:7px;">
                {if $item.option_exists}
                    <a href="{$item.itemLink}">zum Artikel</a>
                {else}
                
                <form action="/index.php" id="basket_{$item.ID}" class="basket_form">
                    <input type="hidden" name="confirm" value="true" />
                    <input type="hidden" name="buy" value="false" />
                    <input type="hidden" name="Menge" value="1" />
                    <input type="hidden" name="item" value="{$item.ID}" />
                    <input type="hidden" name="basket" value="true" />
                    
                    <div class="addonBasketButton">
                    {if $smarty.get.basket==true}
                    <img class="addon_basket" src="/images/webelemente/butt_basket_small.png" alt="{$langstrings.shop.in_basket}" 
                        title="{$langstrings.shop.in_basket}" id="addon_{$item.ID}" />
                    {else}
                    <img class="addon_to_basket" src="/images/webelemente/butt_basket_small.png" alt="{$langstrings.shop.in_basket}" 
                        title="{$langstrings.shop.in_basket}" id="addon_{$item.ID}" />
                    {/if}
                    </div>
                </form>
                
                {/if}
            </div>
        </div>
    </div>
    {/foreach}
</div>