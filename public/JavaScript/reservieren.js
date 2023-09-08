$(function()
{
    $('input:submit, input:button, input:reset').button();
    $('#reservieren_btn').click(reservieren);
});

function updateTips(t)
{
    $("#message_res").html(t).addClass('ui-state-error');
}

function reservieren(event)
{
    event.preventDefault();
    var vorname = $('#vorname').val();
    var nachname = $('#nachname').val();
    var telefon = $('#telefon').val();
    var email = $('#email').val();
    var menge = $('#menge').val();
    url = "/module/reiter/reservieren.php";
    $("#message_res").text("");
    if (vorname == "")
    {
        updateTips("Bitte geben Sie Ihren Vornamen ein!");
        return false;
    }
    if (nachname == "")
    {
        updateTips("Bitte geben Sie Ihren Nachnamen ein!");
        return false;
    }
    if (telefon == "")
    {
        updateTips("Bitte geben Sie Ihre Telefonnummer ein!");
        return false;
    }
    if (email == "")
    {
        updateTips("Bitte geben Sie Ihre E-Mail Adresse ein!");
        return false;
    }
    if (menge == "")
    {
        updateTips("Bitte geben Sie die Anzahl ein!");
        return false;
    }
    $('#message_res').load(url, $('#reservieren_form').serializeArray()).addClass('ui-state-error',function()
    {
        $('#reservieren_div').hide();
    });
    return false;
}
