$(document).ready(function() {
    var favorite = function(){
        var data = [];
        var itemID = $(this).attr("id");
        itemID = itemID.replace("item_","");
        
        var mode = $(this).attr("class");
        data.push({ name: "itemID", value: itemID });     
        
        mode = mode.split("_");
        if(mode.length < 1) {
            mode = mode[1];
            data.push({ name: "mode", value: mode });
            $("#favoriten").load("/source/module/addFavoriten.php", data, function(){
                var data2 = [];
                data2.push({ name: "mode", value: "basketReload" });
                $("#basket").load("/source/includes/content/basket.php", data2);    
            });
            
        } else {
            mode = mode[0];
            data.push({ name: "mode", value: mode });
            $(this).load("/module/addFavoriten.php", data);
        }
    };
    
    $('.menuFavoriten').click(function(){  
        $("#favoriten").load("/source/module/addFavoriten.php?mode=getFavoriten");
    });
    
    $(document).delegate("div.item_addFavorites", "click", favorite);
    $(document).delegate("div.subdir_addFavorites", "click", favorite);
    $(document).delegate("div.basket_addFavorites", "click", favorite);
    $('div#basket').delegate("td.subdir_addFavorites", "click", favorite);
    $('p').delegate("span.addFavorites", "click", favorite);
});