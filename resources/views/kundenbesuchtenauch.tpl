<script>
    $(document).ready(function(){

        //weban.js
        var slider = initSlider( "sliderKBA", $(window).width(), 3 );

        $( window ).resize(function(){
            var windowWidth = $(this).width();
            slider = reloadSlider( slider , windowWidth, 3 );
        });

    });
</script>
<div class="kundenBesuchtenAuch noprint">
    <div class="box_top">Das k&ouml;nnte Sie auch interessieren</div>
    <div class="sliderKBAWrapper">
        <ul class="sliderKBA">
            {foreach $item["kba"] as $i => $itemKBA}
            {if isset($itemKBA.medien[0]->medium.bild_url_mini) && $itemKBA.medien[0]->medium.bild_url_mini != ""}
            <li>
                <div class="item_slider_inner">
                    <div class="item_slider_top">
                        {if $itemKBA.neu}
                        <div class="item_slider_neu" >
                            <img class="item_slider_neu" src="/images/webelemente/butt_neuheit.png" alt="Neu im Shop" />
                        </div>
                        {/if}

                    </div>
                    <div class="item_slider_img">

                        <a href="{$itemKBA.itemLink}" title="Zum Artikel {$itemKBA.name}">
                            <img style="max-height:120px;" src="{$itemKBA.medien[0]->medium.bild_url_mini}" {if $itemKBA.medien[0]->medium["beschreibung"] != ""}alt="{$itemKBA.medien[0]->medium["beschreibung"]}" title="{$itemKBA.medien[0]->medium["beschreibung"]}"{else}alt="{$item->name}" title="{$itemKBA.name}" {/if}/>
                        </a>

                    </div>
                    <div class="item_slider_wrapper">
                        <h3 class="bezeichnung">
                            <a href="{$itemKBA.itemLink}" title="Zum Artikel {$itemKBA.name}">{$itemKBA.name|truncate:"45"}</a>
                        </h3>
                        <span class="item_preis">
                            <a href="{$itemKBA.itemLink}" title="Zum Artikel {$itemKBA.name}">{$itemKBA.preis|money_format|replace:"EUR":"&euro;"}</a><br />
                            {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                            {$langstrings.shop.price_msg}
                            {else}
                            {$langstrings.shop.price_msg_brutto}
                            {/if}
                            <a href="/versand_uebersicht.html" title="Versandkosten" style="cursor:pointer;color:#3A3B3D!important;" onmouseover="return overlib('{$itemKBA.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg_link}</a>
                        </span>
                    </div>
                </div>
            </li>
            {/if}
            {/foreach}
        </ul>
    </div>
</div>
