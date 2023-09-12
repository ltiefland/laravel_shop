<section class="aktion">
    {if $aktion[0].art=='1' && $aktion[0].Kategorie=="Home"}
    <div class="inner_slider">
    {/if}
        {foreach $aktion as $index => $values}
            {if $values["art"] == '1' && $values["Kategorie"]=="Home"}       
                <script>
                $(document).ready(function(){
                    var speed_{$values["ID"]} = 0;
                    var auto_{$values["ID"]} = false;
                    var mode_{$values["ID"]} = "fade";
                    var pagerCustom_{$values["ID"]} = false;
                    var pause_{$values["ID"]} = 5000;
                    var easing_{$values["ID"]} = "ease-in";
                    
                    {if isset($values["config"]["verzoegerung"])}
                        speed_{$values["ID"]} = {$values["config"]["verzoegerung"]};
                    {/if} 
                    {if isset($values["config"]["verzoegerung"]) && ($values["config"]["verzoegerung"] != 0 || $values["config"]["verzoegerung"] != "0")}
                        auto_{$values["ID"]} = "true";
                    {/if}  
                    {if isset($values["config"]["effekt"])}
                        mode_{$values["ID"]} = "{$values["config"]["effekt"]}";
                    {/if}
                    {if isset($values["config"]["pause"])}
                        var pause_{$values["ID"]} = {$values["config"]["pause"]};
                    {/if}
                    {if isset($values["config"]["easing"])}
                        var easing_{$values["ID"]} =  "{$values["config"]["easing"]}";
                    {/if}
                    {if isset($values["config"]["boxen"]) && $values["config"]["boxen"] == 1 || $values["config"]["boxen"] == "1"}
                        pagerCustom_{$values["ID"]} = ".bx-pager_{$values["ID"]}"; 
                        $(".aktion .bx-pager_{$values["ID"]}").css("display", "inline-block");           
                    {/if}
                            
                    slider_{$values["ID"]} = $(".aktion .slider_{$values["ID"]}").bxSlider({
                        autoHover: true,
                        adaptiveHeight: true,
                        responsive: true,
                        speed : speed_{$values["ID"]},
                        auto: auto_{$values["ID"]},
                        mode: mode_{$values["ID"]},
                        pagerCustom: pagerCustom_{$values["ID"]},
                        pause: pause_{$values["ID"]},
                        easing: easing_{$values["ID"]},
                    });
                    
                    {if $values["config"]["navigation"] == 0}
                        $(".aktion .bx-controls").css("display", "none");       
                    {/if}
                    {if isset($values["config"]["pfeile"]) && $values["config"]["pfeile"] == 0}
                        $(".aktion .bx-prev, .aktion .bx-next").css("display", "none");
                    {/if}
                    {if isset($values["config"]["kreise"]) && $values["config"]["kreise"] == 0}
                        $(".aktion .bx-pager-item, .aktion .bx-pager, .aktion .bx-default-pager ").css("display", "none");
                    {/if}

                })
                </script>
                
                <style>
                    {if isset($values["config"]["kreise_oben"]) && $values["config"]["kreise_oben"] == 1}
                    .aktion .bx-wrapper .bx-pager {
                        top: 0px!important;
                    }    
                    {/if}
                    /*Pfeile-aussen CSS*/
                    {if isset($values["config"]["pfeile_aussen"]) && $values["config"]["pfeile_aussen"] == 1}
                    .aktion .bx-prev, .aktion .bx-next {
                        margin-left: -70px !important;
                        margin-right: -75px !important;
                    }
                    {/if}
                    .aktion .bx-wrapper .bx-controls-direction a {
                        top: 0%!important;
                        margin-top: 14% !important;
                    }

                    .aktion .bx-prev, .aktion .bx-next {
                        margin-top: 450px !important;
                    }            
                    .aktion .bx-wrapper {
                        /*padding-top:14%!important;*/
                        clear:both;
                    }
                    .aktion .bx-viewport {
                        width:100%!important;
                        
                        padding:0!important;
                        border:none!important;
                        margin:0px 0 0 0%;
                    } 
                    .bx-wrapper img{
                        width:100%!important;
                    }           
                </style>
                <ul class="slider_{$values["ID"]}" style="clear:both;">
                    {foreach $values["bilder"] as $index => $bilderValues}
                     {if $bilderValues["filename_mobile"] != "" }
                    <li><a href="{$bilderValues["link"]}"><img src="/images/aktionen/1/{$bilderValues["filename_mobile"]}" title="" /></a></li> 
                    {else} 
                    <li><a href="{$bilderValues["link"]}"><img src="/images/aktionen/1/{$bilderValues["filename"]}" title="" /></a></li> 
                    {/if}
                    {/foreach}
                </ul>

                <div class="bx-pager_{$values["ID"]}" style="display:none;padding-bottom:20px;float:left;margin-top: -40px;clear:both;">
                    {foreach $values["bilder"] as $index => $bilderValues}
                    <a style='float:left; border: 2px solid; margin-right:4px;height:50px; width: 50px;' data-slide-index="{$index}">
                        <img src="/images/aktionen/1/{$bilderValues["filename_mobile"]}" style='height:48px; width: 48px; margin:1px 1px 1px 1px;' />
                    </a> 
                    {/foreach}
                </div>
{if $aktion[0].art=='1' && $aktion[0].Kategorie=="Home"}
            </div>
{/if}         

            
            {elseif $values["art"] == '0' && $values["Kategorie"]=="Home"}
                
                <div class="aktion_100">
                {if $values.headline or $values.text}
                    <div class="aktion_title" id="aktion_title"><div><h1>{$values.headline}</h1></div></div>
                    <p>{$values.text}</p>
                {/if}
        
                {if $values["bilder"]}
                    {foreach $values["bilder"] as $index => $bilderValues}
                        <div style="float:left;width:100%;">
                        {if $bilderValues["link"]}
                            <a href="{$bilderValues["link"]}">
                        {/if}
                        <img src="/images/aktionen/1/{$bilderValues["filename"]}" title="" style="width: 100%;" alt="AktionBild" />
                        {if $bilderValues["link"]}
                            </a>
                        {/if}
                        </div>
                    {/foreach}
                {/if}
                </div>
                
        
                <!-- skonto und weber partner -->
                
                <!--
                <a href="http://www.grillshop-24.de/170-Weber-Exklusiv-2014/"><img src="/images/webelemente/weber-partner.jpg" /></a>
                -->
                
                
                {if $values.tagestipp}
                <div class="box_2">
                {include file="aktionTagestipp.tpl" aktion=$values}
                </div>
                {/if}
            
                
                <div class="break"></div>
            {/if}
        {/foreach}
</section>
<style>
.aktion_scrolldown {
    display:none;
}
</style>
<script>
$(document).ready(function(){
    // insert scrolldown arrow
    $('.bx-controls').prepend('<div class="aktion_scrolldown"><i class="fa fa-angle-double-down" aria-hidden="true"></i></div>');
    
    $('.aktion_scrolldown').click(function(){
        $("html, body").animate( { scrollTop: $('#einstieg').offset().top } , 500, 'easeOutQuint');
    });
    
});
</script>
