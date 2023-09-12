<div class="qv_container">
    <div class="qv_left">

        {* Gro�es Bild *}
        <div class="qv_img">

            {if $item.medien[0]->medium.bild_url_br != $ini.itemKorrektur.noImage}
            <img class="mausDrin" src="{$item.medien[0]->medium.bild_url_br}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" {/if} id="img_zoom" data-zoom-image="{$item.medien[0]->medium.bild_url_gr}" />
            {else}
                <img src="{$ini.itemKorrektur.noImage}" alt="" />
            {/if}
        </div>
    </div>
    <div class="qv_right">
        <div class="qv_inner">
            <div class="">
                {if $item.hersteller_Name}
                    {$item.hersteller_Name}<br />
                {/if}
                 <a class="itemName" href="{$item.itemLink}{if stristr($item.itemLink,'?from')}{-$addfrom}{elseif isset($addfrom)}?from={$addfrom}{/if}">
                   <b style="color:#a58c4a!important;"> {$item.kurzbezeichnung} </b>
                 </a>
                 {if $item.langbezeichnung}
                    <p>{$item.langbezeichnung}</p>
                 {/if}
                 
                {* Preisinfo *}
                <div class="itemPreis">
                    
                    {* Preis *}
                    <span style="display:none">
                        <span>{$item.preis|money_format|replace:"EUR":"&euro;"}</span>
                    </span>
                    
                    <span class="preis">
                        {$item.preis|money_format|replace:"EUR":"&euro;"}
                    </span>
                    
                
                {if $item.preis > 1 && $item.vk_preis && $item.nachlass_prozent>0}
                    <div class="sie_sparen">
                        <span style="text-decoration:line-through;font-size:15px;font-weight:700;">{$item.vk_preis|money_format|replace:"EUR":"&euro;"|replace:"USD":"$"}</span>
                        Sie sparen: {($item.vk_preis-$item.preis)|money_format|replace:"EUR":"&euro;"|replace:"USD":"$"}
                    </div>
                {/if}
                </div>
                
                {* Weitere Informationen zum Preis *}
                <div class="box_singleitem_preis_message black">
                    {if $item.gebinde_menge > 0 && $item.gebinde_einheit}
                    Grundpreis: {($item.preis/$item.gebinde_menge)|number_format:2} &euro;/{$item.gebinde_einheit}<br>
                    {/if}
            {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.module.netto_preise == true}
            zzgl. MwSt, 
            {else}
            inkl. MwSt,
            {/if}
 
                    <a href="/versand_uebersicht.html" style="cursor:pointer;" onmouseover="return overlib('{$item.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg_link}</a>
                </div>
                

                {* Menge im Warenkorb *}
                <div class="basketMenge">
                    <div class="mengen_input">
                        <!--<label style="padding-top:2px;">Anzahl angeben:</label>--> 
                        <input class="mengeninput" type="hidden" name="Menge" value="1" />
                    </div>
                </div>

                {* Aktion Buttons (Warenkorb, Merken etc)
                <div class="itemBasketButton">     
                    <div class="itemSmall_menge">
                        <div class="menge_text"><strong>Menge:</strong></div>
                        <div class="itemSmall_menge_buttons">
                            <input class="change_menge" id="minus_{$item.ID}" type="button" value="-" /><input class="mengeninput_{$item.ID} mengeninput" type="text" name="Menge" value="1" /><input class="change_menge" type="button" value="+" id="plus_{$item.ID}"/>
                        </div>
                    </div>        
                    <div class="basket_text basketButton" style="cursor:pointer;">
                        <div class="warenkorb_img add_item_from_subdir" id="qvitem_{$item.ID}">
                            <img class="" src="/images/webelemente/svg/icon_warenkorb-mini-weiss.svg" alt="{$langstrings.shop.in_basket}" title="{$langstrings.shop.in_basket}" />
                         
                            <div class="warenkorb_text">In den Warenkorb</div>
                        </div>
                    </div>    
                </div>
                <div class="item_addFavorites" id="{$item.ID}">
                    {include file="favoriten.tpl" mode="item"}
                </div>
                *}
                
                

            </div>
            
            {include file="lieferstatus.tpl"}

        </div>
    </div>
    <div class="qv_bottom">
        <a href="{$item.itemLink}">weiter zum Artikel <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
    </div>
</div>
