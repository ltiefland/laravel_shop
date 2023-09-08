$(document).ready(function(){
    
    $('.topnav_li').mouseover(function(){
        var dirId = parseInt( $(this).attr('id') );
        if($.isNumeric(dirId)) {
            $('.subnav_special').load('/module/subnav.php?dirId='+dirId);
        }
    });
    
    
    $('.subdir_box').mouseenter(function(){
        var classNames = $('.subnav_special').attr('class');
        if(classNames.indexOf('nochange')>0) {
            return true;
        }
        var dirId = parseInt( $(this).attr('id') );
        if($.isNumeric(dirId)) {
            $('.subnav_special').load('/module/subnav.php?dirId='+dirId);
        }
    });

    $('.subdir_box').click(function(){
        var classNames = $('.subnav_special').attr('class');
        if(classNames.indexOf('nochange')>0) {
            var dirId = parseInt( $(this).attr('id') );
            if($.isNumeric(dirId)) {
                $('.subnav_special').load('/module/subnav.php?dirId='+dirId);
            }
        }
    });
    
});