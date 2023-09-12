{if $ini.service_center_typo3==1}
    <div class="box_1">
        <div class="box_top"><img src="/images/webelemente/butt_info.gif" /></div>
        <div class="box_middle">
            <ul class="right_service_center">
                <li><a href="/cms/zahlung-und-versand/">Versand- und Zahlungsarten</a></li>
                <li>{$serviceCenter.serviceCenter} </li>
            </ul>
            <br>
            <p style="font-size:0.7em;">
            KONTAKT:<br>
            {$ini.firma}<br>
            {$ini.fa_strasse}<br>
            {$ini.fa_plz} {$ini.fa_ort}<br>
            Tel.: {$ini.infoline}<br>
            E-Mail: {$ini.infoemail}<br><br>
            
            &Ouml;FFNUNGSZEITEN:<br>
            Mo-Fr: 9:00 - 18:30 Uhr<br>
            Sa: 9:00 - 13:30 Uhr
            </p>
        </div>
    </div>            
{else}
    <div class="box_1">
        <div class="box_top">Service Center</div>
        <div class="box_middle">
            <ul>
                <li>deaktiviert.</li>
            </ul>
        </div>
    </div>            

{/if}