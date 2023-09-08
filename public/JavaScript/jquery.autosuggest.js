function suggest(inputString) {
    $('#suchbegriff').keyup(function(event) {
        if(event.keyCode != 40 && event.keyCode != 38) {
            if($('#suchbegriff').val().length < 1) {
                $('#suchbegriffs_liste').hide();
            } else {
                inputString = $('#suchbegriff').val();
                $.post("/autosuggest/autosuggest.php", {queryString: ""+inputString+""}, function(data) {
                
                    if(data.length > 0) {
                        
                        $('#suggestions').show();
                        $('#suggestionsList').html(data);
                    }
                });
            }
        }
    });
}

function fill(thisValue) {
    thisValue = decodeURIComponent(thisValue);
    $('#suchbegriff').val(thisValue);
    $('#suchbegriff').val(thisValue);
}

function closeBox() {
    $('#suggestions').hide();
}
    

function jump2List(id) {
    
    if($('#suchbegriff').val().length > 0) {
        $('#suchbegriff').keydown(function(event) {
            if(event.keyCode == 40) { 
                $("#suchbegriffs_liste input:first-child").focus();
            }
            if(event.keyCode == 38) { 
                target = "sugg_" + (($('#suchbegriffs_liste').children().length / 2) -1);
                $('#'+target).focus();
            }
        });    
    }
}

function jump(target,id,countList) {
    $(id).keydown(function(event) {
        cutId = target.substr(5);
        
        // Enter-Taste
        if(event.keyCode == 13) {
            fill(this.value);
            $('#suchbegriff').focus();
        }
        
        // Pfeiltaste nach unten        
        if(event.keyCode == 40) {
            if(cutId >= countList) {
                target = "sugg_" + 0;
            }
            $('#'+target).focus();
        }
        
        // Pfeiltaste nach oben
        if(event.keyCode == 38) {
            if(cutId > 1) {
                target = "sugg_" + (cutId - 2);
                $('#'+target).focus();
            }
            if(cutId == 1) {
                $('#suchbegriff').focus();
            }
        }
    });
}
 

function cssHover(id) {
    
    $(id).focus(function(event) {
        $(".autocomplete_li").css("background-color","#fff");
        $(".autocomplete_li").css("color","#666");
        $(id).css("background-color","#666");
        $(id).css("color","#fff");
    });
    $(id).mouseover(function(event) {
        $(".autocomplete_li").css("background-color","#fff");
        $(".autocomplete_li").css("color","#666");
        $(id).css("background-color","#666");        
        $(id).css("color","#fff");
    });
}