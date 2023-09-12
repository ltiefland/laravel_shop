<script type="text/javascript" src="/JavaScript/addresses.js"></script>
<form method="post" id="address_list" name="address_list" onsubmit="return false;">
    <div style="display:block;float:left;width:100%;">
        <div>
            <div class="new" id="new_addr" style="padding: 0% 0 2%;{if $smarty.get.type == "buy"}float:left;{/if}">
                <input type="button" class="new_addr_basket" value="{$langstrings.buy.new_address}" />
            </div>
            {if $smarty.get.type == "buy"}
            <div style="float:right;">
                <input type="button" id="continue_buy" value="{$langstrings.buy.zum_bestellvorgang}" />
            </div>
            {/if}
        </div>
        <div class="box_middle" style="float:left;width:100%;">
            {section loop=$addresses name=a_ind}
            
            <div class="{$class} boxInner">
                <div style="">
                    <div class="edit" id="edit_{$addresses[a_ind].id}" style="float:left;text-align:left;"> 
                        <a>{$langstrings.buy.edit_address}</a>
                    </div>
                    <div class="trash" id="del_{$addresses[a_ind].id}" style="float:right;text-align:right;">
                        <a>{$langstrings.buy.delete_address}</a>
                    </div>
                </div>
                <br />
                <br />
                <div class="adressdataInfo" style="min-height:160px;display:block;">
                    <div>
                        {if $addresses[a_ind].pro_title}
                            {$addresses[a_ind].pro_title}
                        {/if}
                        {$addresses[a_ind].vorname} {$addresses[a_ind].nachname}
                    </div> 
                    {if $addresses[a_ind].firma}
                    <div>{$addresses[a_ind].firma}</div>
                    {/if} 
                    {if $addresses[a_ind].strasse1}
                    <div>{$addresses[a_ind].strasse1} {$addresses[a_ind].str_nr1}</div>
                    {/if}
                    {if $addresses[a_ind].strasse2}
                    <div>{$addresses[a_ind].strasse2}</div>
                    {/if}
                    {if $addresses[a_ind].ort}
                    <div>{$addresses[a_ind].plz} {$addresses[a_ind].ort}</div>
                    {/if}
                    {if $addresses[a_ind].land}
                    <div>{$addresses[a_ind].land}</div>
                    {/if}
                    {if $addresses[a_ind].country==173}
                    <div>{$addresses[a_ind].state_name}</div>
                    {/if}
                    {if $addresses[a_ind].telefon}
                    <div>Telefon: {$addresses[a_ind].telefon}</div>
                    {/if}
                    {if $addresses[a_ind].fax}
                    <div>Fax: {$addresses[a_ind].fax}</div>
                    {/if}
                    {if $addresses[a_ind].email}
                    <div>E-mail: {$addresses[a_ind].email}</div>
                    {/if}
                    {if $addresses[a_ind].vat_id}
                    <div>Steuernummer: {$addresses[a_ind].vat_id}</div>
                    {/if}
                    {if $addresses[a_ind].comment}
                    <div>Kommentar: {$addresses[a_ind].comment|nl2br}</div>
                    {/if}
                </div>
                <div style="padding-top:10px;">                
                    <input class="addr_defaultBilling" type="radio" name="addr_defaultBilling[]" id="addr_defaultBilling_{$addresses[a_ind].id}" value="{$addresses[a_ind].id}" accept=""
                    {if $addresses[a_ind].id == $smarty.session.SHOP.buy.Persdata.defaultRechnungIdAdresse} checked="checked"{/if}> 
                    <label for="addr_defaultBilling_{$addresses[a_ind].id}">Standard Rechnungsadresse</label><br />
                    
                    <input class="addr_defaultShipping" type="radio" name="addr_defaultShipping[]" id="addr_defaultShipping_{$addresses[a_ind].id}" value="{$addresses[a_ind].id}"
                    {if $addresses[a_ind].id == $smarty.session.SHOP.buy.Persdata.defaultLieferIdAdresse} checked="checked"{/if}> 
                    <label for="addr_defaultShipping_{$addresses[a_ind].id}">Standard Lieferadresse</label>
                </div>
            </div>
            {/section}
        </div>
        <div class="box_bottom">&nbsp;</div>
    </div>
    <input type="hidden" name="mode" value="edit" id="mode">
    <input type="hidden" name="id" value="" id="addr_id">
</form>
<div id="del_address_dialog" title="{$langstrings.buy.delete_address}"></div>
