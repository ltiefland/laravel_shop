{if $ini.modules.adresssystem == "alt" && !isset( $smarty.session.SHOP.buy.Persdata.defaultRechnungIdAdresse ) && !isset( $smarty.session.SHOP.buy.Persdata.defaultLieferIdAdresse )}
    {if $ship}
        {foreach $addresses as $addressID => $addressData}
        {if $addressID == 1}
        <div style="float:left;padding:5px;margin:0px 5px 0px 5px;background-color:#f8f8f8!important;" id="{$addressID}_{$addressData["CountryID"]}" class="shippingAddress">
            {foreach $addressData as $bezeichnung => $data}
            {if $bezeichnung == "Name" || $bezeichnung == "strasse" || $bezeichnung == "stadt" || $bezeichnung == "land_name" || $bezeichnung == "email" || $bezeichnung=="firma"}
            <div>{$data}</div>  
            {/if}
            {/foreach}
        </div>
        {/if}
        {/foreach}
        <input type="button" value="{$langstrings.buy.change_address_shipping}" class="edit_addr_basket" />
    {else}
        {foreach $addresses as $addressID => $addressData}
        {if $addressID == 0}
        <div style="float:left;padding:5px;margin:0px 5px 0px 5px;background-color:#f8f8f8!important;" id="{$addressID}" class="billingAddress">
            {foreach $addressData as $bezeichnung => $data }
            {if $bezeichnung == "Name" || $bezeichnung == "strasse" || $bezeichnung == "stadt" || $bezeichnung == "land_name" || $bezeichnung == "email" || $bezeichnung=="firma"}
            <div>{$data}</div>
            {/if} 
            {/foreach}
        </div>
        {/if}
        {/foreach}
        <input type="button" value="{$langstrings.buy.change_address_billing}" class="edit_addr_basket" />
    {/if}
{else}

    {if $ship}
        {foreach $addresses as $addressID => $addressData}
        <div style="float:left;padding:5px;margin:0px 5px 0px 5px;background-color:#f8f8f8!important;" id="{$addressID}_{$addressData["CountryID"]}" class="shippingAddress">
            {foreach $addressData as $bezeichnung => $data}
            {if $bezeichnung == "Name" || $bezeichnung == "strasse" || $bezeichnung == "stadt" || $bezeichnung == "land_name" || $bezeichnung == "email" || $bezeichnung=="firma"}
            <div>{$data}</div>  
            {/if}
            {/foreach}
            <br />
            klicken, um diese Adresse zu verwenden
        </div>
        {/foreach}
        <input type="button" value="{$langstrings.buy.new_address}" class="new_addr_basket" />
    {else}
        {foreach $addresses as $addressID => $addressData}
        <div style="float:left;padding:5px;margin:0px 5px 0px 5px;background-color:#f8f8f8!important;" id="{$addressID}" class="billingAddress">
            {foreach $addressData as $bezeichnung => $data }
            {if $bezeichnung == "Name" || $bezeichnung == "strasse" || $bezeichnung == "stadt" || $bezeichnung == "land_name" || $bezeichnung == "email" || $bezeichnung=="firma"}
            <div>{$data}</div>
            {/if} 
            {/foreach}
            <br />
            klicken, um diese Adresse zu verwenden
        </div>
        {/foreach}
        <input type="button" value="{$langstrings.buy.new_address}" class="edit_addr_basket" />
    {/if}

{/if}
