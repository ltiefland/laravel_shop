// ----------------------------- merken.js -----------------------------
$(function()
{
    $('#merken').click(function(){
        $('<div id="message">').dialog({
            modal:true,
            zIndex: 100,
            open: function() {
                $.ajax({
                    type : "GET",
                    url  : '/module/merkzettel.php?mode=save'
                }).done(function(html){
                    $("#message").html(html);                        
                })
                
            },
            close: function() {
                $(this).dialog('destroy').remove(); 
                document.location.href="/basket.html";  
            },
            buttons:{
                'Schließen':function(){
                    $(this).dialog('destroy').remove(); 
                    document.location.href="/basket.html";
                }
            },
            width: 200,
            resizable: false,
            title: 'Warenkorb speichern'             
        });
    });
});


// ----------------------------- empfehlen.js -----------------------------

function updateTips(t)
{
    $("#message").html(t).addClass('ui-state-error');
}

function send_email()
{
    var absender_name = $('#absender_name').val();
    var absender_email = $('#absender_email').val();
    var name_e = $('#name_e').val();
    var email_e = $('#email_e').val();
    var text = $('#text').val();
    var code = $('#code').val();
    url = "/module/reiter/send_email.php";
    $("#message").text("");
    if (absender_name == "")
    {
        updateTips("Bitte geben Sie Ihren Namen ein!");
    }
    else
    {
        if (absender_email == "")
        {
            
            updateTips("Bitte geben Sie Ihre E-Mail Adresse ein!");
            return false;
        } else {
            // Email prüfen
            validateEmail(absender_email,'Bitte geben Sie eine gültige Absender-E-Mailadresse ein.');
        }
        if (name_e == "")
        {
            updateTips("Bitte geben Sie den Namen des Empfängers ein!");
            return false;
        }
        if (email_e == "")
        {
            updateTips("Bitte geben Sie die E-Mail Adresse des Empfängers ein!");
            return false;
        }else{
            // Email prüfen
            validateEmail(email_e,'Bitte geben Sie eine gültige Empfänger-E-Mailadresse ein.');
            
        }
        if (code == "")
        {
            updateTips("Bitte geben Sie den Sicherheitscode ein!");
            return false;
        }
        $('#message').load(url, $('#form_empfehlung').serializeArray()).addClass('ui-state-error');
    }
    return false;
}