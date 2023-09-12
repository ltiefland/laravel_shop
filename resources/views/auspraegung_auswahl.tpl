{if is_array($bool_opts)}
<div class="mehrFilterWrapper" >
    <div class="mehrFilter">
        {include file="bool_options.tpl" nocache}
    </div>
</div>
{/if}

{include file="dropdown_options.tpl" nocache}

 
  <script>
        $(document).ready(function () {
            $('.brandbox').click(function(){
                var inputId = $(this).data("labelfor");
                $("#" + inputId).click();
            });
            
            var wWidth = $(window).width();
            var dWidth = wWidth * 0.1;
            var wHeight = $(window).height();
            var dHeight = wHeight * 0.17;
            
            $("#loading").dialog({
                    modal: true,
                    autoOpen: false,
                    draggable: false,
                    resizable: false,
                    closeOnEscape: false,
                    width:220,
                    height:220,
            });
            $(".ui-dialog-titlebar").hide();
            
            var maxH = 0;
            /*
            $('.optionsReload .options_select').each(function () {
                var h = $(this).height();
                if (h > maxH) {
                    maxH = h;
                }
            });
            
          
            $('.optionsReload .options_select').css("min-height", "73px");
            $('.optionsReload .options_select').css("height", maxH + "px");
            */

            $("#atoggle").click(function () {
                $("#divtoggle").toggle();
                if (!$("#divtoggle").is(':visible')) {
                    $(this).val("weitere Filter");
                    $("#filterstatus").val(0);
                } else {
                    $(this).val("weniger Filter");
                    $("#filterstatus").val(1);
                }
                return false;
            })

        });
        
        
        function showSubdirFilterResult(mode)
        {
            var sessionfilter = new Array();
            $('.subdir_filter').each(function(){
                var value = $(this).val();
                var name = $(this).attr("name");
                var classname = $(this).attr("class");
                var id = $(this).attr("id");
                var type = $(this).attr("type");
                
                if(type=="checkbox"){ // alle checkboxen (status checked)
                    if(type=="checkbox" && $(this).is(":checked")==false) {
                        value=null;
                    }    
                }

                // herstellerauswahl speichern (chkboxhersteller)
                if(name=="hersteller[]") {
                    if($(this).is(":checked")) {
                        $("#chkboxhersteller").val($(this).val());
                    }
                }
                
            });
            
            
            $("#loading").dialog('open');
            daten = $('#modellForm1').serializeArray();
            setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "/module/filter_auspraegungen.php",
                    data: daten,
                    async: false,
                    success: function (html) {
                        if (mode == "result") {
                            $(".pagination_container").css("display", "none");
                            $('.subdir_artikel').html(html);
                            $(".subdir_artikel").css("background-color", "transparent");

                            $(".newsorting").css("display", "block");
                            $('#loading').dialog("close");
                        }
                    }
                })
            }, 1);
        }

        
        function refreshSubdirFilterFilter(mode) {
            daten = $('#modellForm1').serializeArray();
            $.ajax({
                type: "POST",
                url: "/module/updateSearchFilterSubdir.php?mode=" + mode,
                data: daten,
                async: false,
                beforeSend: function () {
                    $(".box_2").css("background-color", "transparent");
                    
                },
                success: function (html) {
                    $('.optionsReload').html(html);  
                    setTimeout(function () {
                        $('#loading').dialog('close');
                    }, 100);
                },
            });
            return true;
        }
        
        
    $("input:checkbox").on("change", callall);
    
    function callall() {
       $('#loading').dialog("open");
       showSubdirFilterResult("result");
       refreshSubdirFilterFilter("select");
    }
    
    </script>
    
    
    
    
    