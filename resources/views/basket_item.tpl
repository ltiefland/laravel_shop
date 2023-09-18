<!-- $Id: basket_item.tpl 2867 2022-11-21 09:12:12Z erling $ BEGIN -->
<form id="basket_{$id}" action="{$buy_link_base}/basket.html" method="post">
<tr class="basket_row">
    <td style="display:table;text-align:left;width: 99%;">
        <table>
            <tr>
                <td style="text-align:center;border-style:none!important;width:100px;">
                    {if !$item->for}
                    <a href="/{$item->slug}.html">
                    {if $item->media[0]->thumbnail}
                        <img src="{$item->media[0]->thumbnail}" />
                    {else}
                        <img src="{$ini.itemKorrektur.noImage}" />
                    {/if}
                    </a>
                    {else}
                    <img src="/images/garantie/geraeteschutz.png" />
                    {/if}
                </td>
                <td style="border-style:none!important;text-align:left;padding:0 0 0 20px;">
                    <div class="infolayer" id="info_{$id}">{$item->infolayer}</div>
                    {if !($item->for||$item->id==999)}
                    <a style="" {$item->infolayer_eventHandler} class="basket_item" href="/{$item->slug}.html">
                    {/if}
                    {$item->name}
                    {if !($item->for||$item->id==999)}
                    </a>
                    {/if}

                    {if $item->addinfo}
                        <br /><em>{$item->addinfo}</em>
                    {/if}
                    {if !$item->code}
                    <br />
                    {$item->LieferstatusText}
                    {/if}

                    {include file="item_kurier.tpl"}
                    <br />

                    {if !($item->for||$item->id==999)}
                    <a class="loading_dlg" style="color:#911E18;" href="/delItem/{$id}">
                        <img width="16" height="16" src="/images/webelemente/warenkorb_papierkorb.gif" alt="Artikel aus Warenkorb löschen" align="absmiddle" /> l&ouml;schen
                    </a>
                    {/if}
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border-style:none!important;">
                    <table>
            {foreach $item->zusatz as $z_ind => $zusatz}
                {assign var=found value=false}
                {assign var=z_found value=false}
                {foreach $item->zusatz_gebucht as $g_val}
                {if $g_val.id==$zusatz.master}
                {assign var=found value=true}
                {/if}
                {if $g_val.id==$zusatz.id}
                {assign var=z_found value=true}
                {/if}
                {/foreach}
                <tr>
                    <td style="border-style:none!important;">
                        {$zusatz.name}
                    </td>
                    <td style="border-style:none!important;">
                        <input class="basket_add_zusatz" type="button" id="basket_{$id}_zusatz_{$zusatz.id}_{$zusatz.master|default:0}" value="+{$zusatz.preis|money_format|replace:" ":"&nbsp;"}" {if ($zusatz.master>0 && !$found)||($z_found)}disabled="disabled"{/if}>
                    </td>
                </tr>
            {/foreach}
                    </table>
                </td>
            </tr>
        </table>
    </td>

    <td style="padding:4px 0 4px 0;text-align:center;">

    	<input type="hidden" style="width:30px" name="Menge" value="{$item->menge}" />
        <input type="hidden" name="basket_action" value="valueChange" />
        <input type="hidden" name="basketItemID" value="{$id}" />

	    <div class="itemSmall_menge">
                {if $item->price >0}
                    <input type="hidden" name="basketItemID" value="{$id}" id="basketItemID_{$id}" class="basketItemID" />
                    {if $item->id!=999 && ! $item->hat_versand_aufschlag}
                        <input class="change_menge" id="minus_{$item->id}" style="margin:-4px -2px 0;" type="button" value="-" />
                        <input class="txtmengeninput mengeninput_{$item->id}" id="txtmengeninput_{$item->id}" style="width:30px;padding:2px 0;text-align:center" type="text" name="Menge" value="{$item->menge|default:1}" />
                        <input class="change_menge" type="button" style="margin:-4px -2px 0;" value="+" id="plus_{$item->id}"/>
                    {elseif $item->id==999}
                        1
                        <input type="hidden" name="Menge" value="1" />
                    {elseif $item->hat_versand_aufschlag}
                        {$item->menge|default:1}
                    {/if}
                {/if}
        </div>



    </td>
    <td class="basket_preis">
        {$item->price|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
        {if isset($smarty.session.sonderPreis.preisDaten)}
            <br />
            {if isset($item->preisShop)}
            <del>{$item->preisShop|money_format|replace:"EUR":"&euro;"}</del>
            {/if}
        {/if}

    </td>
    <td class="basket_item_summe">
        {($item->price * $item->menge)|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
    </td>
    {if $smarty.session.SHOP.Login}
    <td class="subdir_addFavorites" id="{$item.ID}">
        {include file="favoriten.tpl" mode="subdir"}
    </td>
    {/if}
    {if $item->garantie_verf && !$item->garantie_gebucht}
    <td  style="text-align:center;">

        <div id="garantie_link_{$id}">
            {$item->praemie|money_format|replace:"EUR":"&euro;"}
            <a style="color:#911E18;" href="#" class="garantie_basket" id="garantie_{$item->ID}_{$id}" onmouseover="return overlib('{$grafik|escape:"javascript"}', HAUTO, VAUTO);" onmouseout="return nd();">Ger&auml;teschutz buchen</a>
            <script>
                $("#vollschutz").show();
            </script>
            <br>
            Erfahren Sie <a style="font-weight:bold" href="/?id=30">hier</a> alles &uuml;ber<br> 5 Jahre Ger&auml;teschutz
        </div>
    </td>
    {/if}
</tr>
</form>

<style>
    .basket_item {
        font-family: work_sanssemibold;
        font-size: 1rem;
    }
</style>
<!-- $Id: basket_item.tpl 2867 2022-11-21 09:12:12Z erling $ END -->
