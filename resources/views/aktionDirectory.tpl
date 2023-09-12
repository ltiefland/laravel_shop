<div class="directory_box">
    <div class="top">
            <div class="bild">
            <a href="{$item.dirLink}" title="Zum {$item.Name}">
                {if $item.medien[0]->medium.bild_url_br}
                <img src="{$item.medien[0]->medium.bild_url_br}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" {/if} />
                {else}
                <img src="/images/webelemente/noPicture.gif" alt="kein Bild vorhanden" />
                {/if}
            </a>
            </div>
        
    </div>    
    <div class="bottom">
        <div class="itemLink">
            <a href="{$item["dirLink"]}" title="Zu {$item["Name"]}"> 
                <span>
                    <img src="/images/webelemente/icon_link_right.png" alt="Pfeil rechts" />
                </span> Jetzt ansehen
            </a>
        </div>    
    </div>
</div>