{if is_array($favoriten) && count($favoriten) > 0}
<script type="text/javascript" src="/JavaScript/add_item_to_basket.js"></script>
<div style="float:left;padding:2%;width:96%;">{$langstrings.login.favorites_info}</div>
<div id="artikel">
    {foreach $favoriten as $index => $item}
    <div class="favoriten_liste">
        <div>
            <a href="{$item.itemLink}{$item.kitLink}">
                <div class="infopic">
                    <img src="{$item.medien[0]->medium.bild_url_mini}" style="cursor:pointer" alt="Info">
                </div>
            </a>
        </div>
        <div>
            {if !$item.for}
            <a class="basket_item" href="{$item.itemLink}">
            {/if}
            {$item.kurzbezeichnung_erweitert}
            {if !$item.for}
            </a>
            {/if}
            <br />
        </div>
        <div>
            {$item.basketItemSumme|default:$item.preis|money_format|replace:"EUR":"&euro;"|replace:"USD":"$"|replace:" ":"&nbsp;"}
        </div>
        {*
        <div class="subdir_basket" style="vertical-align:middle;text-align:center;">
            <input class="mengeninput mengeninput_{$item.ID}" type="text" name="Menge" value="1"/>
            <div class="add_item_from_subdir" id="item_{$item.ID}" style="cursor:pointer"></div>
        </div>
        *}
        <div>
            {include file="favoriten.tpl" mode="subdir"}
        </div>        
    </div>
    {/foreach} 
</div>
{else}
<div>{$langstrings.login.no_favorites}</div>
{/if}


    {if $smarty.session.SHOP.Login===NULL}
        <div style="padding-top:40px;"><p class="small">{$langstrings.shop.hinweis_merkliste_login}</p></div>
    {/if}      


<style>
    .button_inner {
        min-width:40px;
    }
    .button_inner img {
       padding:5px!important; 
    }

    .favoriten_liste {
        clear:both;
        display: flex!important;
        justify-content: left;
        align-items: center;
        gap: 20px;        
    }

</style>
