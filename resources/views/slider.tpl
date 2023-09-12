<!-- slider START -->
<script src="/JavaScript/jquery.carouFredSel-6.1.0-packed.js" type="text/javascript"></script>
<script>
    $(document).ready(function(){
        setTimeout(function(){
            $('.aktion_slider_placeholder').css('display','none');
            $('.aktion_slider').css('display','block');
            $("#aktionSlider").carouFredSel({
            height: 237,
            width: 913,
        	items: {
        		visible: 1,
        		minimum: 1,
        		start: "random",
                fx: "scroll"
        	},
        	scroll: {
        		items: 1,
        		easing: "linear",
                pauseOnHover: "immediate",
                duration: {$sliderconfig.short_line_2}
        	},
        	auto: {
        		timeoutDuration: {$sliderconfig.short_line_1},
        		delay: {$sliderconfig.short_line_1}
        	},
        	prev: {
        		button: "#prev_btn",
        		key: "left"
        	},
        	next: {
        		button: "#next_btn",
        		key: "right"
        	},
            });
        },1000);
    });
</script>
<div class="aktion_slider_placeholder">
    <img src="/images/webelemente/loading.gif" alt="Ladebild" />
</div>
<div class="aktion_slider">
<div id="prev_btn"></div> <!-- zurückbutton -->
<div id="aktionSlider">
{foreach $slideraktion as $item} <!-- loop daten von array -->
    <!-- ANFANG Artikel -->
    
    <a href="{$item.short_line_1}">
        <img src="/{$item.bild_1_url}" />
    </a>
    
    <!-- ENDE Artikel -->
{/foreach}
</div>
<div id="next_btn"></div> <!-- vorbutton -->
<div class="aktionslider_navigation">
<div id="paginationslider"></div>
</div>
</div>
<div class="break"></div>
<!-- slider ENDE -->
