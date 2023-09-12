{assign var="popup_bg" value="/images/popup/pop-up_neukunden.jpg"}
{assign var="popup_width" value=990}
{assign var="popup_height" value=432}
{assign var="popup_margin" value="margin:240px 0 0 422px;"}

{if $smarty.session.isMobile==1}
    {assign var="popup_bg" value=""}
    {assign var="popup_width" value=false}
    {assign var="popup_height" value=false}
    {assign var="popup_margin" value=false}
{/if}
<style>
#popup {
    display:none;
    background:url({$popup_bg}) no-repeat scroll 50% center / contain ;
}
#popup .description {
    display:none;
}
#popup #newsletter_register {
    display:block;
    {$popup_margin}
}

</style>
<script>
$(document).ready(function(){
    {if $popup_width && $popup_height}
        var popup_width = {$popup_width};
        var popup_height = {$popup_height};
    {else}
        var popup_width = $(window).width();
        var popup_height = $(window).height();
    {/if}
    
    
    $( "#popup" ).dialog({
                    modal:true,
                    autoOpen: false,
                    show: "fade",
                    hide: "fade",
                    draggable: true,
                    resizable: false,
                    closeOnEscape: true,
                    width:popup_width-20,
                    height:popup_height-20,
                    
                    
                              
                });    
    {if $showPopup==1}
    setTimeout(function(){ $('#popup').dialog("open"); }, 2000);
    {/if}
            
});
</script>

<div id="popup">
    {if $smarty.session.isMobile==1}
        {include file="newsletter_anmeldung_mobile.tpl"}
    {else}
        {include file="newsletter_anmeldung.tpl"}
    {/if}
</div>