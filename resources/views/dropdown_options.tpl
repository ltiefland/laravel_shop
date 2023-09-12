<link rel="stylesheet" href="/styles/jquery-ui.css" type="text/css" media="screen" />
<script>
    $(function(){
        $(".dropd").change(function () {
            
            callall();
            
        });
    });
</script>
<style>
    .mehrFilter {
        display: flex!important;
        gap: 20px;
        margin: 2% 0;
        flex-wrap:wrap;
    }

    .ui-slider .ui-slider-range {
        background:#2FBABD;
    }
    
    .divtoggle {
        display:flex;
        flex-wrap:wrap;
        gap:30px;
    }
    .subdir_sort .options_select {
        width:calc(25% - 30px);
    }
    .dd-selected-image{
        height:27px;
    }
    .dd-selected-text{
        line-height:0px;
    }
    .filter_elem_range {
        border: 1px solid #ccc;
        float: left;
        margin: 5px;
        min-height: 55px;
        padding: 8px !important;
        width: 20%;
    }
    .divh {
        display:flex;
        gap:20px;
    }
    .brandbox {
        border: 2px solid #fff;
        border-radius:5px;
        min-height: 86px;
        padding: 6px 4px;
        background:#fff;
        width: 206px;
        display:flex;
        flex-direction:column;
        justify-content: center;
        align-items: center;
        text-align: center;
        color:#EA5802;
        cursor:pointer;
    }
    .brandbox input {
        z-index:-1;
    }
    .brandbox:hover,
    .brandbox:focus {
        border:2px solid #EA5802;
    }
    
    .brandlogo {
        min-height: 88px;
        text-align: center;
    }
    .brandlogo img {
        cursor: pointer;
        max-height: 85px;
        max-width: 100px;
    }
    .brandbox input {
        height: 14px;
        line-height: 14px;
        margin: 2px 5px 0 0;
        padding: 0;
        float:left;
    }
    .brandbox span.amount {
        width:30px;
        float:left;
    }
    
    #divtoggle .ui-button,
    .ui-dialog-buttonset .ui-button {
        border:none!important;
        background:none!important;
        background-color:#2FBABD!important;
        border-radius:5px;
        color:#fff!important;
        transition:all 200ms ease;
        padding:1% 2%;
        font-size: 1rem;        
    } 
    #divtoggle .ui-state-hover {
        background-color:#9CD9DA!important;
    }
    
</style>


<input type="button" id="atoggle" value="weitere Filter" class="shopButton resetbutton ui-button ui-widget ui-state-default ui-corner-all" />



<div class="divh">
    {foreach $herstellercheckbox as $row}
        {if {$row['anzahlItems']}}
        <div title="{$row['Name']}" class="brandbox" data-labelfor="hersteller_{$row['ID']}">
            <div class="brandlogo">
                <img src="{$row['Logo1_href']}{$row['Logo1']}">
            </div>
            <input class="subdir_filter" id="hersteller_{$row['ID']}" type="checkbox" name="hersteller[]" value="{$row['ID']}"  {if $row['selected'] == 1}checked{/if}/>
            <span class="amount left fs11">{$row['anzahlItems']}</span>  
        </div>
        {/if}
    {/foreach}  
    <input type="hidden" name="chkboxhersteller" id="chkboxhersteller" value="1" class="subdir_filter">
</div>

    {assign var="pmax" value=$maxpreis}
    {assign var="pmin" value=1}

<script>
    $(document).ready(function () {
        $(function () {  
            $("#hpreise-slider-range").slider({
                range: true,
                min: 1,
                max: {$maxpreis},
                values: [{$pmin}, {$pmax}],
                async: false,
                slide: function (event, ui) {
                    $("#hpreise").val("preis_" + ui.values[ 0 ] + "_" + ui.values[ 1 ]);
                    $("#preise").html(ui.values[ 0 ] + " - " + ui.values[ 1 ]+" €");
                },
                stop: function (event, ui) {
                    callall();
                }
            });
            $("#hpreise").val("preis_" + $("#hpreise-slider-range").slider("values", 0) +
                    "_" + $("#hpreise-slider-range").slider("values", 1));
            $("#preise").html($("#hpreise-slider-range").slider("values", 0) +
                    " - " + $("#hpreise-slider-range").slider("values", 1)+" €");
        });
    });
</script>       


<div id="divtoggle" class="divtoggle">

    <div class="options_select" >
        <div style="float:none;padding-bottom:13px;">
            <label style="float:left"><b>Preis:&nbsp;</b></label>               
            <b style="float:left"><span id="preise"></span></b><span><b>&nbsp;&nbsp;</b></span>
        </div>
        <input type="hidden" id="hpreise" name="hpreise" class="subdir_filter">
        <div id="hpreise-slider-range"></div>
    </div>

    {foreach $dropdown_opts as $index => $data}

        {$resn = array()}
        {foreach $data["options"] as $key => $values}
            {$val = explode("_",$key)}
            {$aus = $val[0]}  
            {$max = $val[2]}
            {$min = $val[1]}
            
            {if $val[1] >= 1}
                {$resn[] = $val[1]}
            {/if}
            
            {if $val[2] >= 1}
            {$resn[] = $val[2]}
             {/if}
        {/foreach}
        
        {if $data["typ"] == 1} 
            
            {if $max!="g" && $max!="l" && isset($max)}
                {$max = max($resn)}
                {$min = 0}
                   
                {if isset($data["selected"])}
                    {$sval = explode("_",$data["selected"])}
                    {if is_array($sval)}
                        {$saus = $sval[0]}       
                        {$max = $sval[2]}
                        {$min = $sval[1]}
                    {/if}
                {/if}
                <div class="options_select">
                    <div style="float:none;padding-bottom:30px;">
                        <label style="float:left"><b>{$data["label"]}:&nbsp;</b></label>
                        {$res = str_replace(" ","",$data["label"])}
                        <b style="float:left"><span id="s{$res}"></span></b><span><b></b></span>
                    </div>
                    <input type="hidden" id="{$res}" name="{$data.name}" class="subdir_filter" />
                    <div id="{$res}-slider-range"></div>
                </div>
                
                <script>
                    $(document).ready(function () {
                        $(function () {
                            $("#{$res}-slider-range").slider({
                                range: true,
                                min: 0,
                                max: 50,
                                async: false,
                                values: [ {$min}, {$max} ],
                                slide: function (event, ui) {
                                    $("#{$res}").val({$aus} + "_" + +ui.values[ 0 ] + "_" + ui.values[ 1 ]);
                                    $("#s{$res}").html("" + ui.values[ 0 ] + " - " + ui.values[ 1 ]);
                                },
                                stop: function (event, ui) {
                                    callall();
                                }
                            });
                            $("#{$res}").val({$aus} + "_" + $("#{$res}-slider-range").slider("values", 0) +
                                    "_" + $("#{$res}-slider-range").slider("values", 1));
                            $("#s{$res}").html("" + $("#{$res}-slider-range").slider("values", 0) +
                                    " - " + $("#{$res}-slider-range").slider("values", 1));
                        });
                    });
                </script>
                         
            {else}
                {if isset($data["selected"]) }
                    {$sval = explode("_",$data["selected"])}
                    {if $sval|is_array}
                        {$saus = $sval[0]}       
                        {$max = $sval[2]}
                        {$amin = $sval[1]}
                        {$amax = $sval[1]}
                    {/if}
                {else}
                    {$amin = $min}
                    {$amax = $data['maxval']}
                {/if}
                {if $max == 'g'}
                    <div class="options_select">
                        <div style="float:none;padding-bottom:30px;">
                            <label style="float:left"><b>{$data["label"]}:&nbsp;</b></label>
                            {$res = str_replace(" ","",$data["label"])}
                            <b><span style="float:left" id="s{$res}"></span></b><span><b></b></span>
                        </div>
                        <input type="hidden" id="{$res}" name="{$data["name"]}" class="subdir_filter">
                        <div id="{$res}-slider-range-min"></div>
                    </div>
                    
                    
                    <script>
                        $(function () {
                            $("#{$res}-slider-range-min").slider({
                                range: "min",
                                min: 0,
                                max: {$data['maxval']},
                                value: {$amax},
                                slide: function (event, ui) {
                                    $("#{$res}").val({$aus} + '_' + ui.value + '_g');
                                    $("#s{$res}").html(ui.value);
                                },
                                stop: function (event, ui) {
                                    callall();
                                }
                            });
                            $("#{$res}").val({$aus} + '_' + $("#{$res}-slider-range-min").slider("value") + '_g');
                            $("#s{$res}").html($("#{$res}-slider-range-min").slider("value"));
                        });
                    </script>
                    
                {else}
                    
                     {$max =  max($resn)}
                 
                 {$min =  min($resn)}
                 {$svalue =  0}
                  <!--          { $svalue =  min($resn) } -->

               {if isset($data["selected"]) }
                    {$sval = explode("_",$data["selected"])}
                    {if $sval[1]}
                        {$svalue = $sval[1]}
                    {/if}
                {/if}
                
                
                    <div class="options_select">
                        <div style="float:none;padding-bottom:30px;">
                            <label style="float:left"><b>{$data["label"]}:&nbsp;</b></label>
                            {$res = str_replace(" ","",$data["label"])}
                            <b><span style="float:left" id="s{$res}"></span></b><span><b></b></span>
                        </div>
                        <input type="hidden" id="{$res}" name="{$data["name"]}" class="subdir_filter" />
                        <div id="{$res}-slider-range-max"></div>
                    </div>
                    <!--            min: { $min }, -->
                    
                    
                    <script>
                        $(function () {
                            //test2
                            $("#{$res}-slider-range-max").slider({
                                range: "max",
                                min: 0,
                                max: 140,
                                value: {$svalue},
                                slide: function (event, ui) {
                                    $("#{$res}").val({$aus} + '_' + ui.value + '_l');
                                    $("#s{$res}").html(ui.value);
                                },
                                stop: function (event, ui) {
                                    callall();
                                }
                            });
                            $("#{$res}").val({$aus} + '_' + $("#{$res}-slider-range-max").slider("value") + '_l');
                            $("#s{$res}").html($("#{$res}-slider-range-max").slider("value"));
                        });
                    </script>

                {/if}
            {/if}
        {else}
        {/if}
    {/foreach}
    {foreach $checkboxlist as $label => $value}
        <div class="options_select">
            <div>
                <div class="mehrFilter" style="display: block;">
                    <select class="subdir_filter dropd" name="{$value[0][3]}" id="{$label}">
                        <option value="">{$label}</option>
                            {foreach $value as $row}
                                {$result = strpos($row[1], '(0)')}
                                {if $result }
                                    <option label="{$row[1]}" value="{$row[0]}" disabled="disabled"></option>
                                  {else}
                                    <option label="{$row[1]}" value="{$row[0]}" {if $row[2]==1}selected="selected"{/if}>{$row[1]}</option>
                                 {/if}
                            {/foreach}
                    </select>
                </div>
            </div>
        </div>
    {/foreach}
    
    
    <div class="options_select">
        <button type="button" onclick="window.location.reload();" class="shopButton resetbutton ui-button">Filter zur&uuml;cksetzen</button> 
        <input type="hidden" value="0" name="filterstatus" id="filterstatus" />
    </div>
</div>