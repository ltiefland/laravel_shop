$(function(){
    
    $('#email_error_dlg').dialog({
        autoOpen: false,
        height: "auto",
        width: 650,
        modal: true,
        resizable: false,
        draggable: false,
        buttons: {
            'weiter ohne Login': function(){
                $('#continue_email').val("1");
                $('#buy_form').submit();
                $(this).dialog('close');
            },
            'zum Login': function(){
                self.location.href='/index.php?mode=login';
            }
        },
        close: function(){
            
        }
    });
    $('#email_error_dlg').dialog('destroy');
    $('.send_pw_button').click(function() {
        var str = $(".forgotPWInput").val();
        str = str.trim();
        var ret = false;
        console.log(str);
        if( str.length == 0 ){
            alert( "Bitte geben Sie eine E-Mailadresse ein!" );    
        }else{
            ret = confirm("Soll Ihnen wirklich ein neues Passwort zugeschickt werden?");    
        }
        return ret;
    })

    function show_email_error_dlg()
    {
        $('#email_error_dlg').dialog('open');
    }
});