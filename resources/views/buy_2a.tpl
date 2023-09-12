{extends file="buy.tpl"}
{block name="buyStep"}
<script>
            $(function(){
                //weban.js
                var slider = initSlider( "daySlider", $(window).width(), 3 );
        
                $( window ).resize(function(){
                    var windowWidth = $(this).width();
                    slider = reloadSlider( slider , windowWidth, 3 );
                })
            })
        </script>
        <style>
            .noborder{
                border-width: 2px;
                border-top-width: 0px;
                border-bottom-width: 0px;
                border-style: solid;
                border-color: transparent;
                height: 26px;
                margin-left: 1px;  
            }
            .border{
                border-width: 2px;
                border-top-width: 0px;
                border-bottom-width: 0px;
                height: 26px;
                margin-left: 1px;
                background-color:grey;
                cursor: pointer;
            }
            .solid{
                border-style: solid;    
            }
            .dotted{
                border-style: dotted;     
            }
        </style>
        <div id="calslider">
            <div id="cal">
                <div class="daySlider">
                    {foreach $days as $day}
                        {include file="day.tpl"}
                    {/foreach}
                </div>
            </div>
        </div>
{/block}