<!-- $Id: subdir_artstamm.tpl 31 2023-05-06 21:19:54Z lars $ BEGIN -->
<div class="artikel_box">

    <div class="top"
            onclick="window.location.href = '/directory/{$artstamm->id}-{$artstamm->slug}';"
            style="
                cursor:pointer;
                background:url('/images/upload/{$item.medium[0]->medium->folder}/kl/{$item.medium[0]->medium->name}') no-repeat top center;
                background-size:contain;
                
            "
    >
        <div class="box1_topright">{$artstamm->hersteller_Logo1}</div>
        <div class="bild">
        {*
            <a href="{$artstamm->dirLink}">
            <img id="img_{$artstamm->ID}" src="{$artstamm->medien[0]->medium.bild_url_klein}" {if $artstamm->medien[0]->medium["beschreibung"] != ""}alt="{$artstamm->medien[0]->medium["beschreibung"]}" title="{$artstamm->medien[0]->medium["beschreibung"]}"{else}alt="{$artstamm->Name}" title="{$artstamm->Name}" {/if} />
            </a>
            *}
        </div>
    </div>
    <div class="center">
        <a href="/directory/{$artstamm->id}-{$artstamm->slug}">
            <div class="itemname">
                <div class="itemnameInner" title="{$artstamm->name}">
                    {$artstamm->name|truncate:60:"..."}
                </div>
            </div>
            <div class="description">
                <div class="descriptionInner">
                    {$artstamm->description|strip_tags|truncate:150}
                </div>
            </div>            
            <div class="preis">
                <div class="preisInner">
                {if $artstamm->anz > 1} 
                    {if $artstamm->mehrerePreise}ab{/if} 
                {/if}
                {$artstamm->startpreis_tpl|money_format|replace:"EUR":"&euro;"}
                </div>
                <div class="preis_message">
                    <div class="preis_messageInner">
                        {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                        {$langstrings.shop.price_msg} 
                        {else}
                        {$langstrings.shop.price_msg_brutto}
                        {/if}
                        <a href="/versand_uebersicht.html" style="cursor:pointer;" onmouseover="return overlib('{$item.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg_link}</a>
                        {if $artstamm->gebinde_menge > 0 && $artstamm->gebinde_menge !=1 && $artstamm->gebinde_einheit}
                        Grundpreis: {($artstamm->preis_brutto/$artstamm->gebinde_menge)|number_format:2} &euro; / {$artstamm->gebinde_einheit}<br />
                        {/if}
                    </div>
                </div>  
                
            </div>
        </a>
    </div>
        
</div>
<!-- $Id: subdir_artstamm.tpl 31 2023-05-06 21:19:54Z lars $ END -->