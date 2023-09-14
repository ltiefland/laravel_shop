{nocache}
<!DOCTYPE html>
<html lang="de">
    <head>

        <title>{$title}</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Content-Language" content="de" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="robots" content="{$robots}" />
        <meta name="revisit-after" content="1 days" />
        <meta name="Author" content="WEBAN UG" />
        <meta name="keywords" content="{$keywords}" />

{if $desc != ""}
        <meta name="description" content="{$desc}" />
        <meta property="og:description" content="{$desc}" />
{/if}
        <meta property="og:site_name" content="{$ini.titel_only} Online-Shop" />
        <meta property="og:type" content="product" />
        <meta property="og:title" content="{$title_facebook}" />
    {if $subdir->media[0]->url}
        <meta property="og:image" content="{$subdir->medien[0]->url}" />
    {elseif $item->media[0]->url}
        <meta property="og:image" content="{$item->medium[0]->url}" />
    {else}
        <meta property="og:image" content="{$ini.absoluteURL}/images/webelemente/logo.png" />
    {/if}
        <meta property="og:url" content="{$act_url}" />
        <meta property="og:country-name" content="Germany"/>

        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png" />
        <meta name="theme-color" content="#ffffff" />

        <link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link rel="apple-touch-icon" sizes="57x57" href="/images/webelemente/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon" sizes="60x60" href="/images/webelemente/apple-touch-icon-60x60.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="/images/webelemente/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="76x76" href="/images/webelemente/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="/images/webelemente/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon" sizes="120x120" href="/images/webelemente/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon" sizes="144x144" href="/images/webelemente/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon" sizes="152x152" href="/images/webelemente/apple-touch-icon-152x152.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="/images/webelemente/apple-touch-icon-180x180.png" />
        <link rel="icon"             sizes="192x192" href="/images/webelemente/android-icon-192x192.png" />


        <link rel="canonical" href="{$ini.absoluteURL}{$smarty.server.REQUEST_URI}" />
        <link rel="stylesheet" href="/styles/reiter/jquery-ui.min.css" />

        {asset_compile}
        <link rel="stylesheet" href="/styles/fonts.css" type="text/css" />
        <link rel="stylesheet" href="/styles/styles.css" type="text/css" />
        <link rel="stylesheet" href="/styles/header_menu.css" type="text/css"/>
        <link rel="stylesheet" href="/styles/top_nav.css" />
        <link rel="stylesheet" href="/styles/qtip.css" type="text/css"/>
        <link rel="stylesheet" href="/styles/print.css" type="text/css" media="print" />
        <!--<link rel="stylesheet" type="text/safari" href="/styles/safari.css" />-->
        {*<link rel="stylesheet" href="/styles/finder.css" />*}
        {* <link rel="stylesheet" href="/JavaScript/shariff-master/build/shariff.complete.css" /> *}
        <link rel="stylesheet" type="text/css" href="/styles/tablet.css" media="screen and (max-width:1100px)" />
        <link rel="stylesheet" type="text/css" href="/styles/smartphone.css" media="screen and (max-width:350px)" />

        <link rel="stylesheet" href="/styles/color.css" />
        <link rel="stylesheet" href="/styles/ui-mods.css" />
        <link rel="stylesheet" href="/styles/links.css" />

        {/asset_compile}

        <link rel="stylesheet" href="/JavaScript/fancybox/source/jquery.fancybox.css" />
        <link rel="stylesheet" href="/styles/jquery.bxslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/styles/font-awesome/css/fontawesome-all.min.css" type="text/css"/>
        <!-- Stylesheet ENDE -->

        <script type="text/javascript" src="/JavaScript/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="/JavaScript/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/JavaScript/jquery.bxslider/jquery.bxslider.min.js"></script>
        <script type="text/javascript" src="/JavaScript/utils.js"></script>


        <!-- Javascript START -->
        {asset_compile}
        {*
        <script type="text/javascript" src="/JavaScript/finanzierungSantander.js"></script>
        *}

        <script type="text/javascript" src="/JavaScript/jquery.elevateZoom-3.0.8.min.js"></script>
        <script type="text/javascript" src="/JavaScript/jquery.elevatezoom.js"></script>

        <script type="text/javascript" src="/JavaScript/fancybox/source/jquery.fancybox.pack.js"></script>

        <script type="text/javascript" src="/JavaScript/weban.js"></script>
        {* <script type="text/javascript" src="/js/weban_scripts.js"></script> *}
        <script type="text/javascript" src="/JavaScript/addresses.js"></script>
        <script type="text/javascript" src="/JavaScript/view_orders.js"></script>
        <script type="text/javascript" src="/JavaScript/validateEmail.js"></script>
        <!--<script type="text/javascript" src="/includes/auto_plz/autoplz.js"></script>-->
        <script type="text/javascript" src="/JavaScript/jquery_socialprivacy/jquery.socialshareprivacy.min.js"></script>
        <script type="text/javascript" src="/JavaScript/weban_itemZoom.js"></script>
        <script type="text/javascript" src="/JavaScript/money_format.js"></script>
        <script type="text/javascript" src="/JavaScript/artikelmodell.js"></script>
        <script type="text/javascript" src="/JavaScript/addFavorites.js"></script>

        {if $ini.consentTool.anbieter=="usercentrics" && $ini.consentTool.anbieterId}
        <script type="application/javascript" src="https://app.usercentrics.eu/latest/main.js" id="{$ini.consentTool.anbieterId}"></script>
        <meta data-privacy-proxy-server = "https://privacy-proxy-server.usercentrics.eu"/>
        <script type="application/javascript" src="https://privacy-proxy.usercentrics.eu/latest/uc-block.bundle.js"></script>
        <script defer type="application/javascript" src="https://privacy-proxy.usercentrics.eu/latest/uc-block-ui.bundle.js"></script>
        {/if}

        <script>
            let checkVerfuegbarenBestand;
            let buy_link_base = "{$buy_link_base}";
            {if $ini.modules.checkVerfuegbarenBestand==1}
                checkVerfuegbarenBestand = true;
            {/if}
        </script>
        {if $ini.modules.add_to_basket==1}
        <script type="text/javascript" src="/JavaScript/add_item_to_basket.js"></script>
        {/if}
        {if $pagetype|stristr:"Bestellvorgang"}
        <script>
            let land;
            {if $smarty.session.SHOP.Lieferadresse=="true"}
            land = {$smarty.session.SHOP.buy.Persdata.liefer_Land|default:$defaultLandID:47};
            {else}
            land = {$smarty.session.SHOP.buy.Persdata.Land|default:$defaultLandID:47};
            {/if}
        </script>
        <script type="text/javascript" src="/JavaScript/change_versand.js"></script>
        {/if}
        {if !$smarty.get.id}
        <script type="text/javascript" src="/JavaScript/billigerGesehen.js"></script>
        <script type="text/javascript" src="/JavaScript/overlib_mini.js"></script>
        <script type="text/javascript" src="/JavaScript/email_fehler.js"></script>
        {/if}
        <script type="text/javascript" src="/JavaScript/subnav.js"></script>
        {if $smarty.session.isMobile}
        {* <script type="text/javascript" src="/JavaScript/jquery.ui.touch-punch.min.js"></script> *}
        {/if}
        {if $ini.exorbyte.exorbyte_url!=""}
        <script src="{$ini.exorbyte.exorbyte_url}" type="text/javascript"></script>
        {/if}
        {if ( $ini.modules.reservieren == 1 )}
        <script type="text/javascript" src="/JavaScript/reservieren.js"></script>
        {/if}
        {if ( $ini.modules.merkzettel == 1 || $ini.modules.empfehlen == 1 )}
        <script type="text/javascript" src="/JavaScript/empfehlen_merken.js"></script>
        {/if}

        {if $ini.star_garantie.aktiv==1}
        <script type="text/javascript" src="/JavaScript/garantie.js"></script>
        {/if}
        {/asset_compile}

        {if $ini.modules.nicht_gefunden==1}
        <script type="text/javascript" src="/JavaScript/nicht_gefunden.js"></script>
            {if $smarty.post.mode=="not_found"}
            <script type="text/javascript">
                $(function(){
                    $('#nicht_gefunden_msg').dialog("open");
                });
            </script>
            {/if}
        {/if}


        {if  $ini.google.GA4_id}
            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async src='https://www.googletagmanager.com/gtag/js?id={$ini.google.GA4_id}' type="text/plain" data-usercentrics="Google Analytics 4"></script>
            <script async type="text/plain" data-usercentrics="Google Analytics 4">
              window.dataLayer = window.dataLayer || [];
              function gtag() { dataLayer.push(arguments); }
              gtag('js', new Date());
              gtag('config', '{$ini.google.GA4_id}');
            {if $smarty.session.SHOP.SUMME && $smarty.session.bestellId}
                gtag('event', 'purchase', {
                    transaction_id: '{$smarty.session.bestellId}',
                    affiliation: '{$ini.google.shopname}',
                    value: {$smarty.session.SHOP.SUMME},
                    currency: 'EUR',
                    items: [
                    {foreach $smarty.session.SHOP.BASKET as $key => $value}
                        {
                            id: '{$value.ID}',
                            name: '{$value.name|trim}',
                            quantity: {$value.Menge},
                            price: '{$value.preis}',
                        },
                    {/foreach}
                    ],
                });
            {/if}
            </script>
        {/if}



        {if $ini.google.adwords_remarketing==1 && $ini.google.google_conversion_id}

            <!-- Global site tag (gtag.js) - Google Ads: 925473272 -->
            <script async src="https://www.googletagmanager.com/gtag/js?id={$ini.google.google_conversion_id}"></script>
            <script> window.dataLayer = window.dataLayer || []; function gtag(){ dataLayer.push(arguments); } gtag('js', new Date()); gtag('config', '{$ini.google.google_conversion_id}'); </script>

            <!-- Event snippet for Kauf conversion page -->
            {if $smarty.session.SHOP.SUMME}
            <script>
                gtag('event', 'conversion', {
                        'send_to': '{$ini.google.google_conversion_id}/fFljCLPLjJADEPeN0fsD',
                        'value': {$smarty.session.SHOP.SUMME},
                        'currency': 'EUR',
                        'transaction_id': '{$smarty.session.SHOP.bestellId|default:$bestellId}'
                });

            </script>
            {/if}


            <script type="text/plain" src="//www.googleadservices.com/pagead/conversion.js" data-usercentrics="Google Remarketing" ></script>
            <script type="text/plain" data-usercentrics="Google Remarketing">
                let google_tag_params = {
                    ecomm_prodid: {$ecomm_prodid},
                    ecomm_pagetype: {$ecomm_pagetype},
                    ecomm_totalvalue: {$ecomm_totalvalue|default:0}
                };

                /* <![CDATA[ */
                let google_conversion_id = '{$ini.google.google_conversion_id}';
                let google_custom_params = window.google_tag_params;
                let google_remarketing_only = true;
                /* ]]> */
            </script>

        <!--
        <noscript>
            <div style="display:inline;">
                <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/{$ini.google.google_conversion_id}/?value=0&amp;guid=ON&amp;script=0"/>
            </div>
        </noscript>
        -->
        {/if}

        {if $ini.google.trustedstores_aktiv == 1 && $ini.google.trustedstores_id != "" && $ini.google.trustedstores_position != "" && $ini.google.trustedstores_page_language != "" && $ini.google.merchant_id != ""}
        <!-- BEGIN: Google zertifizierte Händler -->
        <script type="text/plain" data-usercentrics="Google Trusted Stores" >
            let gts = gts || [];

            gts.push(["id", "{$ini.google.trustedstores_id}"]);
            gts.push(["badge_position", "{$ini.google.trustedstores_position}"]);
            gts.push(["locale", "{$ini.google.trustedstores_page_language}"]);
            {if $pagetype == "Itemseite"}
            gts.push(["google_base_offer_id", "{$item.ID}"]);
            {/if}
            gts.push(["google_base_subaccount_id", "{$ini.google.merchant_id}"]);

            (function() {
                let gts = document.createElement("script");
                gts.type = "text/javascript";
                gts.async = true;
                gts.src = "https://www.googlecommerce.com/trustedstores/api/js";
                let s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(gts, s);
            })();
        </script>
        <!-- END: Google zertifizierte Händler -->
        {/if}


        {if $smarty.get.basket=="true"||$smarty.get.buy=="true"}
            {if $ini.amazon.aktiv==1}
            {$amazon_js}
            {/if}
        {/if}


        {if $ini.google.analytics_account != ""}
        <script {if $ini.consentTool.anbieter=="usercentrics" && $ini.consentTool.anbieterId}type="text/plain" data-usercentrics="Google Analytics"{/if}>
            let _gaq = _gaq || [];
            _gaq.push(['_setAccount', '{$ini.google.analytics_account}']);
            _gaq.push (['_gat._anonymizeIP']);
            _gaq.push(['_trackPageview']);
            {if $pagetype=="Startseite"}
            _gaq.push(['_setPageGroup', 1, 'Startseite']);
            {/if}
            {if $pagetype=="Navigationsseite"}
            _gaq.push(['_setPageGroup', 1, 'Directory']);
            {/if}
            {if $pagetype=="Itemseite"}
            _gaq.push(['_setPageGroup', 1, 'Artikeldetailseite']);
            {/if}
            {if $pagetype=="Hersteller"}
            _gaq.push(['_setPageGroup', 1, 'Herstellerdetailseite']);
            {/if}
            {if $smarty.get.basket==true || $smarty.get.buy==true}
            _gaq.push(['_setPageGroup', 1, 'Bestellprozess']);
            {/if}
            {if isset($smarty.get.id) || isset($smarty.get.aliascms)}
            _gaq.push(['_setPageGroup', 1, 'Infocontent']);
            {/if}
            {if $ini.google.analytics_ecommerce == 1 && $smarty.session.SHOP.buy.step == 3}
                _gaq.push(['_addTrans',
                    '{$smarty.session.SHOP.bestellId|default:$bestellId}',                                                                       // Bestellnummer
                    '{$ini.google.shopname}',                                                                          // Shopname
                    '{$smarty.session.SHOP.SUMME}',          // Gesamtbetrag
                    '{$smarty.session.SHOP.SUMME*0.19}',                        // Steuern
                    '{$versandInfo.preis|money_format|replace:"EUR":""}',                                 // Versandkosten
                    '{$smarty.session.SHOP.buy.Persdata.liefer_Ort}',                                     // Stadt
                    '',                                                                                   // Bundesland
                    '{$smarty.session.SHOP.buy.Persdata.liefer_Land_Name}'                                // Land
                  ]);

                  {if $ini.google.analytics_ecommerce_artikel == 1}
                    {foreach $basketContent.items as $index => $data}
                    _gaq.push(['_addItem',
                        '{{$smarty.session.SHOP.bestellId|default:$bestellId}}',            // Bestellnummer
                        '{$data.ID}',              // Artikelnummer
                        '{$data.kurzbezeichnung}', // Artikelname
                        '',                        // Kategorie
                        '{$data.preis1}',          // Einzelpreis
                        '{$data.Menge}'            // bestelle Menge
                    ]);
                    {/foreach}
                  {/if}
                  _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers
            {/if}

            (function() {
                    let ga = document.createElement('script'); ga.type = 'text/javascript';
                    ga.async = true;
                    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                    let s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                })();
        </script>
        {/if}

        {* google kundenrezension *}
        {*if $ini.google.kundenrezension_aktiv==1 && isset($ini.google.merchant_id) && isset($bestellId) && isset($smarty.session.SHOP.buy.Persdata.email)*}
        {assign var="showGoogleKundenrezension" value=1}
        {if $zahlungsformular && $versandInfo.versandart=="finanzierung"}
            {assign var="showGoogleKundenrezension" value=0}
        {/if}

        {if $ini.google.kundenrezension_aktiv==1 && $showGoogleKundenrezension==1}
        <script src="https://apis.google.com/js/platform.js?onload=renderOptIn" async defer></script>
        <script type="text/plain" data-usercentrics="Google Kundenrezensionen">

            function ISODateString(d) {
                function pad(n) { return n<10 ? '0'+n : n }
                return d.getUTCFullYear()+'-'
                + pad(d.getUTCMonth()+1)+'-'
                + pad(d.getUTCDate())
            }
            window.renderOptIn = function() {
                // estimated_delivery_date
                let edd = new Date();
                let addDays = {$ini.google.estimated_delivery_date};
                edd.setDate(edd.getDate() + addDays);
                edd_formatted = ISODateString(edd);

                {if $smarty.session.SHOP.buy.Persdata.email && $bestellId}
                    window.gapi.load('surveyoptin', function() {
                        window.gapi.surveyoptin.render( {
                            "merchant_id": {$ini.google.merchant_id},
                            "order_id": "{$bestellId}",
                            "email": "{$smarty.session.SHOP.buy.Persdata.email}",
                            "delivery_country": "DE",
                            "estimated_delivery_date":edd_formatted,
                        });
                    });
                {/if}
            }
        </script>
        {/if}
        {if isset($ini.google.merchant_id) && $ini.google.kundenrezension_aktiv==1}
        <script src="https://apis.google.com/js/platform.js?onload=renderBadge" async defer></script>
        <script>
          window.renderBadge = function() {
            let ratingBadgeContainer = document.createElement("div");
            document.body.appendChild(ratingBadgeContainer);
            window.gapi.load('ratingbadge', function() {
              window.gapi.ratingbadge.render(ratingBadgeContainer, { "merchant_id": {$ini.google.merchant_id} } );
            });
          }
        </script>
        <style>
        #___ratingbadge_0 {
            bottom:0!important;
            right:0!important;
        }
        @media only screen and (max-width:768px) {
            #___ratingbadge_0 {
                display:none!important;
            }
        }
        </style>
        {/if}
        {* /google kundenrezension *}

        {if $ini.facebook.pixel_aktiv==1 && isset($ini.facebook.id)}
        <!-- Facebook Pixel Code -->
        <script>
          !function(f,b,e,v,n,t,s) {
            if(f.fbq)return;n=f.fbq=function() { n.callMethod?
          n.callMethod.apply(n,arguments):n.queue.push(arguments) };
          if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
          n.queue=[];t=b.createElement(e);t.async=!0;
          t.src=v;s=b.getElementsByTagName(e)[0];
          s.parentNode.insertBefore(t,s) } (window, document,'script',
          'https://connect.facebook.net/en_US/fbevents.js');
          fbq('init', '{$ini.facebook.id}');
          fbq('track', 'PageView');
        </script>
        <noscript><img height="1" width="1" style="display:none"
          src="https://www.facebook.com/tr?id={$ini.facebook.id}&ev=PageView&noscript=1"
        /></noscript>
        <!-- End Facebook Pixel Code -->
        {/if}

{*
<!-- TrustBox script -->
<script type="text/javascript" src="//widget.trustpilot.com/bootstrap/v5/tp.widget.bootstrap.min.js" async></script>
<!-- End Trustbox script -->
*}

    </head>

    <body class="normal" onload="{$onload}">
        <a name="top"></a>

        {include file="header.tpl"}

        <div id="maincontent" role="main">

            {if $pagetype == "Startseite"}
                {*if $file=="aktion.tpl"*}
                    {include file="aktion.tpl" kat="Startseite"}
                {*/if*}
            {/if}



            <section class="root">
                <div id="container-content">
                    {include file="center.tpl"}
                </div>
            </section>



            {* Billiger gesehen ? *}
            {if is_numeric($smarty.get.item) && $ini.modules.preisanfrage==1}
                {include file="billiger_gesehen.tpl"}
            {/if}

            <footer class="footer">
                {include file="bottomcontent.tpl"}
                {include file="footer.tpl"}
            </footer>
        </div>

        {if $ini.modules.reiter=="jquery" && ($smarty.get.item || $smarty.get.navigation)}
        <script type="text/javascript">
            $(function(){
                $('#reiter').tabs();
            });
        </script>
        {/if}

        <script type="text/javascript" src="/JavaScript/changeImage.js"></script>

        <script>
            $(function(){
                let w = $(window).width();
                $('input:submit, input:button, input:reset').button();
                {if $ini.amazon.aktiv ==1}
                    $('#place_order').attr("disabled","disabled");
                    if($('#agb').prop("checked")==true)
                    {
                        $('#place_order').removeAttr("disabled");
                    }
                    $('#agb').click(toggle_place);
                    function toggle_place()
                    {
                        if($(this).prop("checked")==true)
                        {
                            $('#place_order').removeAttr("disabled");
                        }
                        else
                        {
                            $('#place_order').attr("disabled","disabled");
                        }
                    }
                    $('#place_order').css("cursor","pointer").click(place_order);
                    function place_order()
                    {
                        $('#erg').html('<div style="margin-top:50%;margin-left:50%"><img src="/images/webelemente/loading.gif"></div>')
                        {if $smarty.get.purchaseContractId}
                        $('#erg').load("/completeAmazonOrder.php",
                        {
                            a_id:'{$smarty.get.purchaseContractId}',
                            Bemerkung: $("#Bemerkung").val()
                        },function(html)
                        {
                            $('#amazon').hide();
                        });
                        {else}
                        $('#erg').load("/completeAmazonOrder.php",
                        {
                            a_id:'{$smarty.get.access_token}',
                            Bemerkung: $("#Bemerkung").val(),
                            sellernote: $('#sellernote').val()
                        },function(html)
                        {
                            $('#amazon').hide();
                        });
                        {/if}
                    }
                {/if}
                {if $shopPosition[2].dirID}
                    $('#{$shopPosition[2].dirID}').show();
                {/if}


                //10.01.13 - MK: Header Menü Funktion zum ein-/ausblenden der unterebene
                let timeout;
                /**
                    $('.warenkorb').mouseenter(function(){
                        timeout = setTimeout(function() {
                         $('.warenkorb_menu').show();
                        },400);
                    });
                    $('.warenkorb_menu').mouseenter(function(){
                       clearTimeout(timeout);
                       $('.warenkorb_menu').show();
                    });
                    $('.warenkorb_menu').mouseleave(function(){
                        clearTimeout(timeout);
                       timeout = setTimeout(function() {
                       $('.warenkorb_menu').hide();
                       },400);
                    });
                    $('.warenkorb').mouseleave(function(){
                        clearTimeout(timeout);
                       $('.warenkorb_menu').hide();
                    });
                **/
                $('.konto').mouseenter(function(){
                    timeout = setTimeout(function() {
                     $('.konto_menu').show();
                    },400);

                });
                $('.konto_menu').mouseenter(function(){
                    clearTimeout(timeout);
                   $('.konto_menu').show();
                });
                $('.konto_menu').mouseleave(function(){
                    clearTimeout(timeout);
                   timeout = setTimeout(function() {
                    $('.konto_menu').hide();
                   },400);
                });
                $('.konto').mouseleave(function(){
                    clearTimeout(timeout);
                   $('.konto_menu').hide();
                });
                $('.service').mouseenter(function(){
                    timeout = setTimeout(function() {
                     $('.service_menu').show();
                    },400);

                });
                $('.service_menu').mouseenter(function(){
                    clearTimeout(timeout);
                   $('.service_menu').show();
                });
                $('.service_menu').mouseleave(function(){
                    clearTimeout(timeout);
                   timeout = setTimeout(function() {
                    $('.service_menu').hide();
                   },400);
                });
                $('.service').mouseleave(function(){
                    clearTimeout(timeout);
                   $('.service_menu').hide();
                });


                $('.lastVisit').mouseenter(function(){
                    let item = $(this);
                    timeout = setTimeout(function() {
                        let id = $(item).attr("id").split("a_");
                        $('#b_'+id[1]).show();
                    },400);
                });

                $('.lastVisit').mouseleave(function(){
                    clearTimeout(timeout);
                    let item = $(this);
                    let id = $(item).attr("id").split("a_");
                    $('#b_'+id[1]).hide();
                });

                $('.lastVisitItemZoom').mouseleave(function(){
                    clearTimeout(timeout);
                    let id = $(this).attr("id")
                    $('#'+id).hide();
                });



            });
        </script>

        {if $smarty.get.basket==true || $smarty.get.buy==true}
        <script type="text/javascript">
            $(function() {
                $( "#loading" ).dialog({
                    modal: true,
                    autoOpen: false,
                    draggable: false,
                    resizable: false,
                    closeOnEscape: false,
                    width:220,
                    height:220,
                    modal: true,
                    show: { effect: "fade", duration: 1800 },
                });
                $(".ui-dialog-titlebar").hide();
                $( ".loading_dlg" ).click(function() {
                    $( "#loading" ).dialog( "open" );
                    $(".ui-dialog-titlebar").hide();
                    return true;
                });





            });
        </script>
        {/if}



        {if $smarty.get.buy!=true && $ini.modules.finder==1}
        <script>
        /* START motorfinder */

        $(document).ready(function(){

            $(".filter_elem_range").mouseup(motorfinderForm);
            $(".filter_elem_range").keyup(motorfinderForm);
            $(".motorfinder_form input").change(motorfinderForm);
            $(".filter_elem_select select").change(motorfinderForm);
            $(".motorfinder_submit").button().click(motorfinderForm);
            $('.kill_filter').button().click(kill_filter);

            function kill_filter()
            {
                document.location.href="?kill_filter=true";
            }

            function motorfinderForm() {
                $('.mf_dialog').html("<img src='/images/webelemente/loading.gif' /><br> Bitte warten...");
                //$('.mf_dialog').show();
                let formValues = $(this).closest('form').serialize();
                //Löscht den div in dem das item dargestellt wird, damit kein Fehler des jqzoom auftritt
                $('.zoomContainer').remove();

                $('.rightcontent').load("/module/motorfinder.php",formValues,function(){
                    $('.motorfinder').hide();
                });
            }

            // searchButton darf nicht von jqueryUI manipuliert werden
            $('#searchSubmit').removeAttr('class');


        });

        {if $smarty.get.mode=="open-motorfinder"}
            $('.mf_main').show();
        {/if}




        </script>
        {/if}

        {if $ini.dhl.plzFinder==1}

        <script type="text/javascript" src="/JavaScript/checkKurier.js"></script>
        <script>
            $(function(){
                $('#kurier_active').click(function()
                {
                    update_versand();
                });
                if ($('#plz2').val())
                {
                    $('#plz2').change();
                }
                else
                {
                    if($('#plz').val())
                    {
                        $('#plz').change();
                    }
                }
            })
        </script>
        {/if}

        <div id="session"></div>
        <div id="postfinder_dlg" title="Packstationen / Postfilialen suchen"></div>

        {if $ini.trustedShops.shop_id}
        <script type="text/javascript">
          (function () {
            let _tsid = '{$ini.trustedShops.shop_id}';
            let _tsConfig = {
              'yOffset': '0', /* offset from page bottom */
              'variant': 'reviews', /* text, default, small, reviews, custom, custom_reviews */
              'customElementId': '', /* required for variants custom and custom_reviews */
              'trustcardDirection': '', /* for custom variants: topRight, topLeft, bottomRight, bottomLeft */
              'customBadgeWidth': '', /* for custom variants: 40 - 90 (in pixels) */
              'customBadgeHeight': '', /* for custom variants: 40 - 90 (in pixels) */
              'disableResponsive': 'false', /* deactivate responsive behaviour */
              'disableTrustbadge': 'false', /* deactivate trustbadge */
              'trustCardTrigger': 'mouseenter' /* set to 'click' if you want the trustcard to be opened on click instead */
            };
            let _ts = document.createElement('script');
            _ts.type = 'text/javascript';
            //_ts.charset = 'utf-8';
            _ts.async = true;
            _ts.src = '//widgets.trustedshops.com/js/' + _tsid + '.js';
            let __ts = document.getElementsByTagName('script')[0];
            __ts.parentNode.insertBefore(_ts, __ts);
          })();
        </script>
        {/if}
        <a id="topbutton" href="#top"><div class="triangle"></div></a>
        {if $ini.PayPalPlus.aktiv==1 && $ini.PayPalPlus.clientId}
        <script src="https://www.paypal.com/sdk/js?client-id={$ini.PayPalPlus.clientId}&currency=EUR&components=messages"></script>
        {/if}


        <div id="loading" style="text-align:center;">
            <img src="/images/webelemente/loading.gif" /><br />
            Bitte warten....
        </div>


    </body>
</html>
{/nocache}

