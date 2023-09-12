<!-- $Id: buy_1_newuser.tpl 2860 2022-11-17 13:19:43Z tiefland $ BEGIN -->
{if !$bestellvorgang}
<form class="basket_form" action="{if $ssl}https://{else}http://{/if}{$smarty.server.SERVER_NAME}/bestellen_seite_{$step}.html" method="post" name="buy" id="buy_form">
    <input type="hidden" name="_token" value="{csrf_token()}" />
{/if}
    <table class="basket_table">
        <tr>
            <th class="basket_head1">
                {$langstrings.buy.about_me}
            </th>
            
        </tr>
    </table>
    <table class="basket_table">
    {if $smarty.session.isMobile == false}
        <tr>
            <td>{$langstrings.buy.firstname} / {$langstrings.buy.name}:*</td>
            <td>
                <input type="hidden" name="account" value="new" />
                <input type="text" name="Persdata[Vorname]" class="text {if isset($errormsg_account["VornameAccount"]) && $errormsg_account["VornameAccount"]}input_error{/if}" id="login_vorname" value="{$smarty.session.SHOP.buy.Persdata.Vorname}" maxlength="255"/>
                <input type="hidden" name="req[VornameAccount]" value="persdata" />
                <input name="Persdata[Nachname]" type="text" class="persdata {if isset($errormsg_account["NachnameAccount"]) &&$errormsg_account["NachnameAccount"]}input_error{/if}" id="login_nachname" value="{$smarty.session.SHOP.buy.Persdata.Nachname}" maxlength="255" style="width:125px;"/>
                <input type="hidden" name="req[NachnameAccount]" value="persdata" />
            </td>
            <td>
                <span class="input_error_msg">{if isset($errormsg_account["NachnameAccount"])}{$errormsg_account["NachnameAccount"]}{/if} {if isset($errormsg_account["VornameAccount"])}{$errormsg_account["VornameAccount"]}{/if}</span>
            </td>
        </tr>
        {if $smarty.get.handler}
        <tr>
            <td>Firma:</td>
            <td>
                <input type="text" name="firma" style="width:281px;"/>
                
            </td>
            <td>
                
            </td>
        </tr>
        
        <tr>
            <td>Telefon:</td>
            <td>
                <input type="text" name="telefon" style="width:281px;"/>
                
            </td>
            <td>
                
            </td>
        </tr>
        {/if}
        <tr>
            <td>{$langstrings.login.username}:*</td>
            <td>
                <input type="email" name="Persdata[email]" class="text {if isset($errormsg_account["emailAccount"]) && $errormsg_account["emailAccount"]}input_error{/if}" id="login_email" required="true" style="width:281px;"/>
                <input type="hidden" name="req[emailAccount]" value="mail" />
            </td>
            <td>
                <span class="input_error_msg">{if isset(isset($errormsg_account["emailAccount"]) && $errormsg_account["emailAccount"] )}{$errormsg_account["emailAccount"]}{/if}</span>
            </td>
        </tr>
        <tr>
            <td>{$langstrings.login.password}:*</td>
            <td>
                <input type="password" name="Persdata[Passwort]" class="text {if isset($errormsg_account["PasswortAccount"]) && $errormsg_account["PasswortAccount"]}input_error{/if}" required="true" style="width:281px;"/>
                <input type="hidden" name="req[Passwort]" value="password" />
            </td>
            <td>
                <span class="input_error_msg">{if isset(isset($errormsg_account["PasswortAccount"]) && $errormsg_account["PasswortAccount"] )}{$errormsg_account["PasswortAccount"]}{/if}</span>
            </td>
        </tr>
        {if isset($errormsg_account["emailAccount"]) && $errormsg_account["emailAccount"]}
        
        <tr>
            <td colspan="2" class="options_order_buttons">
                <div id="login_button">{$langstrings.login.login}</div>
                <div id="gastkunde_button">{$langstrings.buy.gast_Kunde_headline}</div>
                <div id="passwort_button">{$langstrings.login.lost_password}</div>
            </td>
        </tr>
        
        {/if}
        {else}
         <tr>
            <td></td>
            <td style="float:left">
                <input type="hidden" name="account" value="new" />
                <input type="text" placeholder="{$langstrings.buy.firstname}:*" name="Persdata[Vorname]" class="text {if isset($errormsg_account["VornameAccount"]) && $errormsg_account["VornameAccount"]}input_error{/if}" id="login_vorname" maxlength="255" style="width: 42%;"/>
                <input type="hidden" name="req[VornameAccount]" value="persdata" />
                <input name="Persdata[Nachname]" placeholder="{$langstrings.buy.name}:*" type="text" class="persdata {if isset($errormsg_account["NachnameAccount"]) && $errormsg_account["NachnameAccount"]}input_error{/if}" id="login_nachname" maxlength="255" style="width: 42%;"/>
                <input type="hidden" name="req[NachnameAccount]" value="persdata" />
            </td>
            <td>
                <span class="input_error_msg">{if isset($errormsg_account["NachnameAccount"])}{$errormsg_account["NachnameAccount"]}{/if} {if isset($errormsg_account["VornameAccount"])}{$errormsg_account["VornameAccount"]}{/if}</span>
            </td>
        </tr>
        {if $smarty.get.handler}
        <tr>
            <td></td>
            <td>
                <input type="text" name="firma" style="width:281px;" placeholder="Firma"/>
                
            </td>
            <td>
                
            </td>
        </tr>
        
        <tr>
            <td>Telefon:</td>
            <td>
                <input type="text" name="telefon" style="width:281px;"/>
                
            </td>
            <td>
                
            </td>
        </tr>
        {/if}
        <tr>
            <td></td>
            <td>
                <input type="email"  placeholder="{$langstrings.login.username}:*" name="Persdata[email]" class="text {if isset($errormsg_account["emailAccount"]) && $errormsg_account["emailAccount"]}input_error{/if}" id="login_email" required="required" style="width:281px;"/>
                <input type="hidden" name="req[emailAccount]" value="mail" />
            </td>
            <td>
                <span class="input_error_msg">{if isset(isset($errormsg_account["emailAccount"]) && $errormsg_account["emailAccount"] )}{$errormsg_account["emailAccount"]}{/if}</span>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="password" placeholder="{$langstrings.login.password}:*" name="Persdata[Passwort]" class="text {if isset($errormsg_account["PasswortAccount"]) && $errormsg_account["PasswortAccount"]}input_error{/if}" required="required" style="width:281px;"/>
                <input type="hidden" name="req[Passwort]" value="password" />
            </td>
            <td>
                <span class="input_error_msg">{if isset(isset($errormsg_account["PasswortAccount"]) && $errormsg_account["PasswortAccount"] )}{$errormsg_account["PasswortAccount"]}{/if}</span>
            </td>
        </tr>
        {if isset($errormsg_account["emailAccount"]) && $errormsg_account["emailAccount"]}
        
        <tr>
            <td colspan="2" class="options_order_buttons">
                <div id="login_button">{$langstrings.login.login}</div>
                <div id="gastkunde_button">{$langstrings.buy.gast_Kunde_headline}</div>
                <div id="passwort_button">{$langstrings.login.lost_password}</div>
            </td>
        </tr>
        
        {/if}
        {/if}
    </table>
    <div class="break" style="height:15px;"></div>
{if !$bestellvorgang}
</form>
{/if}
<script>
    $(document).ready(function(){
        $(".options_order_buttons div").button();
        $('#login_button').click(function(){
            window.location.href="/?mode=login";
        });
        $('#gastkunde_button').click(function(){
            window.location.href="/bestellen_seite_1.html?account=guest";
        });
        $('#passwort_button').click(function(){
            window.location.href="/?mode=forgot_pw";
        });
        
        $("#login_vorname").blur(function(){
            var vorname = $(this).val();
            $("input[name='Persdata[Vorname]']").val(vorname);
                
        }); 
        $("#login_nachname").blur(function(){
            var nachname = $(this).val();
            $("input[name='Persdata[Nachname]']").val(nachname);
                
        });   
        $("#login_email").blur(function(){
            var email = $(this).val();
            $("input[name='Persdata[email]']").val(email);
                
        });   
        var land = {$defaultLandID};
        {if isset($smarty.session.SHOP.buy.Persdata.liefer_Land)}
            land = {$smarty.session.SHOP.buy.Persdata.liefer_Land}  
        {else}
            land = {$smarty.session.SHOP.buy.Persdata.Land}  
        {/if}
      
        c_url="/update_versand.php?Land="+land+"&liefer=1";
        
        $('#versand_optionen').load(c_url);  
    });
</script>  
<!-- $Id: buy_1_newuser.tpl 2860 2022-11-17 13:19:43Z tiefland $ END -->
