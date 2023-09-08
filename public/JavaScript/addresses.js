//$Id: addresses.js 7148 2021-09-10 10:51:20Z erling $
$(document).ready(function()
{
    
    var name = $( "#vorname" ),
        lname = $( "#nachname" ),
        company = $( "#firma" ),
        street1 = $( "#street1" ),
        str_nr1 = $( "#str_nr1" ),
        postal = $( "#plz" ),
        city = $( "#ort" ),
        email=$('#email'),
        phone=$('#telefon'),
        allFields = $( [] ).add( name ).add( lname ).add( company ).add( street1 ).add( str_nr1 ).add( postal ).add( city ).add(email).add(phone),
        tips = $( "#validateTips" );

    $(".changeBillingAddressDialogAlt").delegate("input:button", "click", function(){
        $('#edit_addr_dialog_bill').dialog("open");
    });
    $(".changeShippingAddressDialogAlt").delegate("input:button", "click", function(){
        $('#edit_addr_dialog_ship').dialog("open");
    });
    $(".changeBillingAddressDialog, .changeShippingAddressDialog").delegate("input:button", "click", function(){
        $('#new_addr_dialog').dialog("open");
        $(".changeBillingAddressDialog, .changeShippingAddressDialog").dialog("close");
    });
    
    $(".addr_defaultBilling").click(function(){
        var addr_id = $(this).val();         
        $('.addresses').load('/module/addr_saveDefault.php?type=billing&addr_id='+addr_id);                 
    });
    $(".addr_defaultShipping").click(function(){
        var addr_id = $(this).val();
        $('.addresses').load('/module/addr_saveDefault.php?type=shipping&addr_id='+addr_id);
    });
    $(".addr_defaultAccount").click(function(){
        var addr_id = $(this).val();
        $.ajax({
            url: "/get_land_id.php?a_id="+addr_id,
            success:function(land_id){
                $.ajax({
                    url: "/change_currency.php?l_id="+land_id
                }); 
            } 
       });
       $('.addresses').load('/module/addr_saveDefault.php?type=account&addr_id='+addr_id);
    });
    
    
    
    function updateTips( t ) 
    {
        tips
            .html( t )
            .addClass( "ui-state-highlight" );
        setTimeout(function() 
        {
            tips.removeClass( "ui-state-highlight", 1500 );
        }, 500 );
    }
    
    function checkLength( o, n, min, max ) 
    {
        if ( o.val().length > max || o.val().length < min ) 
        {
            o.addClass( "ui-state-error" ).focus();
            updateTips( "Length of " + n + " must be between " + min + " and " + max + "." );
            return false;
        }
        else
        {
            return true;
        }
    }
    function checkMinLength( o, n ) 
    {
        if ( o.val().length < 1 ) 
        {
            o.addClass( "ui-state-error" ).focus();
            updateTips( n + " darf nicht leer sein." );
            return false;
        }
        else
        {
            return true;
        }
    }

    function checkRegexp( o, regexp, n ) 
    {
        if ( !( regexp.test( o.val() ) ) ) 
        {
            o.addClass( "ui-state-error" ).focus();
            updateTips( n );
            return false;
        }
        else
        {
            return true;
        }
    }
    $('#new_addr_dialog,#new_shipping_addr_dialog,#new_billing_addr_dialog').dialog(
    {
        autoOpen:false,
        height: "auto",
        width: "auto",
        modal:true,
        resizable:false,
        show:"fade",
        hide:"fade",        
        buttons:
        {
            'Abbrechen':function(){
                $(this).dialog("close");
            },
            
            'Adresse speichern': function()
            {
                var bValid = true;
//                allFields.removeClass( "ui-state-error" );
//                tips.text("");
//
//                bValid = bValid && checkMinLength(name,"First name");
//                bValid = bValid && checkMinLength(lname,"Last name");
//                bValid = bValid && checkMinLength(street1,"Street");
//                bValid = bValid && checkMinLength(str_nr1,"Street No");
//                bValid = bValid && checkMinLength(postal,"Postalcode");
//                bValid = bValid && checkMinLength(city,"City");
                //bValid = bValid && checkMinLength(email,"E-Mail");                

                
                if ( bValid ) 
                {
                    daten=$('.edit_address').serializeArray();
                    //Shows which address was choosen true/false
                    $.ajax({
                        type: "POST",
                        url: "/edit_address.php?mode=save",
                        data: daten
                    }).done(function( html ){
                        resultArr=html.split("|");
                        resultCode=resultArr[0];
                        resultText=resultArr[1];
                        tips.html(resultText);
                        if(resultCode!=1)
                        {
                            $("#new_addr_dialog").dialog("close");
                            alert("Die Adresse wurde gespeichert und kann jetzt durch einen Klick auf 'Adresse wechseln' als Rechnungs- und/oder Lieferadresse verwendet werden.");
                            window.location.reload();
                        }
                    });                          
                }
            },
        }
    });
    $('#edit_addr_dialog_bill').dialog(
    {
        autoOpen:false,
        height: "auto",
        width: "auto",
        modal:true,
        resizable:false,
        show:"fade",
        hide:"fade",        
        buttons:
        {
            'Adresse speichern': function()
            {

                daten=$('#edit_address').serializeArray();
                //Shows which address was choosen true/false
                $.ajax({
                    type: "POST",
                    url: "/edit_address.php?mode=save",
                    data: daten
                }).done(function( html ){
                    $(".changeBillingAddressDialogAlt").load("/edit_address.php?mode=showAdress");      
                    $("#edit_addr_dialog_bill").dialog("close");
                });      

            },
            'Abbrechen':function(){
                $(this).dialog("close");
            }
        }
    });
    
    $('#edit_addr_dialog_ship').dialog(
    {
        autoOpen:false,
        height: "auto",
        width: "auto",
        modal:true,
        resizable:false,
        show:"fade",
        hide:"fade",        
        buttons:
        {
            'Adresse speichern': function()
            {

                daten=$('#edit_address').serializeArray();
                //Shows which address was choosen true/false
                $.ajax({
                    type: "POST",
                    url: "/edit_address.php?mode=save",
                    data: daten
                }).done(function( html ){
                                        
                    $(".changeShippingAddressDialogAlt").load("/edit_address.php?mode=showAdress&type=ship");                     
                    $("#edit_addr_dialog_ship").dialog("close");
                });      

            },
            'Abbrechen':function(){
                $(this).dialog("close");
            }
        }
    });
    
    $('#del_address_dialog,.del_address_dialog').dialog({
        autoOpen: false,
        height: "auto",
        width: "auto",
        modal: true,
        resizable: false,
        show:"fade",
        hide:"fade",
        title: 'Adresse löschen',
        open: function() {
            $(this).html("Möchten Sie diese Adresse wirklich löschen?");   
        },
        buttons:
        {
            'Nein': function(){
                $(this).dialog('close');
            },
            'Ja': function(){
                $('.addresses').load("/del_address.php", data);
                $(this).dialog('close');
            }
        }
    });
    
    $('.new_addr_basket').click(new_address);
    
    $('#edit_addr_basket').click(function(){
        idArray = $(this).attr("id").split("_");
        adressID = idArray[0];
        
        edit_address(adressID);
    });
    
    $('#my_address_book').click(function(){
        $(location).attr('href','/?mode=addresses&type=buy');
    });
    $('#continue_buy').click(function(){
        $(location).attr("href","bestellen_seite_1.html"); 
    });
    
    
    $('#change_address_billing').click(function(){
        $(location).attr("href","bestellen_seite_1.html"); 
    });
    $('#change_address_shipping').click(function(){
        $(location).attr("href","bestellen_seite_1.html"); 
    });


    //$('#list_billing_addr').change(upd_land);
    $('#list_shipping_addr').change(upd_land).change();
    
    $( "button",".new"  ).button({
        icons: {
            primary: "ui-icon-plus"
        }
    });
    $( "input:button" ).button();
    
    $( "#tabsBasket .trash" ).click(function(event){
        event.stopImmediatePropagation();
        event.preventDefault();
        var id = $(this).attr("id");
        var idsplit = id.split("_");
        var adressID = idsplit[1];

        del_address(adressID);
    });
    
    $( "#accordionBasket .trash" ).click(function(event){
        event.stopImmediatePropagation();
        event.preventDefault();
        var id = $(this).attr("id");
        var idsplit = id.split("_");
        var adressID = idsplit[1];
        
        del_address(adressID);
    });
    
    
    $( "#tabsBasket .edit" ).click(function(event){
        event.stopImmediatePropagation();
        event.preventDefault();
        var id = $(this).attr("id");
        var idsplit = id.split("_");
        var adressID = idsplit[1];
            
        edit_address(adressID);    
    });
    
    $( "#accordionBasket .edit" ).click(function(event){
        event.stopImmediatePropagation();
        event.preventDefault();
        var id = $(this).attr("id");
        var idsplit = id.split("_");
        var adressID = idsplit[1];
            
        edit_address(adressID);    
    });
    
    
}); 
function add_to_list(data)
{
    ret=data.split("|");
    code=ret[0];
    adresse=ret[1];

    if(code==0)
    {
        $('#list_billing_addr').append(adresse);
        $('#list_shipping_addr').append(adresse);
       
        $('#new_addr_dialog').dialog("close");
    }
    else
    {
        $( "#validateTips" ).html(adresse);
    }
}
function del_address(adressID)
{
    data = new Array();
    
    data.push({ name: "mode", value: "delete" });
    data.push({ name: "id", value: adressID });
    
    $('#del_address_dialog').dialog("open");
}
function edit_address(adressID)
{
    var data = new Array();
    data.push({ name: "mode", value: "edit" });
    data.push({ name: "id", value: adressID });

    $('.addresses').load("/edit_address.php",data);  
}
function new_address()
{
    var data = new Array();
    data.push({ name: "mode", value: "edit" });
    data.push({ name: "id", value: '' });
    
    $('.addresses').load("edit_address.php",data);
}

function upd_land()
{
    addr_id=$(this).val();
    $.ajax({
        url: "/get_land_id.php?a_id="+addr_id,
        success:function(land_id){
            $('#liefer_Land').val(land_id).change();
            $.ajax({
                url: "/change_currency.php?l_id="+land_id
            }); 
        } 
    });
}
        
