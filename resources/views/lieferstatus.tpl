<span class="liefer_{$item.LieferstatusValue}">
{if $item.liefertermin > $smarty.now|date_format:"Y-m-d"}
    <link itemprop="availability" href="https://schema.org/InStock" />
        {$langstrings.item.delivery_date|sprintf:($item.liefertermin|date_format:'d.m.Y')}
{elseif $item.LieferstatusValue==0}
    <link itemprop="availability" href="https://schema.org/InStock" />
        {$item.LieferstatusText|trim}

{elseif $item.LieferstatusValue==1}
    <link itemprop="availability" href="https://schema.org/InStock" />
        {$item.LieferstatusText|trim}
{elseif $item.LieferstatusValue==2}
    <link itemprop="availability" href="https://schema.org/OutOfStock" />
        {$item.LieferstatusText|trim}
{elseif $item.LieferstatusValue==3}
    <link itemprop="availability" href="https://schema.org/OutOfStock" />
        {$item.LieferstatusText|trim}
{elseif $item.LieferstatusValue==4}
    <link itemprop="availability" href="https://schema.org/OutOfStock" />
        {$item.LieferstatusText|trim}
{/if}
</span>
