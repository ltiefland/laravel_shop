<!-- $Id: haendler_info.tpl 2393 2022-10-07 09:46:51Z tiefland $ BEGIN -->
<br />
<div style="float:left;padding-bottom:20px;">
    <h1>{$langstrings.shop.haendler_headline}</h1>
    <p>{$langstrings.shop.haendler_text|nl2br}</p>

    <br /><br />
    <h1>Login für Händler:</h1>
    <div class="haendler_register">
        <div>
            <form action="/" method="post">
                {if !$smarty.session.SHOP.Login}
                    <label for="haendler_login_email">{$langstrings.login.username}:</label>
                    <input id="haendler_login_email" autocomplete="off" type="text" name="email" value="" /><br />
                    
                    <label for="haendler_login_pw">Passwort:</label>
                    <input id="haendler_login_pw" type="password" name="password" /><br>
                    <input style="clear:both;float:left;" class="shopButton" type="submit" value="Anmelden" /><br /><br>
                    <input type="hidden" name="mode" value="login" /> &nbsp;&nbsp;&nbsp;<a style="clear:both;float:left;font-size:12px;" href="/?mode=forgot_pw">{$langstrings.login.lost_password}?</a>
                {else}
                    <div class="login_text">
                        <a href="/?mode=login">{$langstrings.login.welcome},<br /> {* {$smarty.session.SHOP.buy.Persdata.Anrede} *} {$smarty.session.SHOP.buy.Persdata.Nachname}!</a>
                        {if ( !$smarty.get.buy && !$smarty.post.buy )}
                            <input type="hidden" name="mode" value="logout" /><br>
                            <input style="clear:both;float:left;" class="shopButton" type="submit" value="Abmelden" /><br />
                        {/if}
                    </div>
                {/if}
                <br /><br />
            </form>
        </div>
    </div>
</div>

<div style="clear:both;float:none;border-top:1px solid #3A3B3D;margin-top:35px;">
    {if !$smarty.session.SHOP.Login}
        <h1 style="margin-top:10px!important;">{$langstrings.shop.haendler_headline2}:</h1>
        <p style="text-align:left;padding:0 0 1% 0;">{$langstrings.shop.haendler_gewerbeschein_info}</p>
        {include file="register_haendler.tpl"}
    {/if}
</div>
<p style="text-align:right;">mit einem * gekennzeichnete Felder sind Pflichtfelder.</p>
<!-- $Id: haendler_info.tpl 2393 2022-10-07 09:46:51Z tiefland $ END -->