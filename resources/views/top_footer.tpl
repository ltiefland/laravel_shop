<div class="topfooter">
    <div class="inner">

        <!--<div style="padding-bottom:90px;float:left;width:400px;">
            <img src="/images/webelemente/logo.png" alt="Hazet Freak Logo" /><br /><br />
            <strong>Bitte wenden Sie sich bei allen Fragen an uns.</strong><br />
            <br />
            Hotline: {$ini.infoline} (Mo - Fr 8:00 - 16:30)<br />
            E-Mail: <a href="mailto:{$ini.infoemail}">{$ini.infoemail}</a> (24h / 7 Tage)<br /><br />
            
            {$ini.firma}<br />
            {$ini.fa_strasse}<br />
            {$ini.fa_plz} {$ini.fa_ort}<br />
            &Ouml;ffnungszeiten:<br />
            Mo - Fr 8:00 - 18:00<br />
            Sa 9:00 - 13:00<br />
        </div>-->
        <div class="topfooter_box">
            <div>  
                <div class="head">
                    <h1>Über egesat.de</h1>
                </div>
                <p style="padding:15px 30px 0 0;">
                  
                </p>
            </div>
        </div>
        <div class="topfooter_box">
            <div>  
                <div class="head">
                    <h1 class="bigger" style="padding-top:4px;">Informationen</h1>
                </div>
                <ul>
                    <li><a href="/cms/zahlung-und-versand">Versandkostentabelle</a></li>
                    {$serviceCenterArr[0].serviceCenter}
                </ul>
            </div>
        </div>
        <div class="topfooter_box">
            <div>  
                <div class="head">
                    <h1 class="bigger" style="padding-top:4px;">Kundenservice</h1>
                </div>
                <ul>
                    {$serviceCenterArr[0].serviceCenter}
                </ul>
            </div>
        </div>
        {include file="logistiker.tpl"}
        <div class="topfooter_box">
            <div>  
                <div class="head">
                    <h1 class="bigger" style="padding-top:4px;">Filiale</h1>
                </div>
                <p style="padding:15px 30px 0 0;">
                    {$ini.firma}<br />
                    {$ini.fa_strasse}<br />
                    {$ini.fa_plz} {$ini.fa_ort}<br /><br />
                    
                    {$ini.oeffn|replace:":":":<br />"|replace:",":"<br />"}<br /><br />
                    
                    Tel.: {$ini.infoline}<br />
                    E-Mail: <a href="mailto:{$ini.infoemail}">{$ini.infoemail}</a>
 
                </p>
            </div>
        </div>
        
        
    </div>
</div>  