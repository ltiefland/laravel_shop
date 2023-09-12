<style>
{if $items|count<=4}
#slidertopSeller .bx-controls {
    display:none;
}
{/if}

.bx-loading {
    display:none;
}
</style>
<section class="lastvisited noprint">
    <div class="inner">   
        <p class="subdir_choose_category">Top Seller {if $subdir.name} aus dieser Kategorie{/if}:</p>
        <div class="sliderLastVisitedWrapper" id="slidertopSeller">
            <ul class="slidertopSeller">
                {foreach $items as $i => $item}
                <li>
                    <div class="item_slider_inner">
                        <div class="item_slider_top">
                            {if $item.neu}
                            <div class="item_slider_neu" >
                                <img class="item_slider_neu" src="/images/webelemente/svg/butt_neu_im_shop.svg" alt="Neu im Shop" />
                            </div>
                            {/if}
                            {if $item.hersteller_Logo1 && !$item.hersteller_Name|stristr:"DIVERSE"}
                            <div class="hersteller">
                                {$item.hersteller_Logo1}
                            </div>
                            {/if}
                        </div>
                        <div class="item_slider_img">
                        {if $item.medien[0]->medium.typ_id==1 || $item.medien[0]->medium.typ_id==NULL || $item.medien[0]->medium.typ_id==""}
                            <a href="{$item.itemLink}">
                                <img src="{$item.medien[0]->medium.bild_url_klein}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" {/if}/>
                            </a>
                        {else}
                             <a href="{$item.itemLink}"><img src="/images/webelemente/noPicture.gif" /></a>
                        {/if}
                        </div>
                        <div class="item_slider_wrapper">
                            <div class="item_category">
                                {$item.kategorie}                                
                            </div>
                            <div class="bezeichnung">
                                <a class="item_slider_link" href="{$item.itemLink}" title="{$item.kurzbezeichnung}">{$item.kurzbezeichnung|truncate:40}</a>
                            </div>
                            <div class="preisInner">
                                <a href="{$item.itemLink}">{$item.preis|money_format|replace:"EUR":"&euro;"}</a><br />
                                <span class="preis_message">{$langstrings.shop.price_msg_brutto}<a href="/versand_uebersicht.html" style="cursor:pointer;color:#3A3B3D!important;" onmouseover="return overlib('{$item.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg_link}</a></span>
                            </div>
                        </div>
                    </div>
                </li>
                {/foreach}
            </ul> 
        </div>
    </div>
</section>
<!-- /topseller.tpl -->