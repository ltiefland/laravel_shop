{extends file="page.tpl"}
{block name="content"}
<div class="inner inner_basket">

    {if $smarty.get.basket==true}
        <h3>{$langstrings.buy.basket}</h3>
        <div id="basket" class="warenkorbMenu">
            {if !$smarty.session.SHOP.BASKET}
                {include file="basket_empty.tpl"}
            {else}
                {include file="basket.tpl"}
            {/if}
        </div>
    {else}

    <script>
    
        $(function(){
            {if isset($errorMsg) && $errorMsg != "" && $ini.modules.checkVerfuegbarenBestand}
                alert( "{$errorMsg}" );
            {/if} 
            $('.addresses').css("display","inline-block"); 
            $(".favoritenMenu").load("/module/addFavoriten.php?mode=getFavoriten");
            
            {if $ini.newsletter.id}
                $(".newsletterMenu").load("/module/newsletter_status.php");
            {/if}
            
            {if $smarty.session.SHOP.buy.Persdata.Status > 1}
            $(".schnellBestellenMenu").load("/module/fastOrder.php");
            {/if}
            
            //Muss gemacht werden, damit die add_items_to_basket Funktion im favoritenMenu geht
            $("#letzteBestellungen").click(function(){
                $(".favoritenMenu").load("/module/addFavoriten.php?mode=getFavoriten");
            });
            initViewType($(window).width());
            $( window ).resize(function() {
                
                if( $(window).width() > 610){ 
                    
                    $("#accordionBasket").hide();
                                    
                    $(".Login").click(function(){
                        $("#tabsBasket").tabs({ active: '3'}); 
                    });
                    
                    $("#tabsBasket").tabs();
                    $("#tabsBasket").show();
                }else{
                    $("#tabsBasket").hide();
                    $("#accordionBasket").accordion({
                        heightStyle: 'content',
                    }); 
                    $("#accordionBasket").show();   
                }
                initViewType($(window).width());
            });
            var i = 1;
            var currentHeight = 0;
            var lastHeight = 0;
            
            $( ".adressdataInfo" ).each(function(){
                currentHeight = $( this ).height();
                
                if( i % 2 == 0){
                    if( lastHeight > currentHeight ){
                        $(this).css("height", lastHeight+"px");    
                    }else{
                        $(this).css("height", currentHeight+"px"); 
                    }    
                }
                lastHeight = $( this ).height();
                i++;
            });
            $('.addresses').css("display","none"); 
        });
        
        function initViewType( windowWidth ){
    
                if( windowWidth > 610){ 
                    $("#accordionBasket").hide();
                    {if $smarty.get.basket!=true}
                                    
                        $(".Login").click(function(){
                            $("#tabsBasket").tabs({ active: '3'}); 
                        });
                        var aktiverTab = 0;
                        {if $smarty.server.REQUEST_URI=="/newsletter_edit"}
                            aktiverTab = "4";
                        {elseif $smarty.server.REQUEST_URI == "/forgot_pw" || $smarty.server.REQUEST_URI == "/register" || $smarty.server.REQUEST_URI == "/login" || $smarty.server.REQUEST_URI == "/loginSuccess" ||$smarty.server.REQUEST_URI == "/addresses" || $smarty.server.REQUEST_URI == "/change_pw"}
                            aktiverTab = "3";
                        {elseif $smarty.server.REQUEST_URI == "/list_orders"}
                            aktiverTab = "2";
                        {elseif $smarty.server.REQUEST_URI == "/favoriten"}
                            $(".favoritenMenu").load("/module/addFavoriten.php?mode=getFavoriten");
                            aktiverTab = "1";
                        {/if}
                
                        $("#tabsBasket").tabs({
                            active: aktiverTab
                        });
                        $("#tabsBasket").show();
                    {else}
                        $("#tabsBasket").hide();
                    {/if}
                }else{
                    $("#tabsBasket").hide();
                    $("#accordionBasket").accordion({
                        heightStyle: 'content',
                    }); 
                    $("#accordionBasket").show();   
                }
           }
    </script>
    <h1 id="headlineLoginCenter" style="padding:10px;"></h1>
    <div id="tabsBasket" >
        <ul>
            
            <li style="display:none;">
                <a href="#basket" class="warenkorbnavi">
                    <span style="float:left;padding:6px 0px 6px 0px" class="">{$langstrings.buy.basket}</span>
                </a>
            </li>
            
            <li>
                <a href="#favoriten" class="warenkorbnavi">
                    <span style="float:left;padding:6px 0px 6px 0px" class="menuFavoriten">{$langstrings.login.favorites}</span>
                </a>
            </li>
            <li>
                <a href="#letzteBestellungen" class="warenkorbnavi">
                    <span style="float:left;padding:6px 0px 6px 0px">{$langstrings.login.list_orders}</span>
                </a>
            </li>
            <li>
                <a href="#account" class="warenkorbnavi">
                    <span style="float:left;padding:6px 0px 6px 0px">{$langstrings.login.account}</span>
                </a>
            </li>
            {if $ini.newsletter.id}
            <li>
                <a href="#newsletter" class="warenkorbnavi">
                    <span style="float:left;padding:6px 0px 6px 0px">{$langstrings.login.newsletter}</span>
                </a>
            </li>
            {/if}
            {if $smarty.session.SHOP.buy.Persdata.Status > 1}
            <li>
                <a href="#schnellBestellen" class="warenkorbnavi">
                    <span style="float:left;padding:6px 0px 6px 0px">{$langstrings.login.fastorder}</span>
                </a>
            </li>
            {/if}
        </ul>
        <div id="favoriten" class="favoritenMenu">
        </div>
        <div id="letzteBestellungen">
            
            {if !$smarty.session.SHOP.Login}
                {$langstrings.shop.login_account}
            {else}
                {include file="list_orders.tpl"}
            {/if}
        </div>
        <div id="account">
            {include file="login_info.tpl"}
        </div>
        {if $ini.newsletter.id}
        <div id="newsletter" class="newsletterMenu">
        </div>
        {/if}
        {if $smarty.session.SHOP.buy.Persdata.Status > 1}
        <div id="schnellBestellen" class="schnellBestellenMenu">
        </div>
        {/if}
    </div>
    

    
    <div id="accordionBasket">
        {*
        <h3>{$langstrings.buy.basket}</h3>
        <div id="basket" class="warenkorbMenu" style="display:none;">
            {if !$smarty.session.SHOP.BASKET}
                {include file="basket_empty.tpl"}
            {else}
                {include file="basket.tpl"}
            {/if}
        </div>
        *}
        <h3 class="menuFavoriten">{$langstrings.login.favorites}</h3>
        <div id="favoriten" class="favoritenMenu">
        </div>
        <h3>{$langstrings.login.list_orders}</h3>
        <div id="letzteBestellungen">
            {if !$smarty.session.SHOP.Login}
                {$langstrings.shop.login_account}
            {else}
                {include file="list_orders.tpl"}
            {/if}
        </div>
        <h3>{$langstrings.login.account}</h3>
        <div id="account">
            {include file="login_info.tpl"}
        </div>
        {if $ini.newsletter.id}
        <h3>{$langstrings.login.newsletter}</h3>
        <div id="newsletter" class="newsletterMenu">
        </div>
        {/if}
        {if $smarty.session.SHOP.buy.Persdata.Status > 1}
        <h3>{$langstrings.login.fastorder}</h3>
        <div id="schnellBestellen" class="schnellBestellenMenu">
        </div>
        {/if}
    </div>
    {/if}
</div>
{/block}