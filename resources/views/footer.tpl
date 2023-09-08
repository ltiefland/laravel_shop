<!-- $Id: footer.tpl 2999 2023-01-09 07:58:48Z erling $ BEGIN -->
{if $ini.trustPilot.aktiv==1}
<div class="topfooter">
    <div class="inner">
        {include file="trustpilot.tpl"}
    </div>
</div>
{/if}

<div class="topfooter bg01">
    <div class="inner">
            <div class="service_center">
                <div>
                    <div class="service_center_text">
                        <p>Wir haben noch mehr zu bieten.<br />
                        Besuche auch unsere anderen Online-Shops:
                        <div class="shoplogos">
                            <a href="https://www.marine-sales.de" target="_blank"><img src="/images/webelemente/logo_marinesales.png" alt="Marine-Sales Logo"></a>
                            <a href="https://www.zeldi.de" target="_blank">
                                <img src="/images/webelemente/logo_zeldi.png" alt="Zeldi Logo">
                             </a>
                        </div>
                        </p>
                    </div>
                    
                    <div class="head">Besuche uns auch bei:</div>
                    <div class="social">
                        <a href="https://www.facebook.com/FaltradXXS/" target="_blank"><img src="/images/webelemente/Icon_Facebook.svg" alt="Facebook"></a>
                        <a href="https://www.youtube.com/user/marinesalesde" target="_blank"><img src="/images/webelemente/Icon_YouTube.svg" alt="youtube"></a>
                        <a href="https://www.instagram.com/faltradxxs.de/" target="_blank"><img src="/images/webelemente/Icon_Instagram.svg" alt="Instagram"></a>
                        <br /><br />
                    </div>
                    
                    <div class="head" style="margin-top:20px;">Partner</div>
                    <div class="social idealo">
                        <a href="https://www.idealo.de/preisvergleich/Shop/288062.html" target="_blank"><img src="/images/webelemente/s1_rating_extern2.png" alt="gelistet bei www.idealo.de"/></a>                        
                    </div>
                    

                </div>

                <div>
                    <div class="head">
                        Zahlung und Sicherheit
                    </div>
                    <div class="service_center_text">
                        Bei FaltradXXS kannst du aus folgenden Zahlungsarten wählen:
                        {include file="zahlarten.tpl"}
                    </div>
                </div>
                <div>
                    <div class="head">
                        Service
                    </div>
                    <div class="service_center_text">
                        <ul class="service_center_menu">
                            <li><a href="/versand_uebersicht.html">Versandkostentabelle</a></li>
                            <li><a href="https://www.faltradxxs.de/blog/" target="_blank">Blog</a></li>
                            {$serviceCenterMenu}
                        </ul>
                    </div>
                </div>
            </div>
            
            {*
            <div class="kontakt">
                <div class="head">
                    Kontakt
                </div>
                <div class="service_center_text">
                    <p>Sie wollen mehr erfahren? Unser kompetentes Team beantwortet Ihnen gerne jede Frage.</p>
                    
                    <p style="text-indent:20px;"><strong><a href="tel:{$ini.infoline}">{$ini.infoline}</a></strong></p>
                    
                    <p style="text-indent:20px;"><strong><a href="mailto:{$ini.infoemail}">{$ini.infoemail}</a></strong></p>
                    <br />
                    
                    {include file="newsletter_anmeldung.tpl"}
                    
                </div>
            </div>
            *}
    </div>
</div>


<div class="bottomfooter">
    <div class="inner">
        <div class="footernav">

        <span>&copy; {$ini.firma}, {$year} - Alle Rechte vorbehalten.</span>
        <span>Shopsystem: <a href="http://www.weban.de/shop-system/" target="_blank" title="Zur WEBAN UG">WEBAN<strong>OS</strong></a>, <a href="http://www.weban.de" target="_blank" title="Zur WEBAN UG">WEB<strong>AN</strong>&nbsp;UG</a></span>

            
            
             
             
        </div>
    </div>
</div>
{if $smarty.session.isMobile==1}
<script>
    $(document).ready(function(){
        $(".head").click(function() {
           $(this).next().toggle();
        });
    });
</script>
{/if}
<style>
.idealo img {
    width:70px;
    height:70px;
}
</style>
<!-- $Id: footer.tpl 2999 2023-01-09 07:58:48Z erling $ END -->