    $(function()
    {
        $('#nicht_gefunden_msg').dialog({
            modal:true,
            resizable:false,
            width:800,
            autoOpen:false,
            buttons:
            {
                'OK':function()
                {
                    $(this).dialog("close");
                }
            }
        })
        // ME: das nichGefunden-Modul ein/ausblenden
        $('.not_found_small').button().click(function(){
            $('#ng_top').toggle();
            $('.not_found_small').toggle();
            return false;
        });
        $('#close_ng').click(function(){
            $('#ng_top').toggle();
            $('.not_found_small').toggle();
        });            
        $('.not_found_small_bottom').button().click(function(){
            $('#ng_bottom').toggle();
            $('.not_found_small_bottom').toggle();
        });
        $('#close_ng_bottom').click(function(){
            $('#ng_bottom').toggle();
            $('.not_found_small_bottom').toggle();
        });      
            
        $('#send_ng').button().click(function(event){
            event.preventDefault();
            checkForm();
        });
        $('#send_ng_bott').button().click(function(event){
            event.preventDefault();
            checkBottForm();
        });
    });
    function checkForm()
    {
        brand = $('#brand').val();
        type = $('#type').val();
        name = $('#name').val();
        comment = $('#comment').val();
        e_mail=$('#email').val();
        //company=$('#company').val();
        //captcha = $('#captcha').val();
        if(brand=="")
        {
            alert("Bitte geben Sie einen Hersteller ein!");
            $('#brand').focus();
            return false;
        }else if(brand.indexOf('://')!=-1) {
            alert("Bitte geben Sie keine URL ein.");
            $('#brand').focus();
            return false;
        }
        if(type=="")
        {
            alert("Bitte geben Sie Produktdetails ein!");
            $('#type').focus();
            return false;
        }else if(type.indexOf('://')!=-1) {
            alert("Bitte geben Sie keine URL ein.");
            $('#type').focus();
            return false;
        }
        if(name=="")
        {
            alert("Bitte geben Sie Ihren Namen ein!");
            $('#name').focus();
            return false;
        }else if(name.indexOf('://')!=-1) {
            alert("Bitte geben Sie keine URL ein.");
            $('#name').focus();
            return false;
        }
        if(comment.indexOf('://')!=-1) {
            alert("Bitte geben Sie keine URL ein.");
            $('#comment').focus();
            return false;
        }        
        if(e_mail=="")
        {
            alert("Bitte geben Sie Ihre E-Mail Adresse ein!");
            $('#email').focus();
            return false;
        }else if(e_mail.indexOf('://')!=-1) {
            alert("Bitte geben Sie keine URL ein.");
            $('#email').focus();
            return false;
        }
/*
        if(company=="")
        {
            alert("Bitte geben!");
            $('#company').focus();
            return false;
        }
        */
        $.ajaxSetup({
            'async':false
        });
        setTimeout('code_result("top")',10);
        /*
        $('#ret').load("/module/reiter/check_code.php",{code:captcha},function()
        {
            
        });
        */
    }
    function checkBottForm()
    {
        brand = $('#brand_bott').val();
        typ = $('#typ_bott').val();
        name = $('#name_bott').val();
        e_mail=$('#email_bott').val();
        company=$('#company_bott').val();
        captcha = $('#captcha_bott').val();
        if(brand=="")
        {
            alert("Please enter a product name!");
            $('#brand_bott').focus();
            return false;
        }
        if(typ=="")
        {
            alert("Please enter the product details!");
            $('#typ_bott').focus();
            return false;
        }
        if(name=="")
        {
            alert("Please enter your name!");
            $('#name_bott').focus();
            return false;
        }
        if(e_mail=="")
        {
            alert("Please enter your email-address!");
            $('#email_bott').focus();
            return false;
        }
        if(company=="")
        {
            alert("Please enter the name of your company!");
            $('#company_bott').focus();
            return false;
        }
        $.ajaxSetup({
            'async':false
        });
        $('#ret').load("/module/reiter/check_code.php",{code:captcha},function()
        {
            setTimeout('code_result("bottom")',10);
        });
    }

    function code_result(where)
    {
        /*html=$('#ret').html();
        if(html!="OK")
        {
            alert(html);
            /*
            if(where=="top")
            {
                $('#captcha').focus();
            }
            else
            {
                $('#captcha_bott').focus();
            }
            
        }
        else
        {*/
            if(where=="top")
            {
                $('#ng-form').submit();
            }
            else
            {
                $('#ng-form_bott').submit();
            }
            //document.location.href="/";
        //}
    }