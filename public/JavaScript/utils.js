    $(document).ready(function() {
        
        // icon im Reiter
        $('.reiternav li').click(function() {
            $('.ui-state-default img').attr("src", "/images/webelemente/kit_act.png");
        });

        // login aufklapper header: focus
        $('.info .login, div, a, ul').hover(function(e) {
            if (($('.login .infocenter_submenu').css('display') == 'none' || !$('.login .infocenter_submenu').css('display')) && $(this).className == 'info login') {
                $('.login .infocenter_submenu').css('display', 'block');
                $('.login .infocenter_submenu').show();
            }
        });

/*
        $(document).on("click", function(e) {
            if (!$('.infocenter_submenu').is(e.target) && $('.infocenter_submenu').has(e.target).length === 0) {
                $('.header .login .infocenter_submenu').css('display', 'none');
            }
        });
        */
        

        $('button').button();
        $(".copy button").button({
            icons: {
                primary: "ui-icon-copy"
            }
        }).click(bill_to_ship);
        $('#gutschein').click(check_gutschein);
        $('#back_to_list button').button({
            icons: {
                primary: "ui-icon-arrow-1-w"
            }
        }).click(back_to_list);

        $('#session_dlg').dialog({
            autoOpen: false,
            modal: true,
            width: 600,
            height: 300
        });
        $('#show_session').css("cursor", "pointer").click(show_session);
        $('#submit_reg').button().click(submit_reg_form);
    });
    
    function js2session(jsKey,jsVal) {
        $('#session').load("/module/setSessionVars.php?" + jsKey + "=" + jsVal);
    }

    function submit_reg_form() {
        $('#reg_form').submit();
    }

    function show_session() {
        $('#session_dlg').load("/module/show_session.php").dialog("open");
    }

    function update_laender() {
        $('#liefer_Land').change();
        $('#Land').change();
    }

    function back_to_list() {
        $('#back_to_list').submit();
    }



    function text_search() {
        data = $('#form').serializeArray();


        $('.maincontent').html('<div class="box_2"><div class="box_top"></div><div class="box_middle" style="font-weight:bold!important;"><center><img src="/images/webelemente/loading.gif"><p>Searching. Please wait</p></center></div><div class="box_bottom"></div></div>');
        $('.maincontent').load('/module/search.php', data);
        return false;
    }

    function clear_search() {
        $('.menu_select option[value=""]').prop('selected', true);

        data = $("#search_ausp").serializeArray();
        $(".searchrefresh").load("/module/updateSearchFilter.php", data, function() {
            initTooltip();
        });
    }

    function select_search() {
        if (select_search_valid()) {
            data = $('#search_ausp').serializeArray();


            $('.maincontent').html('<div class="box_2"><div class="box_top"></div><div class="box_middle" style="font-weight:bold!important;"><center><img src="/images/webelemente/loading.gif"><p>Searching. Please wait</p></center></div><div class="box_bottom"></div></div>');
            $('.maincontent').load('/module/search.php', data);

        }
    }

    function select_search_valid() {
        var isValid = true;
        if ($("#auspraegung_1").val() == "" && $("#auspraegung_2").val() == "" && $("#auspraegung_3").val() == "" && $("#auspraegung_4").val() == "" && $("#category").val() == "") {
            isValid = false;
            alert(" Please select a filter! ");
        }
        return isValid;
    }

    function fine_search() {

        daten = $('#fine_search').serializeArray();
        $('.maincontent').html('<div class="box_2"><div class="box_top"></div><div class="box_middle" style="font-weight:bold!important;"><center><img src="/images/webelemente/loading.gif"><p>Searching. Please wait</p></center></div><div class="box_bottom"></div></div>');
        $('.maincontent').load('/module/search.php', daten);
    }

    function sort_search() {

        daten = $('#sort_search').serializeArray();
        $('.maincontent').html('<div class="box_2"><div class="box_top"></div><div class="box_middle" style="font-weight:bold!important;"><center><img src="/images/webelemente/loading.gif"><p>Searching. Please wait</p></center></div><div class="box_bottom"></div></div>');
        $('.maincontent').load('/module/search.php', daten);
    }


    function check_gutschein() {
        gs_code = $('#gs_code').val();
        $('#gs_check_result').removeClass("ui-state-error");
        if (gs_code == "") {
            meld_gs("Bitte geben Sie einen g&uuml;ltigen Code ein.|1");
            return false;
        }
        $('#gs_check_result').load("/module/check_code.php", { code: gs_code }, meld_gs);
    }

    function meld_gs(data) {
        arr = data.split('|');
        $('#gs_check_result').html(arr[0]);
        if (arr[1] == 1) {
            $('#gs_check_result').addClass("ui-state-error");
        } else {
            document.location.reload();
        }
        $('#gs_code').val("");
    }

    function bill_to_ship() {
        anrede = $('#Anrede').val();
        vorname = $('#vorname').val();
        nachname = $('#nachname').val();
        firma = $('#firma').val();
        strasse = $('#strasse').val();
        hausnummer = $('#hausnummer').val();
        strasse2 = $('#strasse2').val();
        plz = $('#plz').val();
        ort = $('#ort').val();
        land = $('#Land').val();
        email = $('#email').val();
        telefon = $('#telefon').val();
        fax = $('#fax').val();
        comment = $('#comnent').val();
        vat_id = $('#vat_id').val();
        state = $('#state').val();
        pro_title = $('#ProfTitle').val();
        $('#liefer_Anrede').val(anrede);
        $('#liefer_vorname').val(vorname);
        $('#liefer_nachname').val(nachname);
        $('#liefer_firma').val(firma);
        $('#liefer_strasse').val(strasse);
        $('#liefer_hausnummer').val(hausnummer);
        $('#liefer_strasse2').val(strasse2);
        $('#plz2').val(plz);
        $('#ort2').val(ort);
        $('#liefer_Land').val(land).change();
        $('#liefer_email').val(email);
        $('#liefer_telefon').val(telefon);
        $('#liefer_vat_id').val(vat_id);
        $('#liefer_state').val(state);
        $('#liefer_ProfTitle').val(pro_title);
        $('#liefer_fax').val(fax);
        $('#liefer_comment').val(comment);
        return false;
    }

    function upd_state() {
        f_id = this.id;

        if (f_id == "liefer_Land") {
            t_list = "liefer_state";
        } else {
            t_list = "state";
        }


        if ($('#' + f_id).val() == 173) {
            $('#' + t_list).show();
        } else {
            $('#' + t_list).hide();
        }

        land = $('#Land').val();
        liefer_land = $('#liefer_Land').val();

        if (land == 173) {
            $('#state_row').show();
        } else {
            $('#state_row').hide();
        }

        if (liefer_land == 173) {
            $('#liefer_state_row').show();
        } else {
            $('#liefer_state_row').hide();
        }
    }

    function change_vat() {
        land = $(this).val();
        liefer = 0;
        if (this.id == "liefer_Land") {
            liefer = 1;
        }
        $.ajax({
            url: "/update_vat.php?l_id=" + land + "&liefer=" + liefer,
            success: update_vat
        });
    }

    function update_vat(data) {
        res = data.split("|");

        if (res[0] == 1) {

            $('#' + res[1] + 'ustidnr_text').show();
            $('#' + res[1] + 'ustidnr_input').show();
            $("#" + res[1] + "ustidnrReq").val("ustidnr");

        } else {

            $('#' + res[1] + 'ustidnr_text').hide();
            $('#' + res[1] + 'ustidnr_input').hide();
            $("#" + res[1] + "ustidnrReq").val("");
        }
    }

    /*function query_amount()
    {
        a_id_str=this.id;
        a_id_arr=a_id_str.split('_');
        a_id=a_id_arr[1];
        load_item(a_id);
    }
    
    function load_item(a_id)
    {
        $.get("/module/load_item.php?item="+a_id, show_amount);        
    }
    

    function show_amount(data)
    {
        rows=data.split("|");
        item_infos=rows[0].split("#");
        $('#preisstaffel').html(rows[1]);
        $('#item_name').html(item_infos[0]);
        $('#amount_dlg').dialog("open");
    }
    function refresh_page(data)
    {
        //alert(data);
        $('#item_count').html(data);
    }
    
    //$('.add_to_basket').click(query_amount).css("cursor","pointer");
    $('.add_mhc_to_basket').click(query_mhc_amount).css("cursor","pointer");
    $("#fine_search input:checkbox").click(fine_search);

    // MHC functions
    // kopierte Funktionen
    function query_mhc_amount()
    {
        a_id_str=this.id;
        a_id_arr=a_id_str.split('_');
        a_id=a_id_arr[1];
        load_mhc_item(a_id);
    }
    
    function load_mhc_item(a_id)
    {
        $.get("/module/load_item.php?mode=getItems&item="+a_id, show_mhc_amount);        
    }

    function show_mhc_amount(data)
    {
        rows=data.split("|");
        item_infos=rows[0].split("#");
        
        
        $('#item_name').html(item_infos[0]);
        $('#preisstaffel').html( rows[1] );
        
        
        $('#amount_dlg').dialog("open");
        
    }*/