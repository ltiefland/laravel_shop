{if $mode == "subdir.tpl" || ($mode != "basket" && $file != "item.tpl")}

    {if (isset($item->favorite) && $item->favorite) || (isset($isFavorite) && $isFavorite) || (is_array($smarty.session.favorite)&&in_array($item.ID,array_keys($smarty.session.favorite))==true)}
    <div class="basket_addFavorites favorite_active" id="{$item->id}">
        <div class="favorite_ButtonInner favoriteButton">
            <div class="button_inner">
                <img src="/images/webelemente/icon_merken_active.svg" alt="Artikel gemerkt" title="Artikel gemerkt" />
            </div>
        </div>
    </div>
    {else}
    <div class="basket_addFavorites favorite_inactive" id="{$item->id}">
        <div class="favorite_ButtonInner favoriteButton">
            <div class="button_inner">
                <img src="/images/webelemente/icon_merken_weiss.svg" alt="Artikel merken" title="Artikel merken" />
            </div>
        </div>
    </div>
    {/if}

{elseif $file == "item.tpl" || $mode == "basket"}
    {if (isset($item->favorite) && $item->favorite) || (isset($isFavorite) && $isFavorite) || (is_array($smarty.session.favorite)&&in_array($item.ID,array_keys($smarty.session.favorite))==true)}
    <div class="basket_addFavorites favorite_active" id="{$item->id}">
        <div class="favorite_ButtonInner favoriteButton">
            <div class="button_inner">
                <img src="/images/webelemente/icon_merken_active.svg" alt="Artikel gemerkt" title="Artikel gemerkt"/>
            </div>
        </div>
    </div>
    {else}
    <div class="basket_addFavorites favorite_inactive" id="{$item->id}">
        <div class="favorite_ButtonInner favoriteButton">
            <div class="button_inner">
                <img src="/images/webelemente/icon_merken_weiss.svg" alt="Artikel merken" title="Artikel merken" />
            </div>
        </div>
    </div>
    {/if}
{/if}

<script>
    $(document).ready(function() {
        $('.favorite_active').on("click",function() {
            $(this).addClass("favorite_inactive");
            $(this).removeClass("favorite_active");
        });
        $('.favorite_inactive').on("click",function() {
            $(this).addClass("favorite_active");
            $(this).removeClass("favorite_inactive");
        });
    });
</script>
