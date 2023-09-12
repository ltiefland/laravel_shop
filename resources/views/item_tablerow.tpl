<!-- item_tablerow.tpl -->
{if $smarty.section.a_ind.index%2==0}
    {assign var="class" value="tr{$smarty.section.a_ind.index%2}"}
{/if}
<div class="item_tablerow {if $smarty.section.a_ind.last===true}last{/if} {$class}">
    <div class="item_tablerow_img"><a href="{$item.itemLink}"><img src="{$item.medien[0]->medium.bild_url_mini}" alt="{$item.hersteller_kurzbezeichnung}" title="{$item.hersteller_kurzbezeichnung}" /></a>
    </div>
    <div class="item_tablerow_text">
        <span><a href="{$item.itemLink}"><b>{$item.hersteller_kurzbezeichnung}</b></a></span>
        <span style="float:right;"><b>{$item.preis|money_format|replace:"EUR":"&euro;"}</b></span>
    </div>
    <div class="item_tablerow_menge">
        <div class="itemSmall_menge">
            <!--<input class="change_menge" id="minus_{$item.ID}" type="button" value="-" />-->
            <input class="mengeninput_{$item.ID} mengeninput" type="text" name="Menge_{$item.ID}" value="1" />
            <!--<input class="change_menge" type="button" value="+" id="plus_{$item.ID}"/>-->
            <p class="mengenlabel">MENGE</p>
        </div>
    </div>
    <div class="item_tablerow_order">
        <div class="warenkorb_button basketImg">
            <div class="warenkorb_img"><img style="cursor:pointer;" class="add_item_from_subdir" id="item_{$item.ID}" src="/images/webelemente/butt_icon_warenkorb.png" /></div>
        </div>
    </div>
</div>
<!-- /item_tablerow.tpl -->