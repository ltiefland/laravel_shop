<div class="hd_login">
<form action="{$SCRIPT_NAME}" method="post">
    
    {if !$smarty.session.SHOP.Login}
        <div >Login</div>
        <input autocomplete="off" type="text"  name="email" value="{$smarty.post.email}" placeholder="{$langstrings.login.username}" /><br />
        <input style="margin-top:8px;" type="password"  name="password" placeholder="{$langstrings.login.password}"/><br>
        <input class="log_button" type="image" src="/images/webelemente/butt_anmelden.png" /><br>
        <input type="hidden" name="mode" value="login" />
    {else}
        <div class="login_text">
            <a href="/?mode=login">{$langstrings.login.welcome},<br /> {* {$smarty.session.SHOP.buy.Persdata.Anrede} *} {$smarty.session.SHOP.buy.Persdata.Nachname}!</a>
            {if ( !$smarty.get.buy && !$smarty.post.buy )}
                <br/> 
                <input type="hidden" name="mode" value="logout" /><br>
                <input style="padding:0 0 10px 0" type="image" src="/images/webelemente/butt_abmelden.png" /><br />
            {/if}
        </div>
    {/if}
    
</form>

{if !$smarty.session.SHOP.Login}

        <a href="/?mode=forgot_pw">{$langstrings.login.lost_password}?</a><br />
        <a href="/?mode=register">{$langstrings.login.new_customer}?</a><br /><br />
  
{else}
    <br />
    {if $smarty.session.SHOP.buy.Persdata.email|stristr:"marketplace.amazon.de"==false}
        <a href="/?mode=change_pw">{$langstrings.login.change_pw}</a><br />

        {if $ini.newsletter.newsletter==1}    
            {if $smarty.session.SHOP.buy.Persdata.email|stristr:"marketplace.amazon.de"==false}
                <a href="/?mode=newsletter_edit">{$langstrings.shop.newsletter}</a>
            
            {/if}
        {/if}   

        <a href="/?mode=list_orders">{$langstrings.login.list_orders}</a><br />
    {/if}
    
    {if $smarty.session.SHOP.buy.Persdata.email|stristr:"marketplace.amazon.de"==true || $amazon_kunde==1}
        Falls Sie Amazon-Kunde sind, nutzen Sie bitte <a href="http://www.amazon.de" target="_blank">amazon.de</a>, um Ihre Bestellinformationen einzusehen.
    {/if} 
        
{/if}

</div>
