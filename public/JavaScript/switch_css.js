$(document).ready(function() {

    // css switcher
    $('.switch_small').bind('click', function(){
        console.log("small: artikel_box");
        // erstmal die container-Klasse umbenennen
        $('.content .artikel_box_100').each(function(index){
           $(this).attr('class','artikel_box'); 
        });
        // noch die Auswahl in der Session speichern
        $('.session').load("/module/setSessionVars.php?switch=small");
    });
    
    $('.switch_big').bind('click', function(){
        console.log("big: artikel_box_100");
        // erstmal die container-Klasse umbenennen
        $('.content .artikel_box').each(function(index){
           $(this).attr('class','artikel_box_100'); 
        });
        // noch die Auswahl in der Session speichern
        $('.session').load("/module/setSessionVars.php?switch=big");
    });
    
});    