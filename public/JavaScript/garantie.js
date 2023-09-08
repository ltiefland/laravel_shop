$(function()
{
    $('#garantie').click(set_garantie);
    $('.garantie_basket').click(set_garantie_basket)
})

function set_garantie()
{
    val = $('#garantie').attr("checked");
    if (val == "checked")
    {
        $('.hd_warenkorb').load('/module/add_item_to_basket.php', $('#garantie_form').serialize(), function(data)
        {
            // document.location.href="/basket.html";
        });
    }
}

function set_garantie_basket()
{
    f_id_c=this.id;
    f_id=f_id_c.split('_');
    b_id=f_id[2];
    f_id=f_id[1];
    $('.hd_warenkorb').load('/module/add_item_to_basket.php?for='+f_id+"&b_id="+b_id,function(html){
        //$('#'+f_id_c).hide();
        document.location.href="/basket.html";
    });
}