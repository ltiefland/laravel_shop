$(function(){

    update_versand($(this));

    $('.input1').keyup(function(e) {
        if(e.keyCode == 13) {
            $("form#login").submit();
            return false;
        }
    });

    $('#Lieferadresse_t').click(function(){
        $('#abholung').hide();
        $('#Lieferadresse').show();
        $('#packstation').hide();
        $('.dhl').attr("disabled",true);
        $('.adresse').removeAttr("disabled");
    });
    $('#Lieferadresse_f').click(function(){
        $('#abholung').hide();
        $('#Lieferadresse').hide();
        $('#packstation').hide();
        $('.dhl').attr("disabled",true);
        $('.adresse').attr("disabled",true);
    });
    $('#Lieferadresse_p').click(function(){
        $('#abholung').hide();
        $('#packstation').show();
        $('#Lieferadresse').hide();
        $('.dhl').removeAttr("disabled");
        $('.adresse').attr("disabled",true);
    });
    $('#Lieferadresse_a').click(function(){
        $('#abholung').show();
        $('#packstation').hide();
        $('#Lieferadresse').hide();
        $('.dhl').removeAttr("disabled");
        $('.adresse').attr("disabled",true);
    });

    land = $('#Land').val();
    if (land != 1) {
        $('#ustidnr_text').show();
        $('#ustidnr_input').show();
    } else {
        $('#ustidnr_text').hide();
        $('#ustidnr_input').hide();
    }

    $.get("/checkLand.php?land="+land,function(erg)
    {
        if(erg==false)
        {
            $('#row_Lieferadresse_f').hide();
            if ($('#Lieferadresse_f').prop("checked")==true)
            {
                $('#Lieferadresse_t').attr("checked",true).click();
            }
        }
        else
        {
            $('#row_Lieferadresse_f').show();
        }
    });
    if (land != 1) {
        $('#ustidnr_text').show();
        $('#ustidnr_input').show();
    } else {
        $('#ustidnr_text').hide();
        $('#ustidnr_input').hide();
    }

    $('#Land').change(function() {
        land = $('#Land').val();
        $.get("/checkLand.php?land="+land,function(erg)
        {
            if(erg==false)
            {
                $('#row_Lieferadresse_f').hide();
                $('#Lieferadresse_t').attr("checked",true).click();
            }
            else
            {
                $('#row_Lieferadresse_f').show();
            }
        });
        if (land != 1) {
            $('#ustidnr_text').show();
            $('#ustidnr_input').show();
        } else {
            $('#ustidnr_text').hide();
            $('#ustidnr_input').hide();
        }

        if($(".lieferadresseChangeRadio:checked").val() == "false"){
            c_url="/update_versand?Land="+land+"&liefer=0";
            $('#versand_optionen').load(c_url);
        }
    })
    $("#liefer_Land").change(function(){
        update_versand($(this));
    });

    $(document).delegate(".lieferadresseChangeRadio", "change", function(){

        if( $(this).val() == "false"  ){
            land = $("#Land").val();
            c_url="/source/update_versand?Land="+land+"&liefer=0";
        }else{
            land = $("#liefer_Land").val();
            c_url="/update_versand?Land="+land+"&liefer=1";
        }
        if($('#kurier_active').attr("checked")=="true")
        {
            c_url+="&kurier=1";
        }
        $('#versand_optionen').load(c_url);
    });
});
function update_versand(e)
{

    if( typeof e != "undefined" ){
        if( e.val() != ""){
            land= e.val();
        }
        c_url="/update_versand.php?Land="+land;
        if(e.attr("id")=="liefer_Land")
        {
            c_url+="&liefer=1";
        }
        else
        {
            c_url+="&liefer=0";
        }
    }else{

        c_url="/update_versand.php?";
    }
    if($('#kurier_active').prop("checked")== true )
    {
        c_url+="&kurier=1";
    }
    $('#versand_optionen').load(c_url);
}