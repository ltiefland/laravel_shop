{if $item.preis > 0}
        <div class="box_3">
            <div class="lastVisit" id="a_{$item.ID}">
                <div class="lastVisitItem">
                    <a href="{$item.itemLink}">
                        <img src="{$item.medien[0]->medium.bild_url_mini}" width="50" alt="{$item->name}" title="{$item->name}" />
                    </a>
                </div>

                <div class="hidden lastVisitItemZoom" id="b_{$item.ID}">
                    <div>

                        <div style="text-align:center;height:120px;">
                            <a href="{$item.itemLink}"><img src="{$item.medien[0]->medium.bild_url_mini}" width="50" alt="{$item->name}" title="{$item->name}" /></a>
                        </div>
                        <div style="text-align:center;">
                            <div class="small" style="">
                            <a href="{$item.itemLink}">{$item->name|truncate:70:"...":true:false}</a>
                            </div>

                            <div>
                                <a href="{$item.itemLink}"><strong class="preis_tiny" style="color:#7C0303;">{$item.preis1|money_format|replace:"EUR":"&euro;"}</a><br />
                            </div>
                            <div style="font-size:0.8em;"><a class="link" style="cursor:pointer;" onmouseover="return overlib('', CAPTION, '', HAUTO, VAUTO, WIDTH, 190);" onmouseout="return nd();"></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
{/if}
