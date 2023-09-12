<div class="box_middle">
{if $smarty.get.handler}
    <form name="reg" action="{$SCRIPT_NAME}?handler=1" method="post">
{else}
    <form name="reg" action="{$SCRIPT_NAME}" method="post">
{/if}
{include file="buy_1_newuser.tpl" nocache bestellvorgang=true}
        
        <input type="hidden" name="mode" value="register" />
        <input type="hidden" name="type" value="registration" />
        <input type="hidden" name="action" value="Persdata" />
    
    {if $smarty.get.back}
        <input type="hidden" name="back" value="bestellen_seite_1.html" />
    {/if}
        <a style="margin-top:15px;" href="javascript:void(0);" onclick="document.forms.reg.submit();"><input id="register_button" type="submit" class="butt_hover" value="Registrieren"/></a><br /><br />
    </form>
</div>