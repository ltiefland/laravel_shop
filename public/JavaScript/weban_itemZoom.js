$(document).ready(function(){
    
    // itemBox bei mouseover öffnen
    $('.addonItems').delegate( ".box_addons", "mouseenter", function(event) {
        var addonId = $(this).attr('id');
        var expl = addonId.split('_');
        var id = expl[1];
        var contentOffset = $(".content").offset();
        var parentOffset = $(this).offset(); 
        var itemZoomWidth = $('#'+id).width();
        var itemZoomHeight = $('#'+id).height();
        
        $('.addonItemZoom').hide();
        $('#'+id).css("left", parentOffset.left - contentOffset.left - (itemZoomWidth /2));
        $('#'+id).css("margin-top", 0 - (itemZoomHeight/2));
        $('#'+id).show();
        
        $('#'+id).mouseleave(function(){
            $('#'+id).hide();  
        });
    });
    // und wieder schliessen.. http://www.hazet-freak.de/?item=13694
    
    
    // itemBox bei mouseover öffnen
    $('.addonItems_click').delegate( ".box_addons", "click", function(event) {
        var addonId = $(this).attr('id');
        var expl = addonId.split('_');
        var id = expl[1];
        var contentOffset = $(".content .inner").offset();
        var parentOffset = $(this).offset(); 
        var itemZoomWidth = $('#'+id).width();
        var itemZoomHeight = $('#'+id).height();
        
        $('.addonItemZoom').hide();
        $('#'+id).css("left", parentOffset.left - contentOffset.left - (itemZoomWidth /2));
        $('#'+id).css("margin-top", 0 - (itemZoomHeight/2));
        $('#'+id).show();
        
        $('#'+id).mouseleave(function(){
            $('#'+id).hide();  
        });
    });
   
    $('.addon_items_close').click(function(){
        $('.addonItemZoom').hide();
    });
    
});