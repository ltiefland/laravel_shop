<div class="breadcrumb noprint">
    <span class="breadcrumb_first_span">
        <li class="breadcrumb_li">
            <a class="breadcrumb_item" href="/">
            <span>{$langstrings.shop.home}</span></a>
        </li>
        {assign var="indexloopsection" value=2}
        {foreach $shopPosition as $pos}
            <span class='breadcrumb-trenner'>&nbsp;>&nbsp;</span>
            <li class="breadcrumb_li">
            <a class="breadcrumb_item" title="{$pos->name}" itemid="{$pos->id}-{$pos->slug}"
               href="/directory/{$pos->id}-{$pos->slug}">
            <span {if $pos@last}class="breadcrumbActive"{/if}>{$pos->name}</span></a>
            </li>
            {assign var="indexloopsection" value=$indexloopsection+1}
        {/foreach}
    </span>
</div>
