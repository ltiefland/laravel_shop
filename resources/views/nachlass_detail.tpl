    {if $preis}
    <div style="margin-bottom:5px;" onmouseover="return overlib('&euro;{$preis} Rabattierung im Warenkorb');" onmouseout="nd();">
        <img src="/module/stempel.php?format={$format}&preis={$preis}" />
    </div>
    {/if}