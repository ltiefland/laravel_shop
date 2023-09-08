/**
  *    Diese Datei ändert das 3-Spalten-Template so, dass alle drei Spalten die gleiche Höhe haben,
  *    was Aufgrund des Hintergrunds sein muss.
**/
$(function() {
    var contentLeftHeight         = $('#content-left div.middle').height() + 25;
    var contentRightHeight        = $('#content-right').height();
    var contentCenterHeight     = $('#content').height();
    
    var highestHeight = contentLeftHeight;
    
    if ( contentRightHeight > highestHeight ) {
        highestHeight = contentRightHeight;
    }
    
    if ( contentCenterHeight > highestHeight ) {
        highestHeight = contentCenterHeight;
    }
    
    highestHeight = highestHeight + 30;
    
    /** ANPASUNGEN: start **/
    contentCenterHeight = highestHeight - 3;
    contentLeftHeight = highestHeight - 1;
    /** ANPASUNGEN: ende  **/
    
    //$('#content-left').height(contentLeftHeight);
    //$('#content-right').height(highestHeight);
    //$('#content').height(contentCenterHeight);
});