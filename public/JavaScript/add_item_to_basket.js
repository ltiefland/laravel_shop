//$Id: add_item_to_basket.js 7412 2021-11-24 12:43:52Z erling $
$(function(){

    $('.add_konfigitem_to_basket').click(add_konfigitem_to_basket);
    $('.add_to_basket').click(add_item_to_basket); 
    $('.addon_to_basket').click(addon_item_to_basket); 
    $('.addon_basket').click(addon_to_basket); 
    $('.add_zusatz').click(add_zusatz);
    $('.basket_add_zusatz').click(basket_add_zusatz);
    $('.add_to_basket_single').click(add_single_to_basket);

    $("div.basket_text").on("click", "div.add_item_from_subdir", add_item_from_subdir);
    $("div.basketImg").on("click", "img.add_item_from_subdir", add_item_from_subdir);
    $("div.basketReload").on("click", "img.add_item_from_subdir", add_item_from_subdir);
    $(".itemTable_container").on("click", "div.add_item_from_subdir", add_item_from_subdir);
    
    $("#letzteBestellungen").on("click", "div.add_item_from_subdir", add_item_from_subdir);
    
    $("#favoriten").on("click", "img.add_item_from_subdir", add_item_from_subdir);
    //$("#favoriten").on("click", "div.add_item_from_subdir", add_item_from_subdir);
    

    $('#accordionBasket #favoriten div.add_item_from_subdir').click(add_item_from_subdir);
    $('#tabsBasket #favoriten div.add_item_from_subdir').click(add_item_from_subdir);

   
    $('#addPraesentkorb').click(addPraesentkorb);
    $('#choosePraesentkorb').click(choosePraesentkorb);
    
    let w=$(window).width();
    let dialogWidth = "90%";

    if(w>1000) {
        dialogWidth = 850;

    }
    $('#add_basket_msg').dialog({
            dialogClass: 'bestelldialog',
            modal:true,
            autoOpen:false,
            resizable:false,
            width: dialogWidth, // overcomes width:'auto' and maxWidth bug
            maxWidth: 800,
            maxHeight: 600,
            position:{
                my: "center",
                at: "center",
                of: window
            },
            buttons:{
                'weiter einkaufen':function(){
                    $(this).dialog("close");
                    //document.location.reload();
                },
                'zur Kasse':function(){
                    $(this).dialog("close");
                    document.location.href=buy_link_base+"/basket.html";
                }
            }
    });

    // ME: das Mengeneingabefeld prüfen und unerlaubte Eingaben verhindern
    $('.mengeninput').keyup(checkMindestMenge);

    function checkMindestMenge(e) {
        if(e.which!=8) {
            let mindestMenge = parseInt( $('#mindestMenge').val() );
            let menge = $(this).val();
            let defaultMenge = 1;
            // im Warenkorb muss es auch funktionieren..

            if(!mindestMenge) {
                let basketItemID = $(this).attr('id');
                mindestMenge = parseInt ( $('#mindestMenge_'+basketItemID).val() );
                let onBasketPage = 1;
            }
            if(mindestMenge > 0) {
                defaultMenge = mindestMenge;
            }

            menge = menge.replace('.',"");

            if(menge<=0) {
                menge=defaultMenge;
            }

            if(isNaN(menge)==true) {
                menge=defaultMenge;
            }
            if(mindestMenge > 0) {
                if(menge < defaultMenge) {
                    menge = defaultMenge;
                }
            }

            $(this).val(menge);
        }
    }    // bei onfocus das Feld leeren
    $('.mengeninput').focus(function(){
        //$(this).val('');
    });

    // ME: beim Enter drücken muss der Warenkorbbutton getriggert werden.
    $('.mengeninput').keypress(function(e){
        if(e.which === 13) {
            $('.add_to_basket').trigger('click');
            // auch auf den Übersichtsseiten
            let id = $(this).attr('id');
            if(id) {
                id = id.split("_");
                $('#item_'+id[1]).trigger('click');
            }
        }
    });

});

function addPraesentkorb(e)
{
    e.preventDefault();
    let pId=$(this).attr("data-pkId");
    $.get("/addItemToBasket?item="+pId,function(){
        location.href="/basket.html";
    })
}
function choosePraesentkorb(e)
{
    e.preventDefault();
    let pId=$('#pkId').val();
    $.get("/addItemToBasket?item="+pId,function(){
        location.href="/basket.html";
    })
}

function add_konfigitem_to_basket(event) {

    event.preventDefault();
    let items = $('#basket').serialize();

    let addons = $('#addons').serialize();

    $('.warenkorb').load('/addItemToBasket?'+addons,items, function(data){
        $('#add_basket_msg').dialog("open");
        let iPreis = $('#itemPreis').html();
        if(iPreis){
          $('#add_basket_msg').find('#dialog_preis').html(iPreis);
        }

    });
}

function add_single_to_basket(event) {

    event.stopImmediatePropagation();
    event.preventDefault();

    let itemArr = $('#basket').serialize();

    $('#menge_bestand_msg').hide();

    if(typeof buy_more_as_on_stock == null || typeof buy_more_as_on_stock == undefined)
    {
        let buy_more_as_on_stock=0;
    }

    if( checkVerfuegbarenBestand ) {
        $.ajax({
            type: "POST",
            url: "/module/checkWarenkorbItemBestand.php",
            data: itemArr,
            async: false,
            success: function(data) {

                if( data != "" && buy_more_as_on_stock !=1 ){
                    alert(data)
                }else{
                    $('#add_basket_msg').dialog("open");
                    if(data!="" && buy_more_as_on_stock==1)
                    {
                        $('#menge_bestand_msg').css('display','block');
                    }
                    if (typeof(fbtag) != "undefined" && typeof(fbq) != "undefined") {
                        fbq("track","AddToCart");
                    }
                    $('.warenkorb').load('/addItemToBasket', itemArr, function(data){});
                }
            }
        })
    }else{
        if (typeof(fbtag) != "undefined" && typeof(fbq) != "undefined") {
            fbq("track","AddToCart");
        }
        $('.warenkorb').load('/addItemToBasket', itemArr, function(data){
            location.href="/paypal/SetExpressCheckout.php";
        });
    }
}

function add_item_to_basket(event,optDlg=1) {

    event.stopImmediatePropagation();
    event.preventDefault();

    // options selected?
    if(optDlg===1) {
        let err = 0;
        let cDlg;
        $('.options option').each(function() {
            if($(this).is(":selected")) {
                if($(this).val()==="-1") {
                    err++;
                }
            }
            return err;
        });
        if(err>0) {
            cDlg = confirm("Es sind nicht alle Optionen ausgewählt worden. Sind sicher, dass Sie fortfahren möchten?");
        }
        if(cDlg===false) {
            return false;
        }
    }
    
    

    $('.products_checkbox').each(function(index,elem){
        if($(elem).prop("checked")==true)
        {
            let item=$(elem).attr("id").split("_");
            item=item[1];
            console.log(item)
            let url = '/addItemToBasket?basket=true&item='+item+'&Menge=1';
            console.log(url);
            $('.warenkorb').load(url, function(data){});
        }
    })
    let itemArr = $('#basket').serialize();

    $('#menge_bestand_msg').hide();

    if(typeof buy_more_as_on_stock == null || typeof buy_more_as_on_stock === undefined)
    {
        let buy_more_as_on_stock=0;
    }

    if( checkVerfuegbarenBestand ) {
        $.ajax({
            type: "POST",
            url: "/module/checkWarenkorbItemBestand.php",
            data: itemArr,
            async: false,
            success: function(data) {

                if( data != "" && buy_more_as_on_stock !=1 ){
                    alert(data)
                }else{
                    $('#add_basket_msg').dialog("open");
                    if(data!="" && buy_more_as_on_stock==1)
                    {
                        $('#menge_bestand_msg').css('display','block');
                    }
                    if (typeof(fbtag) != "undefined" && typeof(fbq) != "undefined") {
                        fbq("track","AddToCart");
                    }
                    console.log(itemArr)
                    $('.warenkorb').load('/addItemToBasket', itemArr, function(data){});
                }
            }
        })
    }else{
        if (typeof(fbtag) != "undefined" && typeof(fbq) != "undefined") {
            fbq("track","AddToCart");
        }
        $('#add_basket_msg').dialog("open");
        console.log(itemArr)
        $('.warenkorb').load('/addItemToBasket', itemArr, function(data){});
    }
}


function addon_item_to_basket(event)
{
    event.stopImmediatePropagation();
    event.preventDefault();
    let a_id = this.id;
    a_id = a_id.split("_");
    a_id = a_id[1];
    let form_id="basket_"+a_id;
    $('#add_basket_msg').dialog("open");
    $('.warenkorb').load('//addItemToBasket', $('#'+form_id).serialize(), function(data){
    });
}
function addon_to_basket(event)
{
    event.preventDefault();
    let a_id = $(this).attr("id");
    a_id = a_id.split("_");
    a_id = a_id[1];
    let form_id="basket_"+a_id;

    $('.hd_warenkorb').load('/addItemToBasket', $('#'+form_id).serialize(), function(data){
        document.location.href=buy_link_base+"/basket.html";
    });
}

function add_item_from_subdir(event) {

    $(".ui-dialog-content").dialog("close");
    let item_id = $(this).attr("id");

    item_id=item_id.split("_");
    item_id = item_id[1];
    let menge = 1;

    if($('#Menge_'+item_id).val())
    {
        menge = $('#Menge_'+item_id).val();
    }

    let auspraegungStr="";

    if($('#auspraegungStr_'+item_id).val())
    {
        auspraegungStr=$('#auspraegungStr_'+item_id).val();
    }

    let url = '/addItemToBasket?basket=true&item='+item_id+'&Menge='+menge+'&buy=false';

    if(auspraegungStr)
    {
        url+="&auspraegungStr="+encodeURI(auspraegungStr);
    }

    if( $(".mengeninput_"+item_id).val() > 0 && $(".mengeninput_"+item_id).val() != "undefined" ){
        menge = $(".mengeninput_"+item_id).val();

    }

    // checkVerfuegbarenBestand in page.tpl definiert
    if( checkVerfuegbarenBestand ) {
        if(typeof buy_more_as_on_stock == null)
        {
            buy_more_as_on_stock=0;
        }
        let item = [];
        item.push({ name: "item", value: item_id });
        item.push({ name: "Menge", value: menge });

        $.ajax({
            type: "POST",
            url: "/module/checkWarenkorbItemBestand.php",
            data: item,
            async: false,
            success: function(data) {

                if( data != "" && buy_more_as_on_stock !=1 ){
                    alert(data)
                }else{
                    $('#add_basket_msg').dialog("open");
                    if(data!=="" && buy_more_as_on_stock==1)
                    {
                        $('#menge_bestand_msg').css('display','block');
                    }
                    if (typeof(fbtag) != "undefined" && typeof(fbq) != "undefined") {
                        fbq("track","AddToCart");
                    }
                    $('.warenkorb').load(url,function(data){});
                }
            }
        })
    }else{
        if (typeof(fbtag) != "undefined" && typeof(fbq) != "undefined") {
            fbq("track","AddToCart");
        }
        $('#add_basket_msg').dialog("open");
        $('.warenkorb').load(url,$('#basket_'+item_id).serialize(),function(data){});
    }
}

function add_item_from_fastOrder( data ){
    if (typeof(fbtag) != "undefined" && typeof(fbq) != "undefined") {
        fbq("track","AddToCart");
    }

    $('#add_basket_msg').dialog("open");
    $.ajax({
        type: "POST",
        url : '/addItemToBasket?basket=true&buy=false&mode=fastOrder',
        data: data
    }).done(function(html){
        $('.warenkorb').html(html);
    });
}


function basket_add_zusatz(event)
{
    event.preventDefault();
    $( "#loading" ).dialog( "open" );
    let z_id = this.id;
    z_id = z_id.split("_");
    let b_id = z_id[1];
    let m_id = z_id[4];
    z_id = z_id[3];
    let url='/addItemToBasket?basket=true&b_id='+b_id+'&zusatz='+z_id+'&Menge=1&buy=false';
    //alert(url);
    $('.hd_warenkorb').load(url,function(data){
        document.location.href=buy_link_base+"/basket.html";
    });
}
function add_zusatz(event)
{
    event.preventDefault();
    let z_id = this.id;
    z_id = z_id.split("_");
    let m_id = z_id[2];
    z_id = z_id[1];
    //alert(m_id);
    let url='/addItemToBasket?basket=true&zusatz='+z_id+'&Menge=1&buy=false';
    $('.hd_warenkorb').load(url,function(data){
        $('.hd_warenkorb').load("/module/updateBasket.php");
    });
}

    function changeMenge()
    {

        let idArr = $(this).attr('id');
        idArr = idArr.split("_");
        let action = idArr[0];
        let id = idArr[1];
        let currentMenge = $('.mengeninput_'+id).val();

        if(currentMenge==="" || currentMenge < 1) {
            currentMenge = 1;
            $('.mengeninput_'+id).val(currentMenge);
        }

        switch(action) {
            case "plus":
                currentMenge++;
            break;
            case "minus":
                currentMenge--;
            break;
            default:
            break;
        }
        if(currentMenge < 1) {
            currentMenge = 1;
        }

        $('.mengeninput_'+id).val(currentMenge);

        if($(this).parent().children().attr('name')=="basketItemID") {
            let basketItemId = $(this).parent().children().val();
            if(basketItemId) {
                //changeTarget(basketItemId);
		let url = "/editItem/"+basketItemId+"/"+currentMenge;
                $.get(url,function(){
                    //$('#versandoptionen').load("/update_versand.php?param=single&Land=" + $('#versand_laenderauswahl').val() );
                })
            }
        }



    }

// mengen update ueber plus/minus tasten
$(document).ready(function(){
    // mengen update im BasketInfoLayer
    $('.basketinfochange_menge').click(function(){
        let idArr = $(this).attr('id');
        idArr = idArr.split("_");
        let action = idArr[0];
        let id = idArr[1];
        let currentMenge = $('.basketinfomengeninput_'+id).val();
        
        if(currentMenge=="" || currentMenge < 1) {
            currentMenge = 1;
            $('.basketinfomengeninput_'+id).val(currentMenge);
        }     

        switch(action) {
            case "basketinfoplus":
                currentMenge++;
            break;
            case "basketinfominus":
                currentMenge--;
            break;
            
            default:
            break;
        }
        if(currentMenge < 1) {
            currentMenge = 1;
        }     
        // todo: die BasketSession updaten
        
        // inputFeld updaten
        $('.basketinfomengeninput_'+id).val(currentMenge);
        
    });


    // plus/minus Tasten beim Mengeneingabefeld
    $('.change_menge').click(changeMenge);
    
});
