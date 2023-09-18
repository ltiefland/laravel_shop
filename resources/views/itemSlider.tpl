{* itemSlider.tpl *}
{if $items|count > 1}
    <script>
        $(document).ready(function(){
            //weban.js
            // classname, width, slides, autoplay, infiniteLoop, forceWidth
            var w = $('.itemSliderWrapper_{$suffix}').width() - {$breite|default:100};
            var forceWidth = false;

            {* der Slider in home.tpl ..  *}
            {if $suffix=="slider1"}
                forceWidth = true;
            {/if}

            var slider = initSlider( "itemSlider_{$suffix|default:''}", w, {$anzahl|default:4}, 0, false, forceWidth );

            $( window ).resize(function(){
                var w = $('.itemSliderWrapper_{$suffix}').width();
                slider = reloadSlider( slider , w, {$anzahl|default:4}, 0, false, forceWidth );
            });
        });
    </script>
{/if}
 <style>
        .item_slider_inner {
            margin:0 auto;
            padding:0;
            background:#fff;
        }
        .section_itemSlider .box_top {
            margin-bottom: 10px;
        }
        .item_slider_wrapper_inner {
            padding: 2%;
        }
        .item_preis .uvp {
            font-size: 14px;
            color: white;
        }
       .bx-viewport {
            background:transparent!important;
        }

    </style>
    {if $itemSliderHeadline}
        <div class="box_top noprint"><h3>{$itemSliderHeadline|default:""}</h3></div>
    {/if}
    <div class="noprint ">
        <div class="itemSliderWrapper_{$suffix} itemSliderWrapper">
            <ul class="itemSlider_{$suffix|default:''}">
        {foreach $items as $i => $item}
            {if isset($item.medien[0]->medium.bild_url_br) && $item.medien[0]->medium.bild_url_br != ""}
                <li class="item_slider_mother" onclick="javascript:window.location.href='{$item.itemLink}';">
                    <div class="item_slider_inner">
                        <div class="item_slider_top">

                            <div class="item_special">
                            {if $item.preis > 1 && $item.vk_preis && $item.nachlass_prozent>5}
                                <div class="sie_sparen">-&nbsp;{$item.nachlass_prozent|round}%</div>
                            {/if}

                            {if $item.NEU}
                                <div class="neu_icon">
                                    Neu
                                </div>
                            {/if}
                            </div>

                        </div>
                        <div class="item_slider_img">
                            <a href="{$item.itemLink}" title="Zum Artikel {$item->name}">
                                <img src="{$item.medien[0]->medium.bild_url_gr}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item->name}" title="{$item->name}" {/if}/>
                            </a>
                        </div>
                        <div class="item_slider_wrapper">
                        <div class="item_slider_wrapper_inner">

                            <h3 class="bezeichnung slider topic">
                                <a href="{$item.itemLink}" title="Zum Artikel {$item.hersteller_kurzbezeichnung}">{$item.hersteller_kurzbezeichnung}</a>
                            </h3>

                            <div class="item_beschreibung">
                                {$item.beschreibung|strip_tags|replace:"http:":"https:"|truncate:90:"..."}
                            </div>

                            <div class="item_preis">
                                <a href="{$item.itemLink}" title="Zum Artikel {$item->name}">{$item.preis|money_format|replace:"EUR":"&euro;"}</a><br />
                                <!-- UVP -->
                                {if $ini.uvpPreisIndex}
                                    {assign var=UVP value="preis`$ini.uvpPreisIndex`"}
                                    {if $ini.template.durchstreichpreise==1 && $item.$UVP > $item.preis}
                                    <div class="uvp">
                                        <span>UVP: {$item.$UVP|money_format|replace:"EUR":"&euro;"|replace:"USD":"$"}</span>
                                    </div>
                                    {/if}
                                {/if}
                                <div class="preis_message">
                                    {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                                    {$langstrings.shop.price_msg}
                                    {else}
                                    {$langstrings.shop.price_msg_brutto}
                                    {/if} Versand
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </li>
            {/if}
        {/foreach}
            </ul>
        </div>
    </div>


