$(function() {
    $('.order_details').hide();
    $('.order_details_button').click(show_details);
    $('.order_list_button').hide().click(hide_details);
});

function show_details() {
    id=this.id;
    id_arr=id.split("_");
    b_nr=id_arr[3];
    $('#order_details_'+b_nr).load("/module/getOrderDetails.php?id="+b_nr,function(){
        $('#order_details_'+b_nr).show();
        $('#'+id).hide();
        $('#order_list_button_'+b_nr).show();
    });
}

function hide_details() {
    id=this.id;
    id_arr=id.split("_");
    b_nr=id_arr[3];
    $('#order_details_'+b_nr).hide(500);
    $(this).hide();
    $('#order_details_button_'+b_nr).show();
}