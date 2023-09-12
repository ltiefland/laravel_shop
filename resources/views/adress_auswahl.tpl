<style>
    .billingAddress:hover{
        cursor:pointer;
        background-color: #fffff!important;
    }
    .shippingAddress:hover{
        cursor:pointer;
        background-color: #fffff!important;
    }
</style>
<script>
    $(document).ready(function(){
        {if $bill}
        var change = ".changeBillingAddress";
        var changeDialog = ".changeBillingAddressDialog";
        {else}
        var change = ".changeShippingAddress";
        var changeDialog = ".changeShippingAddressDialog";
        {/if}
        
        $(changeDialog).dialog({
            autoOpen: false,
            height: "auto",
            width: "auto",
            modal: true,
            title: "Adresse wechseln",
            buttons: {
                "Beenden": function() {
                    $(changeDialog).dialog( "close" );
                }
            },
            close: function() {
                $(changeDialog).dialog( "close" );
            }        
        });
        
        $(change).click(function(){
            $(changeDialog).dialog("open");    
        }).button();
        {if $bill}        
        $( "div" ).delegate( ".billingAddress", "click", function() {
            id = $(this).attr("id"); 
            idsplit = id.split("_");
            addr_id = idsplit[0];
            $(changeDialog).dialog( "close" ).dialog( "destroy" );
            window.location.href = "index.php?buy=true&changeAddress="+addr_id+"&action=changeBillingAddress";    
 
        });
        {else}
        $( "div" ).delegate( ".shippingAddress", "click", function() {
            id = $(this).attr("id"); 
            idsplit = id.split("_");
            addr_id = idsplit[0]; 
            land_id = idsplit[1];
            
            $(changeDialog).dialog( "close" ).dialog( "destroy" );
            window.location.href = "index.php?buy=true&changeAddress="+addr_id+"&action=changeShippingAddress";    
            
        });
        {/if}
        
    });
</script>  
  
{if $bill}
    {if $ini.modules.adresssystem == "alt" && !isset($smarty.session.SHOP.buy.Login.defaultRechnungIdAdresse) && !isset($smarty.session.SHOP.buy.Login.defaultLieferIdAdresse)}
        {assign var="adressID" value=0}
    {else}
        {if isset($smarty.get.changeAddress) && ( isset($smarty.get.action) && $smarty.get.action == "changeBillingAddress" )}
        {assign var="adressID" value=$smarty.session.bill_addr_id}
        {else}
        {assign var="adressID" value=$smarty.session.SHOP.buy.Login.defaultRechnungIdAdresse}    
        {/if}
    {/if}
{else}
    {if $ini.modules.adresssystem == "alt" && !isset($smarty.session.SHOP.buy.Login.defaultRechnungIdAdresse) && !isset($smarty.session.SHOP.buy.Login.defaultLieferIdAdresse)}
        {assign var="adressID" value=1}
    {else}
        {if isset($smarty.get.changeAddress) && ( isset($smarty.get.action) && $smarty.get.action == "changeShippingAddress" )}
        {assign var="adressID" value=$smarty.session.ship_addr_id}
        {else}
        {assign var="adressID" value=$smarty.session.SHOP.buy.Login.defaultLieferIdAdresse}
        {/if}   
    {/if}
{/if}
<table>
    <tr>
        {if $bill}
        <td><h1 style="padding:0!important;">{$langstrings.buy.billing_address}</h1></td>
        {else}
        <td><h1 style="padding:0!important;">{$langstrings.buy.delivery_address}</h1></td>
        {/if}
    </tr>
    <tr>
        <td>
        {foreach $addresses["{$adressID}"] as $bezeichnung => $data}
            {if $bezeichnung == "Name" || $bezeichnung == "strasse" || $bezeichnung == "stadt" || $bezeichnung == "land_name" || $bezeichnung == "email"}
                {$data} 
                <br />
            {/if}
        {/foreach}
        </td>  
    </tr>
    <tr>
        {if $bill}
        <td><input type="hidden" name="bill_addr_id" value={if $adressID}{$adressID}{else}{$billid}{/if} /></td>
        {else}
        <td><input type="hidden" name="ship_addr_id" value={if $adressID}{$adressID}{else}{$billid}{/if} /></td>
        {/if}
    </tr>
    <tr>
        {if $bill}
        <td class="changeBillingAddress"><a>{$langstrings.buy.change_address_billing}</a></td>
        {else}
        <td class="changeShippingAddress"><a>{$langstrings.buy.change_address_shipping}</a></td>
        {/if}
    </tr>
</table>

{if $bill}
<div class="changeBillingAddressDialog{if $ini.modules.adresssystem == "alt" && !isset($smarty.session.SHOP.buy.Persdata.defaultRechnungIdAdresse ) && !isset( $smarty.session.SHOP.buy.Persdata.defaultLieferIdAdresse)}Alt{/if}" style="background-color: #f8f8f8f;">
    {include file="adress.tpl" ship=false}
</div>
{else}
<div class="changeShippingAddressDialog{if $ini.modules.adresssystem == "alt" && !isset( $smarty.session.SHOP.buy.Persdata.defaultRechnungIdAdresse ) && !isset( $smarty.session.SHOP.buy.Persdata.defaultLieferIdAdresse )}Alt{/if}" style="background-color: #f8f8f8f;">
    {include file="adress.tpl" ship=true}
</div>
{/if}
