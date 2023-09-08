$(function() {
function checkSearch() {
    
    var sucheingabe = $('#suchbegriff').val();
    if ( sucheingabe.length == 0 || sucheingabe == 'Suchen' ) {
        alert('Bitte geben Sie einen Suchbegriff ein!');
        return false;
    } else {
        return true;    
    }
}
    $('#suchbegriff').blur(function() {
        var sucheingabe = $('#suchbegriff').val();
        if ( sucheingabe.length == 0   ) {
            $('#suchbegriff').val('Suchen');    
        }
    });    
    $('#suchbegriff').focus(function() {
        var sucheingabe = $('#suchbegriff').val();
        if ( sucheingabe == 'Suchen' ) {
            $('#suchbegriff').val('');
        }
    });
    $('#suchbegriff').blur();
    
});