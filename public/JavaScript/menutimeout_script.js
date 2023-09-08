$(document).ready(function () {

    function einblenden(){
        var topLvl = String( $(this).attr("id") );
        var topExpl = topLvl.split("_");
        var topId = topExpl[1];
        $('#li_'+topId).addClass('highlight');
        
        windowWidth = $(window).width();  
        if( windowWidth > 850){
            $('.subnav').hide();
            $('#sub_'+topId).show();
            $(".topnav_ul li").removeClass('highlight');
            
        }
    }
    
    function ausblenden(){
        $('.subnav').hide();
        $(".topnav_ul li").removeClass('highlight');
    }
    function voidF() {
        
    }
    $(".topnav_ul li").hoverIntent({
        over: einblenden,
        out: voidF,
    });

    $('.subnav').hoverIntent({
        over: einblenden,
        out: ausblenden,
    });
    $('.header').hoverIntent({
        over: ausblenden,
        out: voidF,
    });
    $('.mainnav').hoverIntent({
        over: ausblenden,
        out: voidF,
    });


    $('.subnav').mouseleave(function(){
        $(this).hide();
    });

    $('.topnav_ul').mouseleave(function(e){
        e = e || window.e;
        xpos = e.pageX;
        
    
        var w = $(this).offset().left + $(this).width();
        
        if ( ( xpos < $(this).offset().left || xpos > w ) && $(".subnav").is(":visible")) {
            $(".subnav").hoverIntent({
                over: voidF,
                out: ausblenden,
            }).done(function(){
                $("li", this).removeClass('highlight');
            });
            
        } else if(!$(".subnav").is(":visible") ) {
            $("li", this).removeClass('highlight');
        }
        
    });
        
    

});
