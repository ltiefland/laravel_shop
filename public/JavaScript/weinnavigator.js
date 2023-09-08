$(function() {
    $('#land').change(getRegion);
    $('#region').change(getItems);
    $('#farbe').change(getItems);
    $('#rebsorte').change(getItems);
    
    function getItems()
    {
        r_id=$('#region').val();
        f_id=$('#farbe').val();
        s_id=$('#rebsorte').val()
        $('#ergebnis').html('<div class="box_2"><div class="box_middle"><br><br><center>Loading ... <img src="/images/webelemente/loading.gif"></center><br><br></div></div>');
        $('#ergebnis').load("/module/getItems.php?land="+r_id+"&farbe="+f_id+"&rebsorte="+s_id);
    }
    function getRegion()
    {
        l_id=$('#land').val();
        $('#region').load("/module/getRegion.php?land="+l_id,function(){
            getItems();
        });
    }
});
