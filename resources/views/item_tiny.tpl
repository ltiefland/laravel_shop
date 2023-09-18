{if $item.preis > 0}
<div class="box_3">
    <div class="box_middle" style="position: relative;">
    {$item.NEU}
        <div class="box_img">
            <a href="{$item.itemLink}"><img src="{$item.medien[0]->medium.bild_url_mini}" alt="{$item->name}" title="{$item->name}" /></a>
        </div>
        <div class="box_text">
            <a href="{$item.itemLink}">{$item->name|truncate:100:"...":true:false}</a><br /><br />

            {$item.preis_brutto_klein}<br />
            <span style="font-size:0.8em;">inkl. Mwst., zzgl. <a href="/versand_uebersicht.html">Versand</a></span>
        </div>

    </div>
</div>
{/if}
