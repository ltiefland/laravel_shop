<script>
    $(document).ready(function () {

        $(".loginInfo").accordion({
            collapsible: true,
            heightStyle: "content"
        });

        {if $smarty.server.REQUEST_URI == "/login"}
        $(".loginInfo").accordion("option", "active", 0);
        {elseif $smarty.server.REQUEST_URI == "/forgot_pw"}
        $(".loginInfo").accordion("option", "active", 1);
        {elseif $smarty.server.REQUEST_URI == "/register"}
        $(".loginInfo").accordion("option", "active", 2);
        {elseif $smarty.server.REQUEST_URI == "/addresses"}
        $(".loginInfo").accordion("option", "active", 1);
        {/if}

    });

</script>
<div class="loginInfo">
    {if !$smarty.session.SHOP.Login}
        <h2 class="loginAcc">{$langstrings.buy.login}</h2>
        <div id="login">
            {$langstrings.shop.login_account}<br/><br/>
            <form action="/login" method="post">
                <input type="hidden" name="_token" value="{csrf_token()}"/>
                <input class="input input1" type="text" name="email" value="{$smarty.session.SHOP.buy.Persdata.email}"
                       placeholder="{$langstrings.login.username}"/>
                <br/>
                <input class="input input1" type="password" name="password"
                       placeholder="{$langstrings.login.password}"/>
                <br/>
                <input type="submit" id="login_button" value="Anmelden"/>
                {if $smarty.get.buy=="true"||$smarty.get.basket=="true"}
                    <input type="hidden" name="return" value="true"/>
                {/if}
                <input type="hidden" name="keepLoginBack" value="1"/>
            </form>
        </div>
        <h2 class="forgotPW">{$langstrings.login.lost_password}</h2>
        <div id="forgotPassword">
            {$langstrings.login.forgot_pw}<br/><br/>
            <form method="post" action="/send_pw" id="send_pw">
                <input type="hidden" name="_token" value="{csrf_token()}"/>
                <input class="input input1" type="text" name="email" value="{$smarty.session.SHOP.buy.Persdata.email}"
                       placeholder="{$langstrings.login.username}"/><br/>
                <input type="hidden" name="mode" value="send_pw">
                <input type="submit" id="send_pw_button" value="Passwort anfordern"/>
            </form>
        </div>
        <h2 class="register">{$langstrings.login.register}</h2>
        <div id="register">
            {include file="register.tpl"}
        </div>
    {else}
        <h2>{$langstrings.login.change_pw_head}</h2>
        <div id="changePassword">
            {include file="change_pw.tpl"}
        </div>
        {if $ini.modules.adresssystem != "alt"}
            <h2 class="addressesHead">{$langstrings.login.addresses}</h2>
            <div class="addresses">
                {include file="list_addresses.tpl"}
            </div>
        {/if}
        <h2>Logout</h2>
        <div id="logout">
            <form action="/logout" method="post">
                <input type="hidden" name="_token" value="{csrf_token()}"/>
                <input type="hidden" name="mode" value="logout"/><br/>
                <input type="submit" id="logout_button" value="Logout"/>
            </form>
        </div>
    {/if}
</div>
