{extends file="page.tpl"}
{block name=content}
<!-- $Id: item.tpl 3009 2023-01-09 10:36:15Z erling $ BEGIN -->
{if $item->price > 0}
<script>
    $(function(){

        let w = $('.item_leftrow').width();
        {* classname, windowWidth, slides, autoplay, infiniteLoop, forceWidth *}
        let slider = initSlider( "sliderArtikelBilder", w, 6, false, false, true );

        zoomType='';
        initElevateZoom(zoomType,true);
        $( window ).resize(function(){
            $('.zoomContainer').each(function(){
                $(this).remove();
            });
            initElevateZoom(zoomType,true);
        });

        //pass the images to Fancybox
        $("#img_zoom").click(function(e){
            let ez = $('#img_zoom').data('elevateZoom');
            let g = ez.getGalleryList();
            console.log(g);
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

        {if $item->versandkosten_overlib}
        $('.tooltip_opener').mouseenter(function(){
            $('.tooltip').css("display","block");
        });
        $('.tooltip_opener').mouseleave(function(){
            $('.tooltip').hide();
        });
        {/if}

        let href = window.location.href;
        if(href) {
            let id = href.split("#");
            if(id[1]) {
                id = id[1];
                $('#' + id).load("/module/reiter/" + id + ".php?item=" + {$item->id});
                $('#' + id).css("display","contents");
            }
            $('#beschreibung').css({
                "opacity":1,
                "margin-left":"0px",
            });
        }
        $('#reiter > ul > li').click(function() {
            $('.ui-tabs-panel').css({
                "opacity":0,
                "margin-left":"-5%",
            });
            let href = $("a",this).attr("href");
            if(href) {
                let id = href.split("#");
                if(id[1]) {
                    id = id[1];
                    $('#' + id).load("/module/reiter/" + id + ".php?item=" + {$item->id});
                    $('#'+id).css({
                        "opacity":1,
                        "margin-left":"0px",
                    });
                }
            }
        });
        $("a.euLabel").css("cursor","pointer").click(showEuLabel);
        $('#euLabelLayer').dialog({
            autoOpen:false,
            modal:true,
            resizable:false,
            width:500,
            height:610,
            show: "fade",
            hide: "fade",
            overflow: "auto",
        });
    });
    function showEuLabel()
    {
        bild=$(this).attr("data-link");
        $('#euLabelLayerBild').attr("src",bild);
        $('#euLabelLayer').dialog("open");
    }
</script>


    <style>
        .zoomWrapper{
            border: none;
        }
        #img_zoom{
        }
        .ui-widget-header {
            background-image:none!important;
        }
        /*
        .bx-wrapper .bx-prev {
            left:-8%;
        }
        .bx-wrapper .bx-next {
            right:-8%;
        }
        .bx-wrapper .bx-controls-direction a {
            top:36%;
        }

        #gallery ul {
            display:contents;
        }
        */
        #beschreibung_content table td {
            padding:5px;
        }
        .versand_aufschlag {
            cursor:help;
            border-radius:3px;
            padding:2% 1%;
            background:#e91524;
            color:#fff;
            text-align:center;
            width:90%;
            margin:10px 0;
        }

        .content .box_2 .thumbs_container .thumbs {
            display:flex;
        }

    </style>
    <script>
        {if ( $smarty.post.billigerGesehen )}
            window.alert("Vielen Dank für Ihre Anfrage. Sie erhalten in Kürze eine Antwort von uns.")
        {/if}

        $(function(){
            let data = [];
            data.push({ name: "seitenID", value: {$item->id} });
            data.push({ name: "type", value: "artikel" });

            /*$.ajax({
                type: "POST",
                url: "/module/seitenzugriff.php",
                data: data
            });*/

            // yt dialog
            w = 520;
            let ww = $(window).width();
            if(ww<768) {
                w = ww;
            }
            $('#youtube').dialog({
                autoOpen:false,
                modal:true,
                width:w,
                resizable:true,
                close:function()
                {
                    $('#youtubeFrame').attr("src","")
                }
            });


            $('.youtubeLink').css("cursor","pointer").click(function(){
                // youtubeFrame height
                if(ww<768) {
                    w = ww;
                }
                let f = 1.77777;
                let h = w/f;
                $('#youtubeFrame').height(h);
                $('#youtubeFrame').attr("src",$(this).attr("data-src"))
                $('#youtube').dialog("open");
            });




            data = [];
            data.push({ name: "seitenID", value: {$item->id} });
            data.push({ name: "type", value: "artikel" });

            /*$.ajax({
                type: "POST",
                url: "/module/seitenzugriff.php",
                data: data
            });*/







            $(function(){
                $("a.euLabel").css("cursor","pointer").click(showEuLabel);
                $('#euLabelLayer').dialog({
                    autoOpen:false,
                    modal:true,
                    resizable:false,
                    width:"auto",
                    height:"auto",
                    show: "fade",
                    hide: "fade",
                    overflow: "auto",
                });
            });
            function showEuLabel()
            {
                bild=$(this).attr("data-link");
                $('#euLabelLayerBild').attr("src",bild);
                $('#euLabelLayer').dialog("open");
            }


        });

</script>
    <div class="box_2">

        {if $item->cntRatings>0}
        <div style="display:none">
            <span>{$item->avgRating}</span>
            <span>{$item->cntRatings}</span>
            <span>1</span>
            <span>5</span>
            <span>{$item->kurzbezeichnung}</span>
        </div>
        {/if}

        <!-- Strkturierte Daten -->
        <meta content="{$item->id}" />
        {if $item->EAN}
               <meta content="{$item->EAN}" />
        {/if}
        {if $item->mpn}
            <meta content="{$item->mpn}" />
        {/if}
        {foreach $item->media as $key => $bild}
        {if $bild@index == 2}
        {break}
        {/if}
        <link href="{$bild->url}" />
        {/foreach}
        <div>
            <meta content="{$item->hersteller_Bezeichnung|default:$item->hersteller_Name}"/>
        </div>
         <!-- Strkturierte Daten ENDE-->


        <div class="box_middle">
            <div class="item-3-cols">
                <!-- item_left_row -->
                <div class="item_leftrow">

                    <div class="desktop">
                        <div class="item_img">
                            {if isset($item->media[0]->url)}
                                <img class="mausDrin" src="{$item->media[0]->url}" alt="{$item->name}" title="{$item->name}" id="img_zoom" data-zoom-image="{$item->media[0]->url}" />
                            {elseif isset($item->FatherInfo.Artstamm.medien[0]->medium.name) && $item->FatherInfo.Artstamm.medien[0]->medium.name != $ini.itemKorrekur.noImage}
                                <img class="mausDrin" src="/images/upload/{$item->medium[0]->medium->folder}/{$item->FatherInfo.Artstamm.medien[0]->medium.name}" {if $item->FatherInfo.Artstamm.medien[0]->medium["beschreibung"] != ""}alt="{$item->FatherInfo.Artstamm.medien[0]->medium["beschreibung"]}" title="{$item->FatherInfo.Artstamm.medien[0]->medium["beschreibung"]}"{else}alt="{$item->kurzbezeichnung}" title="{$item->kurzbezeichnung}" {/if} id="img_zoom" data-zoom-image="{$item->FatherInfo.Artstamm.medien[0]->medium.bild_url}" />
                                <br />Bild aus der Produktgruppe
                            {else}
                                <img src="/images/upload/{$item->medium[0]->medium->folder}/{$item->medium[0]->medium.name}" {if $item->medium[0]->medium["beschreibung"] != ""}alt="{$item->medium[0]->medium["beschreibung"]}" title="{$item->medium[0]->medium["beschreibung"]}"{else}alt="{$item->kurzbezeichnung}" title="{$item->kurzbezeichnung}" {/if} />
                            {/if}
                        {if $item->medium[0]->medium['aehnlich']==1 && !stristr( $item->medium[0]->medium.bild_url_klein, "noPicture.gif")}
                           <div style="margin-left:10px;margin-top:-23px;"> -- Abbildung ähnlich --</div>
                        {/if}
                        </div>
                        {assign var=anzBilder value=0}
                        {foreach $item->medium as $key => $bild}
                            {if $bild->medium.medium_type_id==1}
                                {assign var=anzBilder value=$anzBilder+1}
                            {/if}
                        {/foreach}
                        {if $anzBilder > 1}
                        <div class="thumbs_container" id="gallery">
                            <ul class="sliderArtikelBilder">
                                {foreach $item->medium as $key => $bild}
                                    {if $bild->medium.medium_type_id==1}
                                    <li class="thumbs">
                                        <a href="#" data-image="/images/upload/{$bild->medium.folder}/{$bild->medium.name}" data-zoom-image="/images/upload/{$bild->medium->folder}/{$bild->medium.name}" title="Artikelbild">
                                            <img src="/images/upload/{$bild->medium->folder}/mini/{$bild->medium.name}" class="mausDrin" {if $bild->medium["beschreibung"] != ""}alt="{$bild->medium["beschreibung"]}" title="{$bild->medium["beschreibung"]}"{else}alt="{$item->kurzbezeichnung}" title="{$item->kurzbezeichnung}"{/if}/>
                                        </a>
                                    </li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </div>
                        {/if}
                        <div class="thumbs_container_video">
                            <ul class="sliderVideos">
                                {foreach $item->medium as $key => $bild}
                                    {if $bild->medium.medium_type_id==3}
                                    <li class="thumbs" style="float:left;">
                                        <a data-src="/images/upload/{$bild->medium->folder}/mini/{$bild->medium.name}?rel=0&autoplay=1&enablejsapi=1" class="youtubeLink">
                                            <div style="margin-left: 24px;
                                                        margin-top: 20px !important;
                                                        position: absolute;
                                                        text-align: center !important;
                                                        z-index: 1000 !important;">
                                                <img src="/images/webelemente/YouTube-icon-full_color.png" />
                                            </div>
                                            <img src="/images/upload/video_thumbnails/{$bild->medium.folder}.jpg" />
                                        </a>
                                    </li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </div>

                    </div>


                    {if $smarty.session.isMobile==true}
                    <div class="mobile">
                        {if $item->NEU}
                        <div class="neu_icon">
                            NEU!
                        </div>
                        {/if}

                        {if $item->medium|count > 1}
                            {include file="artikel_bild_slider.tpl"}
                        {else}
                        <div class="box_singleitem_img">
                            {if $item->medium[0]->medium.bild_url != $ini.itemKorrektur.noImage}
                            <img class="mausDrin" src="/images/upload/{$item->medium[0]->medium->folder}/{$item->medium[0]->medium.bild_url}" {if $item->medium[0]->medium["beschreibung"] != ""}alt="{$item->medium[0]->medium["beschreibung"]}" title="{$item->medium[0]->medium["beschreibung"]}"{else}alt="{$item->kurzbezeichnung}" title="{$item->kurzbezeichnung}" {/if} id="img_zoom" data-zoom-image="/images/upload/{$item->medium[0]->medium.folder}/{$item->medium[0]->medium.name}" data-elevateZoom="/images/upload/{$item->medium[0]->medium.folder}/gr/{$item->medium[0]->medium.name}" />
                            {/if}
                        </div>
                        {/if}

                        <div class="thumbs_container_video">
                            <ul class="sliderVideos">
                                {foreach $item->medium as $key => $bild}
                                    {if $bild->medium.medium_type_id==3}
                                    <li class="thumbs" style="float:left;">
                                        <a data-src="/images/upload/{$bild->medium->folder}/mini/{$bild->medium.name}?rel=0&autoplay=1&enablejsapi=1" class="youtubeLink">
                                            <div style="margin-left: 24px;
                                                        margin-top: 20px !important;
                                                        position: absolute;
                                                        text-align: center !important;
                                                        z-index: 1000 !important;">
                                                <img src="/images/webelemente/YouTube-icon-full_color.png" />
                                            </div>
                                            <img src="/images/upload/video_thumbnails/{$bild->medium.folder}.jpg" />
                                        </a>
                                    </li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </div>

                    </div>
                    {/if}

                </div>
                <!-- item_rightrow -->
                <div class="item_rightrow">
                    <div class="logo_breadcrumb">
                        <span style="float: left;min-width:100px;">{$item->hersteller_Logo1}</span>
                        {include file="shopposition.tpl"}
                    </div>

                <!-- Artikelname -->

                    <h1 id="item_name_h1">{$item->hersteller_kurzbezeichnung}</h1>
                    {if $item->langbezeichnung}
                        <h2>{$item->langbezeichnung}</h2>
                    {/if}
                     <!-- UVP -->
                    {assign var=UVP value="price[($ini.uvpPreisIndex-1)]->preis"}
                    {if $ini.template.durchstreichpreise==1 && $item->$UVP > $item->price}
                    <div class="break"></div>
                    <span class="infopic strike uvp">
                        UVP: <span class="euro">&euro;</span>&nbsp;{$item->$UVP|money_format|replace:"USD":"$"|replace:"EUR":""}
                    </span>
                    <div class="break"></div>
                    {/if}
                    <!-- Preis / Gebindeeinheit -->
                    <div>
                    <span style="display:none">
                        <link href="{$ini.URL}{$item->itemLink}" />
                        <span>{$item->price}</span>
                        <span>EUR</span>
                        <meta content="{"+21 days"|date_format:"%Y-%m-%d"}" />
                    <!-- Lieferstatus -->
                    </span>
                    <div class="preis_lieferstatus">
                        {if $item->LieferstatusValue==4}
                        <div>
                            <img src="/images/webelemente/24h_lieferung.svg">
                        </div>
                        {/if}
                        <!-- Lagerbestand -->
                        {include file="item_kurier.tpl"}
                        {include file="lagerbestand.tpl"}

                        <div>
                            {include file="lieferstatus.tpl" mode="item"}
                        </div>
                    <!-- Spedition -->
                    {if $item->versandgruppen_id==2}
                        <span>
                            <p>Speditionsversand:&nbsp;zzgl.&nbsp;49,00&nbsp;€</p>
                        </span>
                    {/if}

                    </div>

                    </div>

                    {if $item->medium|count>1}
                    <div class="icons">
                        {foreach $item->medium as $medium}
                            {if $medium->medium.medium_type_id==6}
                                <img src="/images/upload/{$medium->medium->folder}/kl/{$medium->medium.bild_url}" />
                            {/if}
                        {/foreach}
                    </div>
                    {/if}

                    <div class="item_preis" id="visiblePrice">
                        {$item->price|money_format|replace:"EUR":"&euro;"}
                    </div>


                    {if $item->gewicht != 1 && $item->preis_einheit && $item->gewicht>0}
                        <span class="item_preiseinheit">
                        / {$item->gewicht|number_format:2} {$item->preis_einheit}
                        </span>
                    {/if}



                    <!-- Preis / Versandkosten -->
                    <div class="small clear">
                        <span class="item_preis_message">
                            {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                                {$langstrings.shop.price_msg}
                            {else}
                                {$langstrings.shop.price_msg_brutto}
                            {/if}

                            <a href="/versand_uebersicht.html" class="tooltip_opener">{$langstrings.shop.price_msg_link}</a>

                            <!-- Preis / Grundpreis -->
                            {if $item->gebinde_menge > 0 && $item->gebinde_einheit}
                               <br /> Grundpreis: {($item->price/$item->gebinde_menge)|number_format:2} €  / {$item->gebinde_einheit}
                            {/if}

                        </span>

                        {if $item->price > 1 && $item->vk_preis && $item->nachlass_prozent>5}
                        <div class="sie_sparen">
                            <div>
                                <div class="strike">{$item->vk_preis|money_format|replace:"EUR":"&euro;"|replace:"USD":"$"}</div>
                                Sie sparen: {($item->vk_preis-$item->price)|money_format|replace:"EUR":"&euro;"|replace:"USD":"$"} ({$item->nachlass_prozent|round}%)
                            </div>
                        </div>
                        {/if}

                        {if $item->versand_aufschlag>0}
                            <div class="versand_aufschlag" title="{$langstrings.shop.versand_aufschlag|default:"DHL Sperrgutversand"}">
                                zzgl. Versandaufschlag: {$item->versand_aufschlag|number_format:2|replace:" ":"&nbsp;"} €
                            </div>
                            {if $langstrings.item.versand_aufschlag}
                                <p>{$langstrings.item.versand_aufschlag}</p>
                            {/if}
                        {/if}


                        </div>

                    {if $item->price >= 200 && $ini.easycredit.aktiv==1}
                        <div class="easycredit_box" style="margin-top:10px;">
                            <div><img src="/images/webelemente/za_easycredit.png" alt="easycredit Logo"></div>
                            <div id="finanzierung"></div>
                        </div>

                    {/if}


                    <form action="/" id="basket" onsubmit="return false;">

                    <!-- Optionen -->
                    {if $optionen}
                            <script>
                                $(document).ready(function() {
                                        let origPrice = $("#optionPreis").data("preis");
                                        const optionen = {$optionen|json_encode};
                                        let newPrice = origPrice;

                                        $('select.options').change(function() {
                                            newPrice = origPrice;
                                            $('select.options').each(function(){
                                                newPrice += optionAufschlag(this,optionen);
                                            });
                                            $('#optionPreis').val(newPrice);
                                            $('#visiblePrice').html(newPrice.money_format() + " &euro;");
                                        });


                                        $('select.options').each(function(){
                                            newPrice += optionAufschlag(this,optionen);
                                        });
                                        $('#optionPreis').val(newPrice);
                                        $('#visiblePrice').html(newPrice.money_format() + " &euro;");



                                });
                                function optionAufschlag(opt,optionen) {
                                    let aufschlag = 0;
                                    const optid = $("option:selected",opt).attr("value");
                                    if(optid) {
                                        for(key in optionen) {
                                            for(key2 in optionen[key].options) {
                                                if(key2==optid) {
                                                    aufschlag = parseFloat(optionen[key].options[key2].aufschlag);
                                                }
                                            }
                                        }
                                    }
                                    return aufschlag;
                                }
                            </script>
                    <div class="options">
                        {include file="options.tpl"}
                    </div>
                    {/if}


                    {if $ini.addons.selectbox == 1 && $addons}
                        {include file="addons_select.tpl"}
                    {/if}

                        <input type="hidden" name="confirm" value="true" />
                        <input type="hidden" name="buy" value="false" />
                        <input type="hidden" name="Menge" value="1" />
                        <input type="hidden" name="item" value="{$item->id}" />
                        <input type="hidden" id="optionPreis" data-preis="{$item->price}" name="preis" value="{$item->price}" />

                        <input type="hidden" name="basket" value="true" />




                        <!-- Warenkorb Button -->
                        <div class="itemBasketButton">
                            <div class="basketButton">
                                {if !$smarty.session.SHOP.hash}
                                {assign var="lieferbareArtikel" value=explode(",",$ini.itemKorrektur.lieferbareArtikel)}
                                {if (in_array($item->LieferstatusValue,$lieferbareArtikel) || $ini.itemKorrektur.lieferbareArtikelNurBestellbar!=1)
                                && $item->LieferstatusMaintainer==$ini.itemKorrektur.ignoreBestandOnLieferstatusMaintainer}

                                    <div class="basketMenge">
                                        <div class="mengen_input">
                                            <input class="mengeninput" type="text" name="Menge" value="1" id="menge" />
                                            {if $item->max_bestellmenge > 0}
                                            <script>
                                                $(function(){
                                                    $('#menge').change(function(){
                                                    if($('#menge').val()>{$item->max_bestellmenge})
                                                    {
                                                        alert("Sie kÃ¶nnen nur maximal {$item->max_bestellmenge} Exemplare dieses Artikels bestellen!");
                                                    }
                                                    })
                                                })
                                            </script>
                                            {/if}
                                        </div>
                                    </div>
                                    <div class="basket_text add_to_basket">
                                        {$langstrings.shop.in_basket}
                                    </div>
                                    <div class="button_inner add_to_basket">
                                        <img src="/images/webelemente/icon_warenkorb_weiss.svg" alt="in den Warenkorb" />
                                    </div>


                                {else}
                                {$langstrings.shop.artikel_vergriffen}
                                {/if}
                                {else}
                                <p style="padding:2%;">Bitte bezahlen Sie erst die manuell erfasste Bestellung. Danach können Sie eine neue Bestellung mit weiteren Artikeln aufgeben.</p>
                                {/if}
                            </div>
                            <div class="item_addFavorites">
                                {include file="favoriten.tpl" mode="item"}
                            </div>
                        </div>

                        <div class="itemNav">
                            <a href="{$item->fatherLink}"><i class="fa fa-caret-left" aria-hidden="true"></i> Zur&uuml;ck zur &Uuml;bersicht</a>
                        </div>
                    </form>

                </div>

            </div>

            {if $ini.modules.reiter=="jquery"}

            <div id="reiter">
                <ul class="reiternav">
                    <li>
                        <a href="#beschreibung">{$langstrings.item.description}</a>
                    </li>
                    {section loop=$item->reiter name=r_ind}
                    <li>
                        <a href="#{$item->reiter[r_ind].url}">{$item->reiter[r_ind].name}</a>
                    </li>
                    {/section}

                    {* Produktbewertungen *}
                    {if $ini.Produktbewertungen.aktiv==true && $item->cntRatings>0}
                    <li>
                        <a href="#ratings_container">Produktbewertungen</a>
                    </li>
                    {/if}

                </ul>
                <div id="beschreibung">
                    <div id="beschreibung_content">

                        {if $item->kennung}
                        <p class="">Kennung: {$item->kennung}</p>
                        {/if}

                        <span>

                            {if $item->langbezeichnung}

                                <p class="normal itemName">{$item->langbezeichnung}</p>

                            {/if}
                            <br />

                            {if $item->description}
                                <p class="normal">{$item->description|nl2br}</p>
                            {/if}

                            <p class="normal">{$item->customText}</p>

                        </span>
                        {if $item->hersteller_Text2}
                            <p class="normal" style="margin-top:20px;"><b>Mehr Informationen zum Produzenten / Hersteller:</b></p>
                            <p class="normal">{$item->hersteller_Text2|nl2br}</p>
                        {/if}

                        <p class="small grey" style="margin-top:20px;">-- Auf Produktfotos angezeigte Dekorationsartikel geh&ouml;ren nicht zum Leistungsumfang. --</p>
                    </div>
                {if $item->description|strlen>450}
                    <style>
                        #beschreibung_content {
                            overflow:hidden;
                            height:175px;
                            transition:height 200ms ease;
                        }
                        #showmore,
                        #showless {
                            margin-top:20px;
                        }
                    </style>
                    <div id="showmore" class="shopButton2">Mehr anzeigen</div>
                    <div id="showless" class="shopButton2">Weniger anzeigen</div>
                {/if}
                </div>

                {foreach $item->reiter as $key => $value}
                    {if $value.url}
                        <div id="{$value.url}"></div>
                    {/if}
                {/foreach}


                {if $item->description2}
                <div id="beschreibung2">
                    <b>Deklarationspflichtige Zusatzstoffe</b><br />
                    <p class="normal">{$item->description2}</p>
                </div>
                {/if}


                {if $ini.Produktbewertungen.aktiv==true && $item->cntRatings>0}
                    <div id="ratings_container">
                        {include file="bewertungen.tpl"}
                    </div>
                {/if}



            {else}
                <div id="beschreibung">
                    {if $item->EAN}
                    <p>EAN: {$item->EAN}</p>
                    {/if}
                    {if $item->langbezeichnung}
                        <p>{$item->langbezeichnung}</p>
                    {/if}
                    {if $item->description}
                    <span>
                        <p class="normal" style="padding-top:1.5%;">{$item->description|nl2br}</p>
                    </span>
                    {/if}

                    <p class="normal">{$item->description2|nl2br}</p>
                    <p class="normal">{$item->customText}</p>


                    <p class="small grey" style="margin-top:20px;">-- Auf Produktfotos angezeigte Dekorationsartikel geh&ouml;ren nicht zum Leistungsumfang. --</p>
                </div>
            {/if}
            </div>

        </div>
 </div>

<div class="break"></div>


    {if $showEULabel==1}
    <div id="euLabelLayer" title="EU-Energielabel für {$item->kurzbezeichnung}">
        <img id="euLabelLayerBild" src="" height="600" />
    </div>
    {/if}

{/if}

<script>
    $(document).ready(function(){
        $("#beschreibung img").removeAttr("width");
        $("#beschreibung img").removeAttr("height");

    });
</script>
<style>
    #showless {
        display:none;
    }
    div.options {
        padding:3% 0;
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        justify-content: left;
        align-items: center;
    }

    select.options {
        margin: 5px 10px 5px 0px;
        padding:4px;
        border: 1px solid #EA5900;
        background: #fff;
        background-color: rgb(255, 255, 255);
        background-position-x: 0%;
        background-position-y: 0%;
        background-repeat: repeat;
        background-attachment: scroll;
        background-image: none;
        background-size: auto;
        background-origin: padding-box;
        background-clip: border-box;
        color: #EA5900;
    }
</style>
<script>
$(function() {

    $('#showmore').on("click", function() {
        $('#beschreibung_content').animate({
            height:'100%'
        }, 1400);
        $('#showmore').hide();
        $('#showless').show().css("display","inline-block");
    });
    $('#showless').on("click", function() {
        $('#beschreibung_content').css("height","175px");
        $('#showmore').show().css("display","inline-block");
        let offset = $('#beschreibung_content').offset();
        let top = offset.top;
        $('html, body').animate({
            scrollTop: $("#reiter").offset().top-150
        }, 400);
        $('#showless').hide().scrollTop(top);
    });

    $( ".nachster" ).click(function() {
        $(".ui-dialog-titlebar").hide();
        $("#loading").dialog('open');
        let id = $(this).attr('id');

      $.ajax({
            type: "POST",
            url: "/module/nachster.php?item=" + id,
            async: false,
            success: function (nid) {

               window.location = window.location.origin + '/?item=' + nid;
            }
        })
        return;
    });

    $('#finanzierungsDlg').dialog({
        autoOpen:false,
        modal:true,
        width:650,
        resizable:false,
        maxHeight:600
    });
    $('#finanzierungsLink_a').css('cursor','pointer').click(function(){
        $('#finanzierungsDlg').load('/module/finanzierungsbeispiele.php?item={$item->id}').dialog("open");
    })
    $('#finanzierungsRechnerLink').css('cursor','pointer').click(function(){
        $('#finanzierungsDlg').load("{$ini.typo3.url}/typo3/?id=127 #c129");
    })
    $('#hinweisText').dialog({
        autoOpen:false,
        modal:true,
        resizable:false,
        width:"70%",
        show: "fade",
        hide: "fade"

    })
    $('#gewichtsHinweis').click( function () {
        $('#hinweisText').dialog("open");
        return false;
    });

    $('#beschreibung3').dialog({
        autoOpen:false,
        modal:false,
        resizable:true,
        width:"70%",
        show: "fade",
        hide: "fade"

    })
    $('#beschreiung3_open').click( function () {
        $('#beschreibung3').dialog("open");
        return false;
    });

});
</script>

<div id="beschreibung3">
{if $item->description3}
    {$item->description3}
{/if}
</div>
<div id="finanzierungsDlg" title="Finanzierungsbeispiele für {$item->kurzbezeichnung}"></div>
{if $ini.easycredit.aktiv==1}
<link rel="stylesheet" type="text/css" href="https://ratenkauf.easycredit.de/ratenkauf/js/ratenrechner/v1/ratenrechner.css"/>
<script type="text/javascript" src="https://ratenkauf.easycredit.de/ratenkauf/js/ratenrechner/v1/ratenrechner.js"></script>
<script type="text/javascript">
    $(function(){
        let options={
            webshopId: "{$ini.easycredit.shop_id}",
            finanzierungsbetrag: {$item->price},
            euro:"ISO",
            textVariante:'LANG',
        }
        rkPlugin.anzeige("finanzierung",options)
    })
</script>
{/if}
    <div id="youtube" title="Video">
        <iframe id="youtubeFrame" width="480" height="360" allowfullscreen="true"></iframe>
    </div>

<!-- $Id: item.tpl 3009 2023-01-09 10:36:15Z erling $ END -->
{/block}

