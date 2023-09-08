{*
<section class="aktion">
    {include file="reveal.tpl"}
</section>
*}

<section class="aktion">
    
    <div class="inner">
        {foreach $aktion as $index => $values}
            {if $values["art"] == '1' && $values["category"]=="Home"}
                <script>
                    {$config=$values["config"]|unserialize}
                $(document).ready(function(){
                    let speed_{$values["id"]} = 0;
                    let auto_{$values["id"]} = false;
                    let mode_{$values["id"]} = "fade";
                    let pagerCustom_{$values["id"]} = false;
                    let pause_{$values["id"]} = 5000;
                    let easing_{$values["id"]} = "ease-in";
                    
                    {if isset($config["verzoegerung"])}
                        speed_{$values["id"]} = {$config["verzoegerung"]};
                    {/if} 
                    {if isset($config["verzoegerung"]) && ($config["verzoegerung"] != 0 || $config["verzoegerung"] != "0")}
                        auto_{$values["id"]} = "true";
                    {/if}  
                    {if isset($config["effekt"])}
                        mode_{$values["id"]} = "{$config["effekt"]}";
                    {/if}
                    {if isset($config["pause"])}
                        pause_{$values["id"]} = {$config["pause"]};
                    {/if}
                    {if isset($config["easing"])}
                        easing_{$values["id"]} =  "{$config["easing"]}";
                    {/if}
                    {if isset($config["boxen"]) && $config["boxen"] == 1 || $config["boxen"] == "1"}
                        pagerCustom_{$values["id"]} = ".bx-pager_{$values["ID"]}"; 
                        $(".aktion .bx-pager_{$values["ID"]}").css("display", "inline-block");           
                    {/if}
                            
                    let slider_{$values["id"]} = $(".aktion .slider_{$values["id"]}").bxSlider({
                        autoHover: true,
                        adaptiveHeight: true,
                        responsive: true,
                        speed : speed_{$values["id"]},
                        auto: auto_{$values["id"]},
                        mode: mode_{$values["id"]},
                        pagerCustom: pagerCustom_{$values["id"]},
                        pause: pause_{$values["id"]},
                        easing: easing_{$values["id"]},
                    });
                    
                    {if $config["navigation"] == 0}
                        $(".aktion .bx-controls").css("display", "none");       
                    {/if}
                    {if isset($config["pfeile"]) && $config["pfeile"] == 0}
                        $(".aktion .bx-prev, .aktion .bx-next").css("display", "none");
                    {/if}
                    {if isset($config["kreise"]) && $config["kreise"] == 0}
                        $(".aktion .bx-pager-item, .aktion .bx-pager, .aktion .bx-default-pager ").css("display", "none");
                    {/if}

                })
                </script>
                <style>
                    {if isset($config["kreise_oben"]) && $config["kreise_oben"] == 1}
                    .aktion .bx-wrapper .bx-pager {
                        top: 0!important;
                    }    
                    {/if}
                    /*Pfeile-aussen CSS*/
                    {if isset($config["pfeile_aussen"]) && $config["pfeile_aussen"] == 1}
                    .aktion .bx-prev, .aktion .bx-next {
                        margin-left: -70px !important;
                        margin-right: -75px !important;
                    }
                    {/if}
                    .aktion .bx-wrapper .bx-controls-direction a {
                        top:0!important;
                        margin-top:280px!important;
                    }
                    .aktion .bx-prev, .aktion .bx-next {
                        margin-top: 450px !important;
                    }            
                    .aktion .bx-wrapper {
                        /*padding-top:14%!important;*/
                        clear:both;
                    }
                    .aktion .bx-viewport {
                        padding:0!important;
                        border:none!important;
                        margin:0 0 0 0;
                    } 
                    .bx-wrapper img{
                        width:100%!important;
                    }           
                </style>
                <ul class="slider_{$values["id"]}" style="clear:both;">
                    {if is_countable($values->medium)}
                        {foreach $values->medium as $index => $bilderValues}
                            <li>
                                {if $bilderValues->medium.beschreibung}
                                <a href="{$bilderValues->medium.beschreibung}">
                                    {/if}
                                    <picture>
                                        <source media="(max-width:768px)" srcset="{$bilderValues->medium.mobilImg}">
                                        <img src="/images/upload/aktionen/1/{$bilderValues->medium.name}" title="" alt="" />
                                    </picture>

                                    {if $bilderValues->medium.beschreibung}
                                </a>
                                {/if}
                            </li>
                        {/foreach}
                    {/if}
                </ul>

                <div class="bx-pager_{$values["id"]}" style="display:none;padding-bottom:20px;float:left;margin-top: -40px;clear:both;">
                    {if is_countable($values->medium)}
                    {foreach $values->medium as $index => $bilderValues}
                        <a style='float:left; border: 2px solid; margin-right:4px;height:50px; width: 50px;' data-slide-index="{$index}">
                            <img src="{$bilderValues->medium.abs_bild_url}" style='height:48px; width: 48px; margin:1px 1px 1px 1px;' alt="" title="" />
                        </a>
                    {/foreach}
                    {/if}
                </div>
            </div>
            {elseif $values["art"] == '0' && $values["category"]=="Home"}
                {if $values.headline or $values.text}
                <div class="inner">
                <div class="aktion">
                    <div class="aktion_title" id="aktion_title"><div><h1>{$values.headline}</h1></div></div>
                    
                    <p>{$values.text}</p>
                </div>
                </div>
                {/if}
            
                {if $values["bilder"]}
                    {foreach $values["bilder"] as $index => $bilderValues} 
                    <div style="float:left;width:100%;"><img src="/images/aktionen/1/{$bilderValues["filename"]}" title="" style="width: 100%;"/></div>
                    {/foreach}
                {/if}
        
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


{include file="home.tpl"}

<script>
$(document).ready(function(){
    // insert scrolldown arrow
    /*
    $('.bx-controls').prepend('<div class="aktion_scrolldown"><i class="fa fa-angle-double-down" aria-hidden="true"></i></div>');
    
    $('.aktion_scrolldown').click(function(){
        $("html, body").animate( { scrollTop: $('#einstieg').offset().top } , 500, 'easeOutQuint');
    });
    */
});
</script>
<style>

    .slider_layer {
        position:absolute;
        background:#0f0;
        color:#fff;
        width:75%;
        right:0;top:0;
        height:398%;
        background: rgb(233,88,1);
        background: linear-gradient(130deg, rgba(20,86,25,1) 0%, rgba(119,154,88,1) 100%, rgba(0,212,255,1) 100%);
        transform: skewY(-67deg);

    }
    .slider_layer_text {
        padding: 10% 10% 0% 57%;
        transform: skewY(67deg);
    }
</style>
