<script type="text/javascript" language="javascript" src="/includes/auto_plz/autoplz.js"></script>
<style>
    table td {
        padding:2px;
        vertical-align:top;
    }
    .addr_table {
        margin:0 auto;
        width:66%;
    }
    .addr_table td {
        width:76%;
    }
    .addr_table td:first-of-type {
        width:16%;
        text-align:right;
    }
    .addr_table .persdata {
        width:84%;
    }
    .addr_table textarea {
        width:86%;
    }
    .error {
        padding:2% 0;
        text-align:left!important;
    }
    .addr_table select {
        padding:1%!important;
    }
    @media screen and (min-width:768px) {
        #street1 {
            width:74.6%!important;
        }
    }
</style>
<form method="post" class="edit_address" onsubmit="return false;">
    <div class="box_2">
        <div class="box_head">
            {if !$incl}
            <h1>{if $address.id}{$langstrings.buy.edit_address}{else}{$langstrings.buy.new_address}{/if}</h1>
            {/if}
        </div>
        <div class="box_middle">
            <table class="addr_table">
                <tr>
                    <td colspan="2" class="error" id="validateTips">{$meld}</td>
                </tr>
                
                <tr>
                    <td>
                        {$langstrings.buy.title}:
                    </td>
                    <td>                        
                        {html_options options=$anreden id="Anrede" name="anrede" selected=$address.anrede}
                    </td>
                </tr>
                
                {if count($prof_titles) > 0}
                <tr>
                    <td>{$langstrings.buy.prof_title}</td>
                    <td>
                        {html_options options=$prof_titles id="ProfTitle" name="pro_title" selected=$address.pro_title}
                    </td>
                </tr>
                {/if}
                <tr>
                    <td>
                        {$langstrings.buy.firstname}: *
                    </td>
                    <td>
                        <input type="hidden" name="req[vorname]" value="firstname">
                        <input type="text" name="vorname" id="vorname" class="persdata" value="{$address.vorname}" >
                    </td>
                </tr>
                <tr>
                    <td>
                        {$langstrings.buy.name}: *
                    </td>
                    <td>
                        <input name="nachname" id="nachname" type="text" class="persdata"  value="{$address.nachname}" >
                        <input type="hidden" name="req[nachname]" value="name">
                    </td>
                </tr>
                <tr>
                    <td>
                        {$langstrings.buy.company}: 
                    </td>
                    <td>
                        <input type="text" name="firma" id="firma" class="persdata" value="{$address.firma}" >
                    </td>
                </tr>
                <tr>
                    <td>
                        {$langstrings.buy.street}/{$langstrings.buy.no}.: * 
                    </td>
                    <td>
                        <input type="text" name="strasse1" id="street1" class="persdata"  value="{$address.strasse1}" >
                        <input type="hidden" name="req[strasse1]" value="street">
                        <input type="text" name="str_nr1" id="str_nr1" class="persdata" style="width:30px" value="{$address.str_nr1}" >
                        <input type="hidden" name="req[str_nr1]" value="street">
                    </td>
                </tr>
                <!--<tr>
                    <td>{$langstrings.buy.street2}</td>
                    <td>
                        <input type="text" name="strasse2" class="persdata"  value="{$address.strasse2}" >
                    </td>
                </tr>-->
                <tr>
                    <td>
                        {$langstrings.buy.postalcode}: *
                    </td>
                    <td>
                        <input type="text" name="plz" id="plz" class="persdata" style="width:60px" value="{$address.plz}">
                         <input type="hidden" name="req[plz]" value="postalcode">
                    </td>
                </tr>
                <tr>
                    <td>
                        {$langstrings.buy.city}: *
                    </td>
                    <td>
                        <input type="text" name="ort" id="ort" class="persdata" value="{$address.ort}" >
                        <input type="hidden" name="req[ort]" value="city">
                    </td>
                </tr>
                <tr>
                    <td>
                        {$langstrings.buy.country}: *
                    </td>
                    <td>
                        {html_options options=$Laender id="Land" name="Land" selected=$address.country|default:47}
                    </td>
                </tr>
                <tr id="state_row" {if $smarty.session["country"] != 173}style="display:none;"{/if}>
                    <td>{$langstrings.buy.state}:</td>
                    <td>
                        {html_options options=$states id="state" name="state" selected=$address.state}
                    </td>
                </tr>
                {if $ini.modules.adresssystem != "alt"}
                <tr>
                    <td>E-Mail: *</td>
                    <td>
                        <input type="text" name="email" class="persdata" value="{$address.email}" id="email">
                        <input type="hidden" name="req[email]" value="email">
                    </td>
                </tr>
                {/if}
                <tr>
                    <td>
                        {$langstrings.buy.phone}: 
                    </td>
                    <td>
                        <input type="text" name="telefon" id="telefon" class="persdata" value="{$address.telefon}" >
                    </td>
                </tr>
                <tr>
                    <td>
                        {$langstrings.buy.fax}:
                    </td>
                    <td>
                        <input type="text" name="fax" id="fax" class="persdata" value="{$address.fax}" >
                    </td>
                </tr>
                <tr id="vat">
                    <td>{$langstrings.buy.vat_id}:</td>
                    <td>
                        <input type="text" name="vat_id" id="vat_id" value="{$address.vat_id}">
                    </td>
                </tr>
                {if $ini.modules.adresssystem != "alt"}
                <tr>
                    <td>
                        {$langstrings.buy.comment}:
                    </td>
                    <td>
                        <textarea name="comment" rows="5" cols="20">{$address.comment}</textarea>
                    </td>
                </tr>
                {/if}
                <tr>
                    <td class="save_address" colspan="2" align="left">
                    {if !$incl}
                        <input type="submit" value="{$langstrings.buy.save_address}" class="save_address">
                    {elseif $incl==="addressbook"}
                    {else}
                        <input type="hidden" name="upd_addr_list" value="1">
                    {/if}
                    </td>
                </tr>
            </table>
        </div>
        
            
        {if $ini.modules.adresssystem == "alt" && !isset( $smarty.session.SHOP.buy.Persdata.defaultRechnungIdAdresse ) && !isset( $smarty.session.SHOP.buy.Persdata.defaultLieferIdAdresse )}
        <input type="hidden" name="id" value="{$addressID}" />
        <input type="hidden" name="LoginID" value="{$smarty.session.SHOP.buy.Persdata.ID}" />
        {elseif $address.id}
        <input type="hidden" name="id" value="{$address.id}" />
        {/if}
        <input type="hidden" name="mode" value="save" />
    </div>
</form>
{if !$incl}

<script type="text/javascript" src="/JavaScript/utils.js"></script>
<script type="text/javascript">
    $(function(){
        //$('#Land').change(upd_state).change(change_vat).change();
        $('input:submit').button();   
        $( "#tabsBasket .save_address").click(function(){
            
            data = $('#tabsBasket .edit_address').serializeArray();
            $.ajax({
                type: "POST",
                url: "/source/edit_address.php",
                data: data
            }).done(function(html){
                $('#tabsBasket .addresses').html(html);    
            })
    
        });   
        
        $( "#accordionBasket .save_address").click(function(){
            
            data = $('#accordionBasket .edit_address').serializeArray();
            $.ajax({
                type: "POST",
                url: "/source/edit_address.php",
                data: data
            }).done(function(html){
                $('#accordionBasket .addresses').html(html);    
            })
    
        });     
    })
             
</script>
{/if}
