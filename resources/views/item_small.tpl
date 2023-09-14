<div class="artikel_box" id="anker{$item->item_id}">
    <div class="item_special">
    {if $item->preis > 1 && $item->vk_preis && $item->nachlass_prozent>5}
        <div class="sie_sparen">-&nbsp;{$item->nachlass_prozent|round}%</div>
    {/if}
    {if $item->NEU}
        <div class="neu_icon">
            Neu
        </div>
    {/if}
    </div>

    {*
    <div class="schleife"><img src="/images/webelemente/schleife.png"></div>
    *}

    <div onclick="window.location.href = '/{$item->slug}.html';" class="top"
        {if $item->media[0]->url != $ini.itemKorrektur.noImage}
            style="
                cursor:pointer;
                background:url('{$item->media[0]->preview_url}') no-repeat top center;
                background-size:cover;

            "
        {/if}
    >
        <div class="bild">


        </div>
    </div>
    <div class="center">
        <a href="/{$item->slug}.html">
            <div class="itemname">
                <div class="itemnameInner">
                    {if $item->hersteller_kurzbezeichnung}
                        {$item->hersteller_kurzbezeichnung|truncate:60:"..."}
                    {else}
                        {$item->name}
                    {/if}
                </div>
            </div>
            <div class="description">
                <div class="descriptionInner">{$item->langbezeichnung|default:$item->description|strip_tags|replace:"http:":"https:"|truncate:160:"..."}</div>
            </div>
            <div class="preis">
                <div class="preisInner">

                    {$item->price[0]->preis|money_format|replace:"EUR":"&euro;"}

                    <span style="vertical-align:5px;font-size:12px;font-weight:400;line-height:20px;">{if $item->preis_einheit && $item->gewicht>0}/{$item->gewicht|number_format:2} {$item->preis_einheit}{/if}</span>

                    {if $ini.template.durchstreichpreise==1}
                    {assign var=UVP value="price[{($ini.uvpPreisIndex-1)}]->preis"}
                    <span class="item_preis" >
                        {if $item->$UVP>0 && $item->$UVP>$item->preis && $langstrings.shop.special_offer}
                            {$langstrings.shop.special_offer}
                        {/if}
                    </span>
                    {if $item->$UVP>0 && $item->$UVP>$item->preis}
                    <div class="infopic strike uvp">UVP: <span class="euro">&euro;</span>&nbsp;{$item->$UVP|money_format|replace:"USD":"$"|replace:"EUR":""}</div>
                    {/if}
                {/if}
                </div>
            </div>
        </a>
        <div class="preis_message">
            <div class="preis_messageInner">
                {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                {$langstrings.shop.price_msg}
                {else}
                {$langstrings.shop.price_msg_brutto}
                {/if}
                <a href="/versand_uebersicht.html">{$langstrings.shop.price_msg_link}</a>
                <br />{include file="lieferstatus.tpl" mode="item"}

                <br />
                {if $item->gebinde_menge > 0 && $item->gebinde_menge!=1 && $item->gebinde_einheit}
                (Grundpreis: {($item->preis_brutto/$item->gebinde_menge)|number_format:2} &euro; / {$item->gebinde_einheit})<br />
                {/if}
            </div>
        </div>
        {*
        <div class="preis_lieferstatus liefer_{$item->LieferstatusValue}">{include file="lieferstatus.tpl"}</div>
        *}
    </div>

</div>
