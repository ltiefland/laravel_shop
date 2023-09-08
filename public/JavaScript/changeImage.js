    function basename(path) {
        console.log(path);
       if(path) {
           return path.split('/').reverse()[0];
       }
    }

    function changeImage(targetID,src,hdl,hrefID) {
        
        //document.getElementById(targetID).src = src;
        //alert();
        //document.getElementById(hrefID).href = hdl;
        $('#'+targetID).attr("src",src);
        $('#'+hrefID).attr("href",hdl);
        
    }
    
    
    // ME: Button hover effekt 
    $('.butt_hover').mouseenter(function(){
        if($(this).attr("src"))
        {
            var button = basename ($(this).attr("src"));
            var button_split = button.split(".");
            button_2 = button_split[0] + "_2." + button_split[1];
            $(this).attr("src","/images/webelemente/" + button_2); 
        }
     });
    $('.butt_hover').mouseleave(function(){
        if($(this).attr("src"))
        {
            var button_path = $(this).attr("src");
            var button_1 = button_path.replace("_2.",".");
            $(this).attr("src",button_1);
        }
     });