<!-- $Id: basket_item_mobile.tpl 2585 2022-10-14 08:50:46Z erling $ BEGIN -->
<style>
    .basketItemTabelle,
    .itemBild,
    .itemBeschreibung,
    .itemZusatz,
    .itemMenge,
    .itemPreis{
        color: #3A3B3D;
        font-weight:normal;
    }
    .itemSumme{
        padding: 10px 0px;
        text-align:right;
        font-weight: bold;
    }
    .basketItemTabelle{
        width:100%;
        border-bottom: 1px dotted #3A3B3D;
        padding-top:10px;
    }
    
</style>
<script>
    $(document).ready(function() {
        $('.change_menge').button();
    });
</script>

<form id="basket_{$item->basketItemID}" action="{$buy_link_base}/basket.html" method="post" class="basketItemTabelle">
    <div class="item_single">
        <div class="itemBild">
            <a href="/{$item->slug}.html">
            {if $item->media[0]->thumbnail}
                <img src="{$item->media[0]->thumbnail}" />
            {else}
                <img src="{$ini.itemKorrektur.noImage}" />
            {/if}
            </a>
        </div>
        <div class="itemBeschreibung">
            <div class="infolayer" id="info_{$item->basketItemID}">{$item->infolayer}</div>
            <a style="" {$item->infolayer_eventHandler} class="basket_item" href="/{$item->slug}.html">
            {$item->name}
            </a>
            
            {if $item->addinfo}
                <br /><em>{$item->addinfo}</em>
            {/if}

            
            {if !$item->code}
                <div class="item_liefer">
                    {$item->LieferstatusText}
                </div>
            {/if}
            
            <div class="">
                <a class="loading_dlg item_delete" style="color:#911E18;" href="/?basket=true&action=delete&basketItemID={$item->basketItemID}">
                    <div><img width="16" height="16" src="/images/webelemente/warenkorb_papierkorb.gif" alt="Artikel aus Warenkorb l&ouml;schen" /></div> <div>l&ouml;schen</div>
                </a>
            </div>
        </div>
        
        {if $item->zusatz|is_array}
        <div class="itemZusatz">
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
                <div>
                    <div style="border-style:none!important;">{$zusatz->name}</div>
                    <div style="border-style:none!important;">
                            <input class="basket_add_zusatz" type="button" id="basket_{$id}_zusatz_{$zusatz->id}_{$zusatz->master|default:0}" value="+{$zusatz->preis|money_format}" {if ($zusatz->master>0 && !$found)||($z_found)}disabled="disabled"{/if}>
                    </div>
                </div>
            {/foreach}
        </div>
        {/if}
        
        
    </div>
        <div class="item_detail">
            <div class="itemMenge">
                <input type="hidden" style="width:30px" name="Menge" value="{$item->menge}" />
                <input type="hidden" name="basket_action" value="valueChange" />
                <input type="hidden" name="basketItemID" value="{$item->basketItemID}" />
        
        
        	    <div class="itemSmall_menge">
                {if $item->price >0}
                    <input type="hidden" name="basketItemID" value="{$item->basketItemID}" id="basketItemID_{$item->basketItemID}" class="basketItemID" />
                    {if $item->id!=999 && ! $item->hat_versand_aufschlag}
                        <input class="change_menge" id="minus_{$item->id}" style="margin:-4px -2px 0;" type="button" value="-" />
                        <input class="txtmengeninput mengeninput" id="txtmengeninput_{$item->id}" style="width:30px;padding:2px 0;text-align:center" type="text" name="Menge" value="{$item->menge|default:1}" />
                        <input class="change_menge" type="button" style="margin:-4px -2px 0;" value="+" id="plus_{$item->id}"/>
                    {elseif $item->id==999}
                        1
                        <input type="hidden" name="Menge" value="1" />
                    {elseif $item->hat_versand_aufschlag}
                        {$item->menge|default:1}
                    {/if}
                {/if}
                </div>
    
    
                <div>
                    {if $item->menge>1}
                        {$item->price|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                    {/if}
                </div>
            
            </div> 
    
            <div class="itemSumme">
                {($item->price * $item->menge)|money_format|replace:"EUR":"&euro;"}
            </div>
        </div>
    
</form>   

<!-- $Id: basket_item_mobile.tpl 2585 2022-10-14 08:50:46Z erling $ END -->
