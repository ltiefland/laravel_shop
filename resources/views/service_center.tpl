{if $ini.typo3.aktiv==1}
    <div class="box_1">
        <div class="box_top">
            {$langstrings.shop.service}
        </div>
        <div class="box_middle">
            <div class="inner padding">
                <ul class="service_center">
                    <li><a href="/html/katalog.htm">Katalogbestellung</a></li>
                    <li><a href="/cms/zahlung-und-versand/">Versand- und Zahlarten</a></li>
                    
                    <li>{$serviceCenter.serviceCenter} </li>
                </ul>
            </div>
        </div>
    </div>            
{else}
    <div class="box_1">
        <div class="box_top">
            {$langstrings.shop.service}
        </div>
        <div class="box_middle">
            <div class="inner padding">
                <ul>
                    <li style="list-style-type:none;">typo3 deaktiviert.</li>
                </ul>
            </div>
        </div>
    </div>            

{/if}