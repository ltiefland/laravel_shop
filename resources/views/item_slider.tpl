<!--$Id: item_slider.tpl 2969 2022-11-29 14:29:26Z tiefland $ BEGIN -->
{if $items|count}
<script>
    $(document).ready(function(){
        // weban.js
        // classname, windowWidth, slides, autoplay, infiniteLoop
        var slider = initSlider( "{$suffix}", $(window).width(), 4, 0, true );
        $( window ).resize(function(){
            var windowWidth = $(this).width();
            slider = reloadSlider( slider , windowWidth, 4, 0, true );
        });
    });
</script>
<style>
.bx-wrapper img
{
    max-height:unset !important;
}
.bx-wrapper .bx-viewport
{
    margin-bottom:5%;
}
</style>
<div class="noprint">
    <div class="subdir_choose_category"><h4>{$itemSliderHeadline}</h4></div>
    <div class="sliderLastVisitedWrapper">
        <ul class="sliderLastVisited {$suffix}">
            {foreach $items as $i => $item}
            <li>
                <div class="item_slider_inner">
                    <div class="item_slider_top">

                        {if $item.NEU}
                        <div class="item_slider_neu" >
                            NEU!
                        </div>
                        {/if}

                    </div>
                     <div class="item_slider_img">
                        {if $item.medien[0]->medium.typ_id==1 || $item.medien[0]->medium.typ_id==NULL || $item.medien[0]->medium.typ_id==""}
                            <a href="{$item.itemLink}">
                                <img src="{$item.medien[0]->medium.bild_url_gr}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item->name}" title="{$item->name}" {/if}/>
                            </a>
                        {else}
                             <a href="{$item.itemLink}"><img src="/images/webelemente/noPicture.gif" /></a>
                        {/if}
                        </div>
                        <div class="item_slider_wrapper">

                            <div class="bezeichnung">
                                <a class="item_slider_link" href="{$item.itemLink}" title="{$item->name}">{$item->name|truncate:40}</a>
                            </div>
                            <div class="preisInner">
                                <a href="{$item.itemLink}">{$item.preis|money_format|replace:"EUR":"&euro;"}</a><br />
                                <span class="preis_message">

                                        {if $langstrings.shop.price_msg_brutto}
                                            {if $ini.modules.versandinfo_dialog}
                                                {$langstrings.shop.price_msg_brutto} <a class="versandinfo_open">{$langstrings.shop.price_msg_link}</a>
                                            {else}
                                                {$langstrings.shop.price_msg_brutto} <a href="/versand_uebersicht.html" style="cursor:pointer;">{$langstrings.shop.price_msg_link}</a>
                                            {/if}
                                        {/if}

                                </span>
                            </div>
                        </div>
                </div>
            </li>
            {/foreach}
        </ul>
    </div>
</div>
{/if}
<!--$Id: item_slider.tpl 2969 2022-11-29 14:29:26Z tiefland $ END -->
