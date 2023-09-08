<div class="headnav">
    <div class="headnav_inner">
        <div class="infocenter">
            <ul>
                <li class="navi_arrow_white_down noborder">Infocenter
                    <ul class="infocenter_submenu">
                        {if $serviceCenterArr[0].serviceCenter|count>0}
                            {$serviceCenterArr[0].serviceCenter}
                        {/if}
                    </ul>
                </li>
            </ul>
        </div>
        <div class="infocenter login_menu">
            <ul>
                <li class="noborder">
                    {if $smarty.session.SHOP.Login}
                    <a href="/?mode=login">{$smarty.session.SHOP.buy.Persdata.email}</a>
                    {else}
                    <a href="/?mode=login">Login</a>
                    <ul class="infocenter_submenu">
                        <li>{include file="login.tpl"}</li>
                    </ul>
                    {/if}
                </li>
            </ul>
        </div>
    </div>
</div>
    
    