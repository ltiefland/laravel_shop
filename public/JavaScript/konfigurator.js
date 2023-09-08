/* Funktionen für den Konfigurator */
$(document).ready(function(){
    $('.select_components').change(function(){
        var expl = $(this).val().split("#");
        var id = expl[0];
        var newPreis = parseFloat( expl[1] );
        var artstammID = expl[2];

        // den zuvor gewählten Preis holen (input hidden)
        var selectedPreis = parseFloat( $('#selectedPreis_'+artstammID).val() );
        
        // den aktuellen Preis holen
        var currentPreis = parseFloat( $('#current_preis').html() );
        
        // den gewählten Preis in den Zwischenspeicher laden
        $('#selectedPreis_'+artstammID).val(newPreis);
        
        // den neuen Preis berechnen
        // evtl. vorher ausgewählten preis abziehen
        var tempPreis = parseFloat( currentPreis - selectedPreis );
        var newPreis = parseFloat(tempPreis + newPreis);
        
        $('#current_preis').html(newPreis);
        $('#itemPreis').html(newPreis.money_format() + " &euro;");

        $('.img_stamm_'+artstammID).hide();
        $('.fallback_img_stamm_'+artstammID).hide();
        
        $('#img_'+id).show();
        $('.select_infotext_'+artstammID).hide();
        $('#select_infotext_'+id).show();
        var varname = "select_"+artstammID;
        var varvalue = id;
        
        $.get('/module/setSessionVars.php?'+varname+'='+varvalue);        
        if(id==0) {
            $('.select_infotext_'+artstammID).hide();
            $('.fallback_img_stamm_'+artstammID).show();
        }
    });
});