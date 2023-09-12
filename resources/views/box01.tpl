<style>
.topseller .bx-viewport {
    left:0px!important;
    top:0px!important;
    width:290px;
}
</style>
<div class="box">
    <div class="head">
        <h1>Bestseller</h1>
    </div>
    <div class="box_content topseller" style="font-size:16px;">
        {if $topseller|is_array}
        <ul class="bxslider" style="text-align:center!important;">
            {foreach $topseller as $key => $item}
            {if $item.medien[0]->medium.bild_url_klein}
            <li style="text-align:center!important;width:100%;">
                <a href="{$item.itemLink}"><img style="padding:10px;margin:0 auto!important;" src="{$item.medien[0]->medium.bild_url_klein}" /></a><br />
                <a href="{$item.itemLink}"><b>{$item.kurzbezeichnung}</b></a><br /><br />
                <a href="{$item.itemLink}"><b style="font-size:24px;">{$item.preis|money_format|replace:"EUR":"&euro;"|replace:"USD":"$"}</b></a>
            </li>
            {/if}
            {/foreach}
        </ul>
        {/if}
    </div>
</div>