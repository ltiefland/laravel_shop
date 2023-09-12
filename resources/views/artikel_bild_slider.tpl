<script>
    $(document).ready(function(){
        // classname, windowWidth, slides, autoplay, infiniteLoop, forceWidth, pager
        var w = $(".mobile_thumbs").width();
        var slider = initSlider( "mobileSliderArtikelBilder", w, 0, false, true, false, true ); 
        
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
        {foreach $item.medien as $key => $bild}
            {if $item.medien[$key]->medium.typ=="Bild"}
            <li>
                <picture>
                    <source media="(max-width:600px)" srcset="{$item.medien[$key]->medium.bild_url_gr}" />
                    <img src="{$item.medien[$key]->medium.bild_url}" class="img_zoom" {if $item.medien[$key]->medium["beschreibung"] != ""}alt="{$item.medien[$key]->medium["beschreibung"]}" title="{$item.medien[$key]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}"{/if} />
                </picture>
            </li>
            {/if}
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
  margin-left:0px;
  display: block;
  position: absolute;
  z-index: 2;
  margin: 3px;
}    
.bx-wrapper .bx-pager.bx-default-pager a {
    width:5px;
    height:5px;
}
</style>