{if !$smarty.get.basket && $file != "buy.tpl"}
    {if $smarty.get.item && is_array($items) && $items|count>2}
        <section class="section_itemSlider">
            {include file="itemSlider.tpl" items=$items angebot=0 itemSliderHeadline="Das könnte Sie auch interessieren" suffix="kba"}
        </section>
    {/if}

    {if $lastvisited|is_array && $lastvisited|count>2 && $pagetype!="Startseite" && $pagetype!="Unterseite"}
        <section class="section_itemSlider">         
            {include file="itemSlider.tpl" items=$lastvisited angebot=0 itemSliderHeadline="Zuletzt angesehen" suffix="lastvisited"}
        </section>
    {/if}
{/if}