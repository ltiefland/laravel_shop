<!-- $Id: update_versand.tpl 2392 2022-10-06 14:16:38Z tiefland $ BEGIN -->
{if $ini.weban_vk.aktiv==1}
    <script>
        $(function(){
            $('#accordion').accordion({
                heightStyle: "content"
            });
        })
        $('.vkselection').click(function(){
            vk_name=$(this).attr("data-vk-name");
            data={
                vk_name:vk_name
            }
            $.post("/updateSession.php",data,function(html)
            {
                $(".auswahl").html("");
                $('#Versand').val(html);
                $('#auswahl_'+vk_name).html('<img src="/images/webelemente/icon_haken_za.png"/>');
            });
        });
        
        $('#vk0').click();
    </script>
    <input type="hidden" name="Versand" id="Versand" value="" />
    <div id="accordion">
    {foreach $versandOptionen as $vkId => $vk}
        <h3 class="vkselection" id="vk{$vkId}" data-vk-name="{$vk.rufname}">
            <div class="za_text">
                <p>
                {$vk.kurz}
                {if $vk.preis > 0}
                zzgl. {$vk.preis|money_format}
                {elseif $vk.preis == 0}
                    
                {elseif $vk.preis < 0}
                    {$vk.preis|abs}% des Warenwertes
                {/if}
                {if $vk.rufname=="nachnahme"}
                + Nachnahmegeb&uuml;hr, welche vom Auslieferer erhoben wird.
                {/if}
                </p>
            </div>
            <div class="auswahl" id="auswahl_{$vk.rufname}" ></div>
            <div class="za_logo"><img src="/images/webelemente/za_{$vk.rufname}.svg" onerror="this.src='/images/webelemente/za_{$vk.rufname}.png'" /></div>
        </h3>
        <div>
            {if $vk.beschr}
            <p>
                {$vk.beschr}
            </p>
            {/if}
        </div>
    {/foreach}
    </div>
{else}
    <table class="versandauswahl">
        <tr>
            <td colspan="3" style="text-align:right;"><b style="color:#666;vertical-align:bottom;">Gesamtzuschlag</td>
        </tr>

        {foreach $versandOptionen AS $vk}

        <tr>
            <td width="15" valign="top">
                <input class="radio_toggle_versand" type="radio" class="radio" id="vInput_{$vk.ID}" name="Versand" value="{$vk.ID}" {$vk.checked} 
                />
            </td>
            <td valign="top" align="left">
                <span class="versandTitle">

                    <label class="toggle_versand" style="cursor:pointer;" for="vInput_{$vk.ID}" id="{$vk.ID}">
                        {$vk.kurz}
                        
                        {if $vk.preis > 0}
                        zzgl. {$vk.preis|money_format}
                        {elseif $vk.preis == 0}
                            
                        {elseif $vk.preis < 0}
                            {$vk.preis|abs}% des Warenwertes
                        {/if}
                        {if $vk.rufname=="nachnahme"}
                        + Nachnahmegeb&uuml;hr, welche vom Auslieferer erhoben wird.
                        {/if}
                        {if $ini.modules.versandkosten_beschreibung == "overlib"}
                            <a style="cursor:pointer;" onmouseover="return overlib('{$vk.beschr}',CAPTION,'{$vk.kurz}', WIDTH, {$ini.modules.parse_desc_width});" onmouseout="nd();">[?]</a>
                        {/if}
                    </label>
                </span>
                {if $ini.modules.versandkosten_beschreibung != "overlib"}
                <div class="versandinfo" id="v_{$vk.ID}">
                    {$vk.beschr}
                </div>
                {/if}
            </td>
            <td style="color:#666;min-width:77px;text-align:right;">
                {$vk.gesamt|money_format}
            </td>
        </tr>

        {/foreach}
</table>
    
<script>
    $('.toggle_versand').click(function()
    {
        var v_id = $(this).attr('id');
        $('.versandinfo').css('display','none');
        $('#v_'+v_id).toggle('slow');
        
    });
    $('.radio_toggle_versand').click(function()
    {
        var v_id = $(this).attr('id');
        v_id=v_id.split("_");
        v_id=v_id[1];
        $('.versandinfo').css('display','none');
        $('#v_'+v_id).toggle('slow');
        
    });

</script>
{/if}
<!-- $Id: update_versand.tpl 2392 2022-10-06 14:16:38Z tiefland $ END -->