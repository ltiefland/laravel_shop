<script>
    $(document).ready(function(){
        // classname, windowWidth, slides, autoplay, infiniteLoop, forceWidth, pager
        let w = $(".mobile_thumbs").width();
        let slider = initSlider( "mobileSliderArtikelBilder", w, 0, false, true, false, true );

        //pass the images to Fancybox
        $('.img_zoom').fancybox({
            afterClose  : function() {
                    slider = initSlider( "mobileSliderArtikelBilder", w, 0, false, true, false, true );
                }
        });

    });
</script>

<div class="mobile_thumbs" style="width:100%;">
    <ul class="mobileSliderArtikelBilder" id="gallery">
        {foreach $item->media as $key => $bild}
            <li>
                <picture>
                    <source media="(max-width:600px)" srcset="{$bild->gr_url}" />
                    <img src="{$bild->url}" class="img_zoom" alt="{$item->name}" title="{$item->name}" />
                </picture>
            </li>
        {/foreach}
    </ul>
</div>

<script>
            zoomType='';
            //zoomType, scrollZoom, clickZoom, img_zoom

            initElevateZoom(zoomType,true,true);
            $( window ).resize(function(){
                $('.zoomContainer').each(function(){
                    $(this).remove();
                });
                initElevateZoom(zoomType,true);
            });
</script>

<style>
    .bx-has-pager {
        position: relative;
        display: contents;
    }
    .bx-has-pager .bx-pager {
        display:block;
    }
.box_2 .neu_icon {
  display: block;
  position: absolute;
  z-index: 2;
  margin: 3px 3px 3px 0;
}
.bx-wrapper .bx-pager.bx-default-pager a {
    width:5px;
    height:5px;
}
</style>
