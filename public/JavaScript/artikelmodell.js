$(document).ready(function(){

     $('.options').delegate("#modellForm1 select", "change", function(){
        //Ist gesetzt wenn man sich im Artikelstamm befindet 
        if( $("input[name='refreshFilter']").val() == true ){
            refreshFilter("select");
        }else{
            showResult("result");
            showResult("basket");
            showResult("bild");
            showResult("beschreibungReload");
        }
     });
     $('.options').change(function(){
        refreshFilter("select");
     });
     $('.options').delegate( '#modellForm1 #resetForm', "click", function(){
        refreshFilter("reset");
     });
     
     $('.subdir_sort').delegate("#modellForm1 select, #modellForm1 input", "change", function(){
        var aid = $(this).find('option:selected').text();
        $("#loading").dialog("open");
        refreshSubdirFilterFilter("select",aid);
        showSubdirFilterResult("result");
        setTimeout(function () {
            $('#loading').dialog('close');
         }, 100);
     });
     $('.subdir_sort').delegate( '#modellForm1 .resetbutton', "click", function(e){
        location.reload(); 
     });
     
      
    
     function showSubdirFilterResult(mode)
     {
        daten=$('#modellForm1').serializeArray();
        $.ajax({
            type: "POST",
            url : "/module/filter_auspraegungen.php?mode="+mode,
            data: daten,
            async: false,  
            success: function(html){
            
                if(mode == "result"){
                    $(".pagination_container").css("display", "none");
                
                    $('.subdir_artikel').html(html);
                    $(".subdir_artikel").css("background-color", "transparent" );
                    $(".loader").hide();
                    $(".pagination_seite").css("display", "none");
                     $(".pagination_artikel").css("display", "none");
                    $(".newsorting").css("display", "block");
                    
                }  
            }  
        })
     }
     
     function refreshSubdirFilterFilter(mode,aid){

        daten=$('#modellForm1').serializeArray();
        $.ajax({
            type: "POST",
            url : "/module/updateSearchFilterSubdir.php?mode="+mode + "&aid=" + aid,
            data: daten,
            async: false,
            beforeSend: function(){
                $(".box_2").css("background-color", "transparent" );
                $(".subdir_artikel").css("background-color", "#ccc" );
                $(".loader").show();
            },
            success: function(html){
                $('.optionsReload').html(html);
            }
        })
        return true;  
     }
     
     function showResult(mode)
     {
        var daten=$('#modellForm1').serializeArray();

        $.ajax({
            type: "POST",
            url : "/module/filter_auspraegungen.php?mode="+mode,
            data: daten  
        }).done(function(html){
            if(mode == "result"){
                $('.subdir_artikel').html(html);
            }else if(mode == "bild"){
                $('.itemLeftContainer').html(html); 
                initElevateZoom("inner"); 
            }else if(mode == "beschreibungReload"){
                $('.reiterTabs').html(html); 
            }else{
                $('.basketReload').html(html);
            }    
        })
     }
     
     function refreshFilter(mode){
        
        var daten=$('#modellForm1').serializeArray();
        if(daten.length>0) {
            $.ajax({
                type: "POST",
                url : "/module/updateSearchFilterSubdir.php?mode="+mode,
                data: daten  
            }).done(function(html){
                $('.optionsReload').html(html); 
                
                showResult("beschreibungReload");
                showResult("result");
                showResult("basket");
                showResult("bild"); 
                
            });
        }
     }
     
     
});