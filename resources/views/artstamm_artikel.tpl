<!-- $Id: artstamm_artikel.tpl 2969 2022-11-29 14:29:26Z tiefland $ BEGIN -->
<style>
 #artikel .itemTable_container .itemTable_rownew td {
     padding-bottom: 10px;
     padding-top: 10px;
     border-bottom:1px solid #3A3B3D;
}

#artikel .itemTable_container .itemTable_rownew{
    border-bottom: 1px solid #3A3B3D;
    width: 100%;
}
#artikel .itemTable_container .itemTable_rownew:hover{
    background-color: #ccc;
}

.bildnew{
    width: 5%;
    float: left;
}

.tdbild{
    width: 5%;
    float: left;
}
.imgcls{
/*  width:50px;*/
}
.preisnew{
    padding: 0 6px 0 0;
    text-align: right;
}
</style>
<table width="100%" class="itemTable_container" border="0" cellspacing="0">
    <thead>
    <th style="text-align: left;">&nbsp;</th>
        <th style="text-align: left;">Name</th>
        {* Eigenschaften *}
        {$ie = 0}
        {foreach $dropdown_opts as $index => $data}
        {if $data["options"]|@count > 1}
        {$ie = $ie + 1}
        <th style="text-align: left;">{$data['label']}</th>
        {/if}   
        {/foreach}
        {* /Eigenschaften *}
        <th class="lieferstatus">Lieferstatus</th>
        <th class="preisnew">Preis</th>
        <th></th>
    </thead>
    
    <tbody>
    {foreach $subdir.items as $index => $itemData}
    <tr class="itemTable_rownew">        
        <td>
            <a href="{$itemData.itemLink}">               
                <img class="imgcls" src="/images/upload/{$itemData.medium[0]->medium->folder}/mini/{$itemData.medium[0]->medium->name}"/>
            </a>
        </td>
        <td class="bezeichnungnew">
           <a href="/{$itemData->slug}.html">{$itemData->name}</a>
           {if $itemData.langbezeichnung}
            <br />{$itemData.langbezeichnung}
           {/if}
        </td>

        {if $ie == 0}
        {else}
            {$i = 0}
            {foreach $dropdown_opts as $f}
                {$i = $i + 1}
                 <td style="width:10%">{$itemData.eigenschaften_modell[$f.nr].wert|default:"-&nbsp;"}</td>
                {if ($i == $ie)}
                    {break}
                 {/if}   
            {/foreach}  
        {/if}
        <td class="lieferstatus">
            {include file="lieferstatus.tpl" item=$itemData}
        </td>
        <td class="preisnew">{$itemData->price[0]->preis|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</td>
        <td>
            <div class="basketImg">
            <img src="/images/webelemente/butt_icon_warenkorb.png" class="add_item_from_subdir" id="artstammartikel_{$itemData->id}" style="cursor:pointer;"/>
            </div>
        </td>
    </tr>
    <tr class="itemTable_break">
        <td colspan="100%"></td>
    </tr>
    {/foreach}
    </tbody>  
</table>



<div style="float:none;clear:both;padding-top:2px;">Alle Preise verstehen sich inkl. MwSt., zzgl. <a href="/versand_uebersicht.html">Versandkosten</a></div>
<!-- $Id: artstamm_artikel.tpl 2969 2022-11-29 14:29:26Z tiefland $ END -->