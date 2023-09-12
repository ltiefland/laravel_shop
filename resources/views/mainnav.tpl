<!-- $Id: mainnav.tpl 2392 2022-10-06 14:16:38Z tiefland $ BEGIN -->
<div class="mainnav inner">
    <div class="mainnav_items">
    {include file="einstieg02.tpl"}
    </div>
</div>     

{*
{if is_array($mainnav)}
<div class="mainnav">
    <div class="mainnav_items">
        <div id = "topic_themenwelten" class="box_top noprint uppercase bigger">Themenwelten</div>
        {foreach $mainnav as $i => $mainnavItem}
        <div class="box">
            <a href="{$mainnavItem["top"][0]["dirLink"]}">
                <div class="top">
                    <span class="bild">
                        <img  src="{$mainnavItem["top"][0].medien[0]->medium.bild_url}" title="{$mainnavItem["top"][0].name} - {$mainnavItem["top"][0].beschreibung}" alt="{$mainnavItem["top"][0].name} - {$mainnavItem["top"][0].beschreibung}" />
                    </span>
                </div>
            </a>
        </div>
        {/foreach}
    </div>
</div>
{/if}
*}
<!-- $Id: mainnav.tpl 2392 2022-10-06 14:16:38Z tiefland $ END -->
