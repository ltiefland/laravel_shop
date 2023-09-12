{if $ini.itemKorrektur.lagerbestandAnzeigen==1}
    {if $item.bestand}
    <div style="padding:12px 0 0 0;">
        <input type="hidden" id="bestand" name="bestand" value="{$item.bestand}" />
        Auf Lager:
        {if $item.bestand>=$ini.itemKorrektur.maxLagerbestand}
            > {$ini.itemKorrektur.maxLagerbestand} Stk.
        {else}
            {$item.bestand} Stk.
        {/if}
        {if $item.bestandsdatum}
            <br />Stand: {$item.bestandsdatum} Uhr
        {/if}
    </div>
    {/if}
{/if}
