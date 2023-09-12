{if count($artstamm.itemTable) == 1}
    <div class="itemPreis">
        <span style="display:none">
            <span>{$artstamm.itemTable[0].preis|money_format|replace:"EUR":"&euro;"}</span>
        </span>
        {$artstamm.itemTable[0].preis|money_format|replace:"EUR":"&euro;"}
    </div>
    <div class="basketMenge">
        <div class="mengen_input">
            <label style="padding-top:2px;">Anzahl angeben:</label> 
            <input class="mengeninput" type="text" name="Menge" value="1" />
        </div>
    </div>
    <div class="basketButton add_item_from_subdir" id="artstammartikel_{$artstamm.itemTable[0].ID}" style="cursor:pointer;">
        in den Warenkorb
    </div>
                        
    {if $smarty.session.SHOP.Login}
    <div class="basket_addFavorites" id="{$artstamm.itemTable[0].ID}">
        {include file="favoriten.tpl"}
    </div>
    {/if}
    <script>
        $(document).ready(function(){
            $("div.basketReload").on("click", ".add_item_from_subdir", add_item_from_subdir);    
        });
        
    </script>
{/if}