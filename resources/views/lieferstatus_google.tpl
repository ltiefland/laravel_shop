{if $item.LieferstatusValue==0}
    <meta itemprop="availability" content="https://schema.org/InStock" />
{elseif $item.LieferstatusValue==1}
    <meta itemprop="availability" content="https://schema.org/InStock" />
{elseif $item.LieferstatusValue==2}
    <meta itemprop="availability" content="https://schema.org/OutOfStock" />
{elseif $item.LieferstatusValue==3}
    <meta itemprop="availability" content="https://schema.org/OutOfStock" />
{elseif $item.LieferstatusValue==4}
    <meta itemprop="availability" content="https://schema.org/InStock" />
{/if}