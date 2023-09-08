$(document).ready(function(){

    $('.open_input_info_nl').click(function(){
         $(this).next().slideToggle("fast");
    });


    $('.optionsA').change(calculate_price_by_options);      
    
    // current year
    if($('#year').length) {
        var year = new Date().getFullYear();
        $('#year').html(year);
    }
    // footer_height
    if($('#footer_height').length) {
        var h = $('.footer').height();
        $('#footer_height').height(h+20);
    }


    $('.disable_google').removeAttr("target");
    $('.disable_google').attr("href","javascript:gaOptout();");
    
    
    $('#post_finder').button({
        icons:{
            primary:"ui-icon-search",
        }
    }).click(post_finder);
    $('#postfinder_dlg').dialog({
        autoOpen:false,
        modal:true,
        resizable:false,
        width:850,
        height:600
    })

  
    
    // MAINNAV
    
    $(".menue").click(function(e){
        e.preventDefault();
        $('body').toggleClass("active-nav");
        $('body').toggleClass("fixed");  
    });
    $(".suche").click(function(e){
        e.preventDefault();
        $('body').toggleClass("active-search");
        if($(".active-search").length > 0) {
            $('.mobile #suchbegriff').focus();   
        }
    });
    $(".topnav .mobile.close").click(function(e){
        e.preventDefault();
        $('body').toggleClass("active-nav");
        $('body').toggleClass("fixed");  
    });
    $("#maincontent,.maincontent").click(function(e){
        if( $("body").hasClass("active-nav") ){
            e.preventDefault();
            $('body').toggleClass("active-nav");
            $('body').toggleClass("fixed");      
        }
    });
    $('.mainnav li a').click(function(e){
        
        e.preventDefault();
        
        $('.mainnav li').removeClass('active');
        var id = $(this).attr('id');
        var href = $(this).attr('href');
        $.ajax({ 
            typ: "GET",
            url:'/module/setSessionVars.php?mainnav='+id, 
            success:function(html){
                location.href = href;
            }
        });
    });
    var subNavClick = false;
    $('.level1').on("touchstart", function (e) {
        if( !subNavClick ){
          'use strict'; //satisfy code inspectors
          var link = $(this); //preselect the link
          
          if ( link.hasClass('hover') && !subNavClick ) {
            $('.level1').removeClass("hover");
            $('.level2').hide();
            $('.level2',this).css('display', 'block');
            return true;
          } else {
            subNavClick = false;
            $('.level1').removeClass("hover");
            $('.level2').hide();
            link.addClass('hover');
            $('.level2',this).css('display', 'block');

            return false; //extra, and to make sure the function has consistent return points
          }
        }
    });
    $(".level2").on("touchstart", function (e) {
        subNavClick = true;    
    });

    // topnav Aufklapper Hintergrundbild (Linien)
    /*
    $('.topnav li').mouseenter(function() {
        windowWidth = $(window).width();  
        if( windowWidth > 850){
            var expl = $(this).attr('id').split("_");
            var id = expl[1];
            var cols = 0;
            $('#sub_'+id+' .subdir_col').each(function(){
                if( $(this).children().length > 0 ) {
                    cols++;
                }
            }); 
            $('#sub_' + id + ' .subnav_padding').css("background","url(/images/webelemente/topnav_bg_" + cols + ".png) repeat-y");
        }
    });
    */  
    
    // ME: typo3 tabellen dürfen keine Styles haben
    $('.typo3content .contenttable td').each(function(){
        $(this).removeAttr('style');
    });
    
    
    
});


   


function initSlider( classname, windowWidth, slides, autoplay, infiniteLoop, forceWidth, pager ){
    
    if(!pager) {
        pager = false;
    }
    
    if(infiniteLoop=="undefined") {
        var infiniteLoop = false;
    }

    if(autoplay=="undefined"){
        var autoplay = false;    
    }
    
    if(!slides) {
        var slides = 3;
    }
    var slideWidth = windowWidth / slides;
    
    if(slides == 1){
        slides = 0;
    }
    
    if(forceWidth==true) {
            slideWidth = windowWidth/slides;
            slides = slides;
    }else{
        if( windowWidth > 425 && windowWidth < 800 ) {
            slideWidth = windowWidth;
            if( slides > 1 ){
                slides = 1;  
            }  
        }else if( windowWidth < 420 ){
            slideWidth = windowWidth;
            slides = 1;
        }
    }
    
    classname = $("."+classname).bxSlider({
        infiniteLoop: infiniteLoop,
        autoHover: true,
        adaptiveHeight: false,
        responsive: true,
        minSlides: 1,
        maxSlides: slides,
        slideWidth: slideWidth, 
        slideMargin: (slides > 0) ? 10: 0,           
        pager: pager,
        controls: (slides > 0)? true : false,
        auto: autoplay   
    });
    return classname;
}



function initSliderVert( classname, height, slides, autoplay, infiniteLoop, forceWidth ){
    
    if(infiniteLoop=="undefined") {
        var infiniteLoop = false;
    }

    if(autoplay=="undefined"){
        var autoplay = false;    
    }
    
    if(!slides) {
        var slides = 3;
    }
    var slideHeight = height / slides;
    
    if(slides == 1){
        slides = 0;
    }
    
    /*if(forceWidth==true) {
    }else{
        if( windowWidth < 800 && windowWidth > 400 ){
            slideWidth = windowWidth / 2;
            if( slides > 1 ){
                slides = 1;  
            }  
        }else if( windowWidth < 400 ){
            slideWidth = windowWidth;
            slides = 1;
        }
    }*/
    
    classname = $("."+classname).bxSlider({
        mode:"vertical",
        infiniteLoop: infiniteLoop,
        autoHover: true,
        adaptiveHeight: false,
        responsive: true,
        minSlides: 1,
        maxSlides: slides,
        slideHeight: slideHeight, 
        slideMargin: (slides > 0) ? 10: 0,           
        pager: false,
        controls: (slides > 0)? true : false,
        auto: autoplay   
    });
    return classname;
}

function reloadSlider( classname, windowWidth, slides, autoplay ){
    
    if(!autoplay){
        var autoplay = false;    
    }
    
    if(!slides) {
        var slides = 3;   
    }
        
    var slideWidth = $(this).width() / slides;
    
    if(slides == 1){
        slides = 0;
    }
            
    var slideWidth = $(this).width() / slides;
    if( windowWidth < 800 && windowWidth > 350 ){
        slideWidth = $(this).width() / 2;
        if( slides > 1 ){
            slides = 2;  
        }    
    }else if( windowWidth < 350 ){
        slideWidth = $(this).width();
        slides = 1
    }

     $("."+classname).reloadSlider({
        autoHover: true,
        adaptiveHeight: true,
        responsive: true,
        minSlides: slides,
        maxSlides: slides,
        slideWidth: slideWidth, 
        slideMargin: (slides > 0) ? 10: 0,           
        pager: false,
        controls: (slides > 0)? true : false,
        auto: autoplay  
    })
    
    return classname;
}

function initElevateZoom( zoomType, scrollZoom, clickZoom, img_zoom ) {
    
    if( img_zoom == "" || img_zoom == undefined){
       var img_zoom = "img_zoom";
    }

    var image = $('#gallery a');
    if( zoomType == "" || zoomType == undefined){
       var zoomType = "window";
    }
    if( scrollZoom == "" || scrollZoom == undefined){
       var scrollZoom = false;
    }
    
    if( clickZoom == "" || clickZoom == undefined){
       var clickZoom = true;
    }
    
    if(zoomType=="inner" && scrollZoom) {
        scrollZoom = true;
    }
    var pointer = '';
    if(clickZoom==true) {
        pointer = 'pointer';
    }

    var zoomConfig = {
        lensShape: 'round',
        gallery:'gallery',
        responsive: true,
        galleryActiveClass: 'active',
        zoomType: zoomType,
        easing: true, 
        borderSize: 1,
        cursor: pointer,
        borderColor: '#666',
        zoomWindowWidth:700,
        zoomWindowHeight:700,
        zoomWindowOffetx:5,
        zoomWindowOffety:0,
        scrollZoom: scrollZoom,
            
    };
    var zoomImage = $('#' + img_zoom);

    zoomImage.elevateZoom(zoomConfig);//initialise zoom

    if(clickZoom==true){
        image.on('click', function(){
            // Remove old instance od EZ
            $('.zoomContainer').remove();
            zoomImage.removeData('elevateZoom');
            // Update source for images
            zoomImage.attr('src', $(this).data('image'));
            zoomImage.data('zoom-image', $(this).data('zoom-image'));
            // Reinitialize EZ
            zoomImage.elevateZoom(zoomConfig);
            
        });
        
        zoomImage.on("click", function(e) {  
            var ez = $('#' + img_zoom).data('elevateZoom');
            var g = ez.getGalleryList();
            var data = [];
            //Wenn g == "", dann gibt es nur ein Bild. Dieses soll auch in der Fancybox rauskommen
            if(g == ""){
               data[0] = { href : $(this).data('zoom-image'), title : '' };  
               g = data;
            }
            // ME: remove clones
            validhref = [];
            imgs = [];
            if(g) {
                $.each(g,function(key,value){
                    if(value) {
                        if(value.href.length>0) {
                            if(validhref.indexOf(value.href)===-1) {
                                validhref.push(value.href);    
                                imgs.push(value);
                            }
                        }
                    }
                });            
            }
            $.fancybox.open(imgs,{
                'openEffect'    :   'fade',
                'closeEffect'   :   'fade',
                'nextEffect'    :   'fade',
                'openSpeed'     :   600, 
                'closeSpeed'    :   200,
                'closeBtn'      :   true,
                'arrows'        :   true,
                'title'         :   '',
                helpers : {
                    buttons : {}
                }
            });        
        });
    } // end if clickZoom
}

function post_finder()
{
    daten={
        plz:$('#plz').val(),
        ort:$('#ort').val(),
        strasse:$('#strasse').val(),
        hausnummer:$('#hausnummer').val()
    }
    $('#postfinder_dlg').load("/module/standortsuche.php",daten,function(){
        $('#postfinder_dlg').dialog("open");
    });
}


    // ME: optionen mit aufschlag
    function calculate_price_by_options() {
        let aufschlagSum = 0;
        $('.optionsA').each(function(i){
            
            let preis = $('.item_preis').attr('content');
            aufschlag = $(this).children('option:selected').data('aufschlag');
            
            if(aufschlag > 0) {
                aufschlagSum = eval(aufschlagSum + eval(aufschlag));
            }
            preis = eval(eval(preis) + eval(aufschlagSum));
            $('.item_preis').html(preis.money_format());
        });
    }
        

