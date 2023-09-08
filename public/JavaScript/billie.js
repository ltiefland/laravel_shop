//$Id: billie.js 5841 2019-08-07 08:20:14Z tiefland $
$(function(){
    $('#legal_form').change(function()
    {
        lf=$(this).val();
        url="/module/checkLegalForm.php?lf="+lf;
        $.getJSON(url,function(erg){
            $('#regnrRow').hide();
            $('#ustidnr_text').hide();
            $('#ustidnr_input').hide();
            if (erg.ustid_required===1)
            {
                $('#ustidnr_text').show();
                $('#ustidnr_input').show();
            }
            if (erg.regnr_required===1)
            {
                $('#regnrRow').show();
            }
        });
    })
    $('#rowCompany').show();
    $('#rowRechtsform').show();
    $('#legal_form').change();
})
