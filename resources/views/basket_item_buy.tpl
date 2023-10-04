<!-- $Id: basket_item_buy.tpl 2883 2022-11-22 12:42:50Z erling $ BEGIN -->
<tr>
    <td style="text-align:center;">{$item->menge}</td>
    <td class="desktop" style="text-align:center;">
        <a href="/{$item->slug}.html">
        {if $item->media[0]->thumbnail}
            <img src="{$item->media[0]->thumbnail}"  alt=""/>
        {else}
            <img src="{$ini.itemKorrektur.noImage}"  alt=""/>
        {/if}
        </a>
    </td>
    <td>
        <a {$item->infolayer_eventHandler} href="/{$item->slug}.html">{$item->name_erweitert|default:$item->name}</a>

        {if $item->addinfo}
            <br /><em>{$item->addinfo}</em>
        {/if}

        <div class="infolayer" id="info_{$itemID}">{$item->infolayer}</div>
    </td>
    <td style="text-align:right;"
    {if $smarty.session.isMobile == true}
        colspan="2"
    {/if}
    >
            {$item->price|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
            {if isset($smarty.session.sonderPreis.preisDaten)}
                <br />
                {if isset($item->preisShop)}
                <del>{$item.preisShop|money_format|replace:"EUR":"&euro;"}</del>
                {/if}
            {/if}
    </td>
    <td style="text-align:right;">
        {($item->menge*$item->price)|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
    </td>
</tr>
<!-- $Id: basket_item_buy.tpl 2883 2022-11-22 12:42:50Z erling $ END -->
