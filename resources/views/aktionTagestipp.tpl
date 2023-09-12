<div class="box_top">
    <h1>
        <a href="{$aktion.tagestipp.itemLink}">{$aktion.tagestipp.headline} {$aktion.tagestipp.kurzbezeichnung}</a>
    </h1>
    <div class="box_middle">
        <div class="box_img">
            <a href="{$aktion.tagestipp.itemLink}">
                <img class="picture" src="{$aktion.tagestipp.bild_1_url}"  alt="{$aktion.tagestipp.ArtAktionName}" title="{$aktion.tagestipp.ArtAktionName}" />
            </a>
        </div>
        <p>
            {$aktion.tagestipp.beschreibung_Intro|nl2br}
            <br />
            {$aktion.tagestipp.preis1} Euro
            <a style="cursor:pointer;" onmouseover="return overlib('{$aktion.tagestipp.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg}</a>
        </p>
    </div>
    <div class="box_bottom">
        <p class="detail">
            <a href="{$aktion.tagestipp.itemLink}">Details ...</a>
        </p>
        <a href="{$aktion.tagestipp.instantConfirm}"><img class="basket" src="/images/webelemente/basket.gif" alt="{$langstrings.shop.in_basket}" title="{$langstrings.shop.in_basket}" /></a>
    </div>
</div>
<div class="break">&nbsp;</div>