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

<form id="basket_{$item.basketItemID}" action="{$buy_link_base}/basket.html" method="post" class="basketItemTabelle">
    <div class="item_single">
        <div class="itemBild">
            {if !$item.for}
            <a href="{$item.itemLink}">
            {if $item.medien[0]->medium.bild_url_mini}
                <img src="{$item.medien[0]->medium.bild_url_mini}" />
            {else}
                <img src="{$ini.itemKorrektur.noImage}" />
            {/if}
            </a>
            {else}
            <img src="/images/garantie/geraeteschutz.png" />
            {/if}
        </div>
        <div class="itemBeschreibung">
            <div class="infolayer" id="info_{$item.basketItemID}">{$item.infolayer}</div>
            {if !$item.for}
            <a style="" {$item.infolayer_eventHandler} class="basket_item" href="{$item.itemLink}">
            {/if}
            {$item.kurzbezeichnung_erweitert}
            {if !$item.for}
            </a>
            {/if}
            
            {if $item.addinfo}
                <br /><em>{$item.addinfo}</em>
            {/if}

            
            {if !$item.code}
                <div class="item_liefer">
                    {$item.LieferstatusText}
                </div>
            {/if}
            
            <div class="">
                <a class="loading_dlg item_delete" style="color:#911E18;" href="/?basket=true&action=delete&basketItemID={$item.basketItemID}">
                    <div><img width="16" height="16" src="/images/webelemente/warenkorb_papierkorb.gif" alt="Artikel aus Warenkorb l&ouml;schen" /></div> <div>l&ouml;schen</div>
                </a>
            </div>
        </div>
        
        {if $item.zusatz|is_array}
        <div class="itemZusatz">
            {foreach $item.zusatz as $z_ind => $zusatz}
                {assign var=found value=false}
                {assign var=z_found value=false}
                {foreach $item.zusatz_gebucht as $g_val}
                    {if $g_val.id==$zusatz.master}
                    {assign var=found value=true}
                    {/if}
                    {if $g_val.id==$zusatz.id}
                    {assign var=z_found value=true}
                    {/if}
                {/foreach}
                <div>
                    <div style="border-style:none!important;">{$zusatz.name}</div>
                    <div style="border-style:none!important;">
                            <input class="basket_add_zusatz" type="button" id="basket_{$id}_zusatz_{$zusatz.id}_{$zusatz.master|default:0}" value="+{$zusatz.preis|money_format}" {if ($zusatz.master>0 && !$found)||($z_found)}disabled="disabled"{/if}>
                    </div>
                </div>
            {/foreach}
        </div>
        {/if}
        
        
    </div>
        <div class="item_detail">
            <div class="itemMenge">
                <input type="hidden" style="width:30px" name="Menge" value="{$item.Menge}" />
                <input type="hidden" name="basket_action" value="valueChange" />
                <input type="hidden" name="basketItemID" value="{$item.basketItemID}" />
        
        
        	    <div class="itemSmall_menge">
                {if $item.preis >0}
                    <input type="hidden" name="basketItemID" value="{$item.basketItemID}" id="basketItemID_{$item.basketItemID}" class="basketItemID" />
                    {if $item.ID!=999 && ! $item.hat_versand_aufschlag}
                        <input class="change_menge" id="minus_{$item.ID}" style="margin:-4px -2px 0;" type="button" value="-" />
                        <input class="txtmengeninput mengeninput" id="txtmengeninput_{$item.ID}" style="width:30px;padding:2px 0;text-align:center" type="text" name="Menge" value="{$item.Menge|default:1}" />
                        <input class="change_menge" type="button" style="margin:-4px -2px 0;" value="+" id="plus_{$item.ID}"/>
                    {elseif $item.ID==999}
                        1
                        <input type="hidden" name="Menge" value="1" />
                    {elseif $item.hat_versand_aufschlag}
                        {$item.Menge|default:1}
                    {/if}
                {/if}
                </div>
    
    
                <div>
                    {if $item.Menge>1}
                        {$item.preis|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}
                    {/if}
                </div>
            
            </div> 
    
            <div class="itemSumme">
                {($item.preis * $item.Menge)|money_format|replace:"EUR":"&euro;"}
            </div>
            {if $item.garantie_verf && !$item.garantie_gebucht}
            <div  style="text-align:center;">
                <div id="garantie_link_{$id}">
                    {$item.praemie|money_format|replace:"EUR":"&euro;"}
                    <a style="color:#911E18;" href="#" class="garantie_basket" id="garantie_{$item.ID}_{$id}" onmouseover="return overlib('{$grafik|escape:"javascript"}', HAUTO, VAUTO);" onmouseout="return nd();">Ger&auml;teschutz buchen</a>
                    <script>
                        $("#vollschutz").show();
                    </script>
                    <br>
                    Erfahren Sie <a style="font-weight:bold" href="/?id=30">hier</a> alles &uuml;ber<br> 5 Jahre Ger&auml;teschutz
                </div>
            </div>
            {/if} 
        </div>
    
</form>   

<!-- $Id: basket_item_mobile.tpl 2585 2022-10-14 08:50:46Z erling $ END -->
