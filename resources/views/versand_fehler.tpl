<script>
$(document).ready(function(){
    $('#versand_fehler_dlg').dialog({
        modal:true,
        closeOnEscape:false,
        buttons: [
            {
                text: "Schliessen",
                click: function() {
                    $( this ).dialog( "close" );
                }
            }
        ],
        open: function(event, ui) {
            $('.jetztKaufenButton').hide("slow");
            $(this).parent().children().children('.ui-dialog-titlebar').hide();
            //hide close button.
            $(this).parent().children().children('.ui-dialog-titlebar-close').hide();
        },
        close: function(event,ui) {
                location.href = "/basket.html";
        },
         
    });  
});
</script>

<div id="versand_fehler_dlg">
    <p>
    {$langstrings.buy.versand_fehler|default:"<b>Warnung:</b><br />Durch eine &Auml;nderung der Waren m&uuml;ssen die Versandkosten neu berechnet werden.<br />Sie werden zum Warenkorb weitergeleitet."}
    <br /><br />
    </p>
</div>