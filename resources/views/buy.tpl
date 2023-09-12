{extends file="page.tpl"}
{block name="content"}
<!-- $Id: buy.tpl 2549 2022-10-13 09:06:33Z tiefland $ BEGIN -->
<div class="bestellvorgang">
{if !$smarty.session.SHOP.BASKET->items && !$smarty.session.SHOP.paypalCheckout}
    {if $smarty.session.SHOP.buy.step==4}
        {block name="buyStep"}{/block}
    {else}
        {include file="basket_empty.tpl"}
    {/if}
{else}
    {block name="buyStep"}{/block}
{/if}
</div>
<!-- $Id: buy.tpl 2549 2022-10-13 09:06:33Z tiefland $ END -->
{/block}
