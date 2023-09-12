<!-- $Id: basket_item_table.tpl 2537 2022-10-13 06:09:05Z erling $ BEGIN -->
<table border="0" cellpadding="4" cellspacing="0" class="basket-table-items">
    <thead>
        <tr>
            <th style="width:71%;">Artikeldetails</th>
            <th style="text-align:center;width:16%;">Menge</th>
            <th style="text-align:right;width:11%;">{if isset($smarty.session.sonderPreis.preisDaten)}Sonderpreis<br />Shop Preis{else}Einzelpreis{/if}</th>
            <th style="text-align:right;width:11%;">Summe</th>
            <th style="text-align:center;">&nbsp;</th>
            <!--<th style="width:400px;">
                <div id="vollschutz" style="display:none;" >5 Jahre Geräteschutz mitbestellen?</div>
            </th>-->
        </tr>
    </thead>

    <tbody>
        {foreach $smarty.session.SHOP.BASKET->items as $id => $bItem}
            {include file="basket_item.tpl" item=$bItem id=$id}
        {/foreach}
        {if $ini.dhl.plzFinder==1}
        <tr>
            <td colspan="6">
                <strong>{$basketContent.kurier_text}</strong>
            </td>
        </tr>
        {/if}
        {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
        <tr>
            <td colspan="3" class="basket_preis" style="padding: 4px;">Warenwert Netto (zzgl. MwSt, zzgl. Versand):&nbsp;<br /></td>
            <td class="basket_summe">
                <span class="bigger bold" style="color:#EA5802;" >{$smarty.session.SHOP.SUMME|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
            <td></td>
        </tr>
            {foreach $smarty.session.SHOP.BASKET->paymentInfo.Tax as $mwst => $value}
        <tr>
            <td colspan="3" class="basket_preis" style="border-bottom: 1px dotted #808080;padding: 4px;">zzgl. MwSt. ({$smarty.session.SHOP.BASKET->paymentInfo.TaxRates.$mwst}%):&nbsp;<br /></td>
            <td class="basket_summe" style="border-bottom: 1px dotted #808080;padding: 4px;">
                <span class="bigger bold">{$value|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
            <td style="border-bottom: 1px dotted #808080;padding: 4px;"></td>
        </tr>
        {/foreach}
        <tr>
            <td colspan="3" class="basket_preis">Warenwert Brutto (inkl. MwSt, zzgl. Versand):&nbsp;<br /></td>
            <td class="basket_summe">
                <span class="bigger bold" style="color:#EA5802;" >{$smarty.session.SHOP.BASKET->paymentInfo.Total|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
            <td></td>
        </tr>
        {else}
            {foreach $smarty.session.SHOP.BASKET->paymentInfo.Tax as $mwst => $value}
        <tr>
            <td colspan="3" class="basket_preis" style="border-bottom: 1px dotted #808080;padding: 4px;">enthaltene MwSt. ({$smarty.session.SHOP.BASKET->paymentInfo.TaxRates.$mwst}%):&nbsp;<br /></td>
            <td class="basket_summe" style="border-bottom: 1px dotted #808080;padding: 4px;">
                <span class="bigger bold">{$value|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
        </tr>
        {/foreach}
        <tr>
            <td colspan="3" class="basket_preis">Warenwert brutto (inkl. MwSt, zzgl. Versand):&nbsp;<br /></td>
            <td class="basket_summe">
                <span class="item_preis">{$smarty.session.SHOP.BASKET->paymentInfo.Total|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"|replace:" ":"&nbsp;"}</span>
            </td>
        </tr>
        {/if}

    </tbody>
</table>

<div class="item_mobile">
    <table class="basket_tabelle">
    {foreach $smary.session.SHOP.BASKET->items as $id => $bItem}
        {include file="basket_item_mobile.tpl" item=$bItem id=$id}
    {/foreach}
        {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
        <tr>
            <td class="basket_preis" style="padding: 4px;">Warenwert Netto (zzgl. MwSt, zzgl. Versand):&nbsp;<br /></td>
            <td class="basket_summe">
                <span class="bold" style="color:#EA5802;" >{$smarty.session.SHOP.SUMME|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
            
        </tr>
        {foreach $smarty.session.SHOP.MWST as $mwst => $value}
        <tr>
            <td class="basket_preis" style="border-bottom: 1px dotted #808080;padding: 4px;">zzgl. MwSt. ({$mwst}%):&nbsp;<br /></td>
            <td class="basket_summe" style="border-bottom: 1px dotted #808080;padding: 4px;">
                <span class="bold">{$value|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
            
        </tr>
        {/foreach}
        <tr>
            <td class="basket_preis">Warenwert Brutto (inkl. MwSt, zzgl. Versand):&nbsp;<br /></td>
            <td class="basket_summe">
                {assign var="mwst" value=array_sum($smarty.session.SHOP.MWST)}
                {assign var="summe" value=($smarty.session.SHOP.SUMME+$mwst)}
                <span class="bold" style="color:#EA5802;" >{$summe|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
            
        </tr>
        {else}
        {foreach $smarty.session.SHOP.MWST as $mwst => $value}
        <tr>
            <td class="basket_preis" style="border-bottom: 1px dotted #808080;padding: 4px;">enthaltene MwSt. ({$mwst}%):&nbsp;<br /></td>
            <td class="basket_summe" style="border-bottom: 1px dotted #808080;padding: 4px;">
                <span class="bold">{$value|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
            
        </tr>
        {/foreach}
        <tr>
            <td class="basket_preis">Warenwert brutto (inkl. MwSt, zzgl. Versand):&nbsp;<br /></td>
            <td class="basket_summe">
                <span class="bold" style="color:#EA5802;" >{$smarty.session.SHOP.SUMME|money_format|replace:"EUR":"&euro;"|replace:" ":"&nbsp;"}</span>
            </td>
        </tr>
        {/if}
    </table>
</div>

<div id="loadbasket" title="" style="text-align:center;"> 
   <img src="/images/webelemente/loading.gif" /> 
</div>

<script>
    $(document).ready(function () {
              
      $("#loadbasket").dialog({
            autoOpen: false,
            draggable: true,
            show:"fade",
            hide:"fade",
      });
      
      
      
      $(".change_menge").click(function(){
        $("#loadbasket").dialog('open');
        updateMengenInput(this,'change'); 
      });
      $(".txtmengeninput").blur(function(){
        $("#loadbasket").dialog('open');
        updateMengenInput(this,'input'); 
      });
      
        function updateMengenInput(elem,type) {
            $(".ui-dialog-titlebar").hide();
            
            var data = elem.id;
            var arr = data.split('_');
            var item = arr[1];
            var menge = $(elem).val();
            var txtmenge = $('#txtmengeninput_' + item + '').val();

            if(menge == "-"){
              if(txtmenge == 1){
                   $("#loadbasket").dialog('close');
                  return false;
               }
            }
            if(type=="input") {
                menge = $(elem).val();
                var url = "/module/basketajax.php?basket=true&item=" + item + "&Menge=" + menge + "&buy=false&type=input";
            }
            if(type=="change") {
                var url = "/module/basketajax.php?basket=true&item=" + item + "&Menge=" + menge + "1&buy=false&type=change";
                if(menge=="+") {
                    menge = parseInt(parseInt(txtmenge) + 1);
                }else{
                    menge = parseInt(parseInt(txtmenge) - 1);
                }
            }
            
            $.ajax({
                type: "POST",
                url: url,        
                async: false,
                success: function (result) {
                   $(".basket_table_left").html(result);
                   
                     $.ajax({
                        type: "GET",
                        url: "/module/updateBasket.php",
                        async: false,
                        success: function (result) {
                            $(".warenkorb").html(result);
                            
                               setTimeout(function () {
                                  $("#loadbasket").dialog("close");
                               }, 500);
                            
                            return false;
                      }
                  })   
                  
                     setTimeout(function () {
                         $("#loadbasket").dialog("close");
                    }, 500);
                    
                   return false;
                   
                }
            });
            
            $('#txtmengeninput_' + item).val(menge);
            $('#versandoptionen').load("/update_versand.php?param=single&Land=" + $('#versand_laenderauswahl').val() );
            return false;
            
        }
    })
</script>
<!-- $Id: basket_item_table.tpl 2537 2022-10-13 06:09:05Z erling $ END -->
