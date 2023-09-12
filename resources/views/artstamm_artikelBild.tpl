{if count($subdir.items) > 1 && $subdir.medium[0]->medium.name != $ini.itemKorrektur.noImage}
    <div class="box_singleitem_img_wrapper">
        <div class="box_singleitem_img" style="">
            <img class="mausDrin" src="/images/upload/{$subdir.medium[0]->medium->folder}/ba/{$subdir.medium[0]->medium->name}" {if $subdir.medium[0]->medium["description"] != ""}alt="{$artstamm.medien[0]->medium["beschreibung"]}" title="{$subdir.medium[0]->medium["beschreibung"]}"{else}alt="{$subdir.name}" title="{$subdir.name}"{/if} id="img_zoom" data-zoom-image="{$artstamm.medien[0]->medium.bild_url}" />
        </div>
        <p class="small grey" style="text-align:center;clear:both;margin-top:20px;">-- Auf Produktfotos angezeigte Dekorationsartikel geh&ouml;ren nicht zum Leistungsumfang. --</p>
    </div>
    
    {if count($subdir.medium) > 1}
        <div class="thumbs_container" id="gallery">
            <ul class="sliderArtikelBilder">
                {foreach $subdir.medium as $key => $bild}
                    {if $bild->medium.medium_type_id==1}
                    <li class="thumbs">
                        <a href="#" data-image="/images/upload/{$bild->medium.folder}/{$bild->medium.name}" data-zoom-image="{$bild->medium->name}" title="Artikelbild">
                            <img src="/images/upload/{$bild->medium->folder}/ba/{$bild->medium->name}" class="mausDrin" {if $bild->medium["beschreibung"] != ""}alt="{$bild->medium["beschreibung"]}" title="{$bild->medium["beschreibung"]}"{else}alt="{$artstamm->name}" title="{$artstamm->name}"{/if}/>
                        </a>
                    </li>
                    {/if}
                {/foreach}
            </ul>
        </div>
    {/if}
{else}
    {foreach $artstamm.items as $index => $itemData}
        {if $index == 0}
        <div class="box_singleitem_img_wrapper">
            <div class="box_singleitem_img" style="">
                {if $itemData.medium[0]->medium.bild_url != $ini.itemKorrektur.noImage}
                <img class="mausDrin" src="/images/upload/{$itemData.medium[0]->medium->folder}/{$itemData.medium[0]->medium->name}" {if $itemData.medium[0]->medium["beschreibung"] != ""}alt="{$itemData.medium[0]->medium["beschreibung"]}" title="{$itemData.medium[0]->medium["beschreibung"]}"{else}alt="{$itemData.name}" title="{$itemData.name}"{/if} id="img_zoom" data-zoom-image="images/upload/{$itemData.medium[0]->medium->folder}/gr/{$itemData.medium[0]->medium->name}" />
                {/if}
            </div>
            <p class="small grey" style="clear:both;margin-top:20px;">-- Auf Produktfotos angezeigte Dekorationsartikel gehören nicht zum Leistungsumfang. --</p>
        </div>
        {/if}
    {/foreach}
{/if}


<script>
    $(document).ready(function() {

        var w = $('.itemLeftContainer').width();
        {* classname, windowWidth, slides, autoplay, infiniteLoop, forceWidth *}
        var slider = initSlider( "sliderArtikelBilder", w, 4, false, false, true );
        
        //pass the images to Fancybox
        $("#img_zoom").click(function(e) {
            var ez = $('#img_zoom').data('elevateZoom');
            var g = ez.getGalleryList();

            $.fancybox.open(g,{
                'openEffect'    :   'elastic',
                'closeEffect'   :   'elastic',
                'nextEffect'    :   'fade',
                'openSpeed'     :   200, 
                'closeSpeed'    :   200,
                helpers : {
                    buttons : {}
                }
            });
        });
        
    });

</script>