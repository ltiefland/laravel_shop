<!-- $Id: addonItems.tpl 2392 2022-10-06 14:16:38Z tiefland $ BEGIN -->
<div class="ausgabe_zubehoer">
    <b style="display:block;padding:1% 0;">{$langstrings.item.addonitems}:</b>
    <div class="item_table">
        {section loop=$addonitems name=a_ind}
            {include file="item_tablerow.tpl" item=$addonitems[a_ind]}
        {/section}
    </div>
</div>
<!-- $Id: addonItems.tpl 2392 2022-10-06 14:16:38Z tiefland $ BEGIN -->
