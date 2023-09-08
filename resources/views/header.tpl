<style>
    .wk_open,
    .basket_info_text{
        display: none;
    }
    
</style>

<section id="topinfo" class="desktop">
    <div class="inner">

        <div class="hinweis_vk">
            <div class="hinweis_text"><strong>Mensch gefällig?</strong> Tel. {$ini.infoline}</strong></div>
        </div>
        
        <div class="topinfo_div icon_search">
            {include file="search.tpl"}
        </div>

        <div class="topinfo_div icon_merkzettel">
            <a href="/favoriten" title="Merkliste"><img onmouseleave="this.src='/images/webelemente/icon_merken.svg';" onmouseenter="this.src='/images/webelemente/icon_merken_active.svg';" src="/images/webelemente/icon_merken{if is_array($favoriten) && count($favoriten)>0}_active{/if}.svg"></a>
        </div>

        {if $smarty.session.SHOP.Login}
        <div class="topinfo_div icon_mein_konto">
            <a href="/login" title="zum Konto"><img onmouseleave="this.src='/images/webelemente/icon_konto.svg';" onmouseenter="this.src='/images/webelemente/icon_konto_active.svg';" src="/images/webelemente/icon_konto_active.svg"></a>
        </div>
        {else}
        <div class="topinfo_div icon_konto_eroeffnen">
            <a href="/register" title="Konto anlegen"><img onmouseleave="this.src='/images/webelemente/icon_konto.svg';" onmouseenter="this.src='/images/webelemente/icon_konto_active.svg';" src="/images/webelemente/icon_konto.svg"></a>
        </div>
        {/if}

        <div class="topinfo_div warenkorb icon_warenkorb">
            {include file="header_wk.tpl"}
        </div>
    </div>
    
    {if $smarty.session.isMobile===false}
    <div id="topnav">
        {include file="top_navigation.tpl"}
    </div>
    {/if}
    
</section>

<header class="header">

    <div class="nav_container">
        <div class="inner desktop header_topnav">
            <div class="logo">
                <a href="/" title="Zur Startseite">
                    <img src="/images/webelemente/logo.png" alt="Logo" />
                </a>
            </div>
        </div>
        
        <div class="inner mobile">
            <div class="boxLeft">
                <div class="menue">
                    <img src="/images/mobile/icon_menue.png" alt="Men&uuml;" />
                </div>
                <div class="suche">
                    <img class="invert" src="/images/webelemente/icon_lupe.svg"  onerror="this.src='/images/mobile/icon_suche.png'" alt="Suche"/>
                </div>
                {*
                <div class="shopname">
                    {$ini.titel_only}
                </div>
                *}
            </div>
            <div class="boxCenter">
                <a href="/"><img src="/images/webelemente/logo.png" alt="zur Startseite" /></a>
            </div>
            <div class="boxRight">
                <div class="location">
                    <a href="/?mode=login">
                        <img class="" src="/images/webelemente/icon_konto.svg"  onerror="this.src='/images/mobile/icon_login.png'"/>
                    </a>
                </div>
                <div class="warenkorb">
                    {include file="header_wk.tpl"}
                </div>
                
            </div>
            {include file="search.tpl"}
        </div>

    </div>
    
    {if $smarty.session.isMobile===true}
    <div id="topnav" class="mobile">
        {include file="top_navigation_mobile.tpl"}
    </div>
    {/if}
    
</header>
{*
<div class="hinweis_vk mobile">
    <div class="uppercase hinweis_text"><strong>Versandkostenfrei ab 50&euro; Bestellwert</strong></div>
    <div class="hinweis_text2">(Nur Internetbestellungen in Deutschland)</div>
</div>
*}


<script>
    $(document).ready(function(){
        $('.shopname').click(function(){
            window.location.href = '/';
        });
    });
</script>
