<!-- $Id: add_to_basket_dialog.tpl 2392 2022-10-06 14:16:38Z tiefland $ BEGIN -->
<style>
    {if $hideWeiterButton==true}
        .ui-dialog-buttonset .ui-button:first-of-type {
            display:none;
        }
    {/if}
    
    .ui-widget-header{
        border: none!important;
    }
    
    /** bestelldialog **/
    .artikeldialog {
        float:left;
    }
    .art_dlg_img img {
        max-width:220px;
        height:auto;
    }
    .art_dlg_img {
        float:left;
        max-width:220px;
        width:220px;
        text-align:center;
        margin-right:20px;
    }
    .art_dlg_text {
        float:left;
    }
    .art_dlg_preis {
        float:right;
        width:100px;
        text-align:right;
    }
    
</style>
{if $artstamm}
    {assign var="item" value=$artstamm}
{/if}
<div style="display:none;" id="add_basket_msg" title="{$langstrings.item.added_to_basket_head}" class="addons">
    <div>
        {$langstrings.item.added_to_basket}
    </div>
    {if $item}
    <div class="artikeldialog">
        <div>
            <!-- Bild -->
            <div class="art_dlg_img">
                <img id="dialog_img" src="{$item.medien[0]->medium.bild_url_mini}" />
            </div>
            <!-- Bezeichnung -->
            <div class="art_dlg_text">
                <div id="dialog_kurzbezeichnung">
                    {$item.hersteller_kurzbezeichnung}
                </div>
                <div id="dialog_id">
                    Art.Nr.: {$item.ID}
                </div>
            </div>
            <!-- Preis -->
            <div class="art_dlg_preis">
                <b id="dialog_preis">{$item.preis|number_format|replace:" ":"&nbsp;"}&nbsp;&euro;</b>
            </div>
        </div>
        <div>
            <div colspan="3">
                <div id="menge_bestand_msg" style="display:none;">
                    {$langstrings.buy.menge_bestand_msg}
                </div>
            </div>
        </div>
    </div>
    {/if}
    
    {if is_array($item.zusatz)}
    <table class="zusatz">
        <tr>
            <td colspan="4">
                {$langstrings.item.zusatz_title}
            </td>
        </tr>
        {foreach $item.zusatz as $zusatz}
        <tr>
            <td>
                <img src="/images/webelemente/zusatz/{$zusatz.rufname}.gif" {if $zusatz.beschreibung} alt="{$zusatz.name}"{popup text=$zusatz.beschreibung width="400" caption=$zusatz.name}{else}title="{$zusatz.name}"{/if}>
            </td>
            <td>{$zusatz.name}</td>
            <td>+{$zusatz.preis|money_format}</td>
            <td>
                <input class="add_zusatz" type="button" id="zusatz_{$zusatz.id}_{$zusatz.master|default:0}" value="{$langstrings.shop.in_basket}">
            </td>
        </tr>
        {/foreach}
    </table>
    {/if}
</div>
<!-- $Id: add_to_basket_dialog.tpl 2392 2022-10-06 14:16:38Z tiefland $ END -->
