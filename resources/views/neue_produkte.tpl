<script>
    $(document).ready(function(){
        //weban.js
        var slider = initSlider( "sliderNeueProdukte", $(this).width(), 4 );

        $( window ).resize(function(){
            var windowWidth = $(this).width();
            slider = reloadSlider( slider , windowWidth );
        })
    })
</script>
<div class="neueProdukte">
    <div class="box_top bigger uppercase"><div>Neue Produkte</div></div>
    <div class="sliderNeueProdukteWrapper bgwhite">
        <ul class="sliderNeueProdukte">
            {foreach $neue_produkte as $i => $item}
            <li>
                <div class="item_slider_inner">
                    <!--<div class="item_slider_top">
                        <div class="item_slider_neu" >
                            <img class="item_slider_neu" src="/images/webelemente/icon_neu.png" alt="Neu im Shop" />
                        </div>
                    </div>-->
                    <div class="item_slider_img">
                        <a href="{$item.itemLink}" title="Zum Artikel {$item->name}">
                            {if isset($item.medien[0]->medium.bild_url_mini) && $item.medien[0]->medium.bild_url_mini != ""}
                            <img style="max-height:120px;" src="{$item.medien[0]->medium.bild_url_mini}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item->name}" title="{$item->name}" {/if}/>
                            {/if}
                        </a>
                    </div>
                    <div class="item_slider_wrapper">
                        <h3 class="bezeichnung uppercase">
                            <a href="{$item.itemLink}" title="Zum Artikel {$item->name}">{$item->name|truncate:"45"}</a>
                        </h3>
                        <span class="item_preis">
                            <a href="{$item.itemLink}" title="Zum Artikel {$item->name}">{$item.preis|money_format|replace:"EUR":"&euro;"}</a><br />
                            <div class="preis_message">
                            {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                            {$langstrings.shop.price_msg}
                            {else}
                            {$langstrings.shop.price_msg_brutto}
                            {/if}
                            <a href="/versand_uebersicht.html" style="cursor:pointer;color:#3A3B3D!important;" onmouseover="return overlib('{$item.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg_link}</a>
                            </div>
                        </span>
                    </div>
                </div>
            </li>
            {/foreach}
        </ul>
    </div>
</div>

