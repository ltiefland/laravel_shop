/* topnav */
        $('.navi_level2').mouseenter(function(){
            $("img",this).attr("src","/images/webelemente/navi_arrow_red.png"); 
        });        
        $('.navi_level2').mouseleave(function(){
            $("img",this).attr("src","/images/webelemente/navi_arrow_grey.png"); 
        });        
        
        
/* leftnav */
        
        // level3
        $('.navi_level3').mouseenter(function(){
            if($(this).attr('class').indexOf('nochange')==-1) {
                $(".navi_arrow3",this).attr("src","/images/webelemente/navi_arrow_red.png");                
            } else {
            }
        });        
        $('.navi_level3').mouseleave(function(){
            var lvlDisplay = $(this).next().css("display");
            if(lvlDisplay == "none") {
                $("img",this).attr("src","/images/webelemente/navi_arrow_white.png");
            } else {
                if($(this).attr('class').indexOf('nochange')>0) {
                }else{
                    $(".navi_arrow3",this).attr("src","/images/webelemente/navi_arrow_red_down.png");
                }
            }
        });        


        // level4 aufklappen
        $('.navi_level3').click(function(){
            $(".navi_arrow4").attr("src","/images/webelemente/navi_arrow_white.png");

            var lvlDisplay = $(this).next().css("display");
            var displayID = $(this).next().attr("id");
            
            if(lvlDisplay == "none") {
                $(".navi_arrow3",this).attr("src","/images/webelemente/navi_arrow_red_down.png");
                $("#"+displayID).show();
            } else {
                $(".navi_arrow3",this).attr("src","/images/webelemente/navi_arrow_white.png");
                $("#"+displayID).hide();
            }
        });

        // level4
        $('.navi_level4').mouseenter(function(){
            $(".navi_arrow4",this).attr("src","/images/webelemente/navi_arrow_red.png"); 
        });        
        $('.navi_level4').mouseleave(function(){
            $(".navi_arrow4",this).attr("src","/images/webelemente/navi_arrow_white.png"); 
        });        
