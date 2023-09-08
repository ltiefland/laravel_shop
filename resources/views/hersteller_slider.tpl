<!-- hersteller_slider.tpl -->
<script src="JavaScript/splide.min.js"></script>
<link rel="stylesheet" href="/JavaScript/splide-css/splide.min.css" />
<link rel="stylesheet" href="/JavaScript/splide-css/themes/splide-default.min.css" />
<style>
    #hersteller-slider {
        background:#fff;
        width: 100%;
        margin: 1% 0 1% 0;
    }

    #hersteller-slider .splide__track .splide__list .splide__slide {
        background-position: center center !important;
        background-repeat: no-repeat !important;
        background-size: 90% !important;
        /*background-color: rgb(25, 25, 25) !important;
        filter: grayscale(1) invert(1);*/
    }

    #hersteller-slider .splide__track .splide__list .splide__slide img {
        border-radius: 0px;
        height: 150px;
    }
    
    #hersteller-slider .splide__arrows .splide__arrow {
        display:none !important;
    }
</style>
<div id="hersteller-slider" class="splide">
    <div class="splide__track">
        <ul class="splide__list">
        {foreach $herstellerListe_footer as $key => $h}
            {if $h.Eigenschaft_1==1}
                <a href="{$h.herstellerLink}" class="splide__slide">
                    <img src="{$ini.Hersteller.logoPath}{$h.Logo1}" alt="{$h.Name}" />
                </a>
            {/if}
        {/foreach}
        </ul>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        new Splide("#hersteller-slider", {
            type: "loop",
            perPage: 12,
            perMove: 1,
            cover: true,
            pagination: false,
            autoplay: true,
            interval: 4000,
            breakpoints: {
                600: {
                    perPage: 2,
                    perMove: 1,
                },
                768: {
                    perPage: 4,
                    perMove: 1,
                },
                1024: {
                    perPage: 8,
                    perMove: 1,
                },
                1440: {
                    perPage: 12,
                    perMove: 1,
                },
            },
            fixedHeight: 100,
            gap: "1%",
            padding: 0,
        }).mount();
    });
</script>


<!-- /hersteller_slider.tpl -->