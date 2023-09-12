<!-- ANFANG .right -->
<div class="right">
    <div class=" hd_warenkorb">
    {include file="basket_info.tpl"}
    </div>
    
    
    {if $skr}
        {include file="sonderkasten.tpl" sk=$skr}
    {/if}
</div>
<!-- ENDE .right -->