    {if $preis}
    <span id="rabatt" style="cursor:help;" style="position:absolute;left:200px;" onmouseover="return overlib('Rabattierung im Warenkorb');" onmouseout="nd();">
        <img src="/module/stempel.php?format={$format}&preis={$preis}" />
    </span>
    {/if}