
{if $item.preis1 > 0}
<!-- ANFANG Artikel -->
<div class="box_2" >
    <div class="box_top">
        <h1 style="padding:0px !important;"><a href="{$item.itemLink}">{$item.kurzbezeichnung}</a></h1>
    </div>

    <div class="box_middle" style="position: relative;">
        <div class="box_item_img">
            <div class="neu_icon_item">
                {$item.NEU}
            </div>
            <div class="big_img">
                <a href="{$item.itemLink}" title="Zum Artikel {$item.kurzbezeichnung}">
                 
                <img src="{$item.medien[0]->medium.bild_url_klein}" alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" />
                
                </a>
            </div>
            <div class="small_img">
            <a href="{$item.itemLink}"><img src="{$item.medien[0]->medium.bild_url_mini}" alt="{$item.kurzbezeichnung}" title="Zum Artikel {$item.kurzbezeichnung}" align="top" /></a>
            </div>
        </div>
        <div class="box_item_text">
            
            <a href="{$item.itemLink}" title="Zum Artikel {$item.kurzbezeichnung}">
            <p class="box_desc" style="cursor:pointer;">
                {if $item.langbezeichnung}
                    {$item.langbezeichnung}<br />
                {/if}
                {$item.teaser}
            </p></a>
        </div>
        <div class="box_item_text2">
    
            <div class="liefer_{$item.LieferstatusValue}">{include file="lieferstatus.tpl"}</div>
            <div class="itemPreis">
                {$item.preis|money_format|replace:"EUR":"&euro;"}<br />
                <div class="box_singleitem_preis_message grey">
                {if $item.gebinde_menge > 0 && $item.gebinde_menge!=1 && $item.gebinde_einheit}
                  
                Grundpreis: {($item.preis/$item.gebinde_menge)|number_format:2} €/{$item.preis_einheit}<br>
                {/if}
                {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                {$langstrings.shop.price_msg} 
                {else}
                {$langstrings.shop.price_msg_brutto}
                {/if}
                <a style="cursor:pointer;" onmouseover="return overlib('{$item.versandkosten_overlib}', CAPTION, '{$langstrings.item.vk_head}', HAUTO, VAUTO, WIDTH, 300);" onmouseout="return nd();">{$langstrings.shop.price_msg_link}</a>
                </div>
                
            </div>            

            {if $item.Eigenschaft_7 && $item.billigerLink}
                <div class="billiger"><a href="{$item.itemLink}{$item.billigerLink}" title="Zum Artikel {$item.kurzbezeichnung}"><img src="/images/webelemente/butt_billiger.png" alt="billiger gesehen" /></a>
                </div>
            {/if}
            
        </div>
        <div class="item_left">
            <div class="box_logo">
            {$item.hersteller_Logo1}
            </div>

            {if $item.eigenschaften}
            <div class="item_popup">
            <a style="cursor:help;" {popup text=$item.eigenschaften caption=$item.kurzbezeichnung|replace:"\\":"/" sticky=false vauto hauto}>- Techn. Daten</a>
            </div>
            {/if}


            {if $item.energielabel}
            <div class="item_popup">
            <a style="cursor:help;" {popup text=$item.eulabel caption=$item.kurzbezeichnung|replace:"\\":"/" sticky=false vauto hauto}>- EU-Label</a>
            </div>
            {/if}

        </div>
        

        
        <div class="box_item_name"><a href="{$item.itemLink}" title="Zum Artikel {$item.kurzbezeichnung}">{$item.kurzbezeichnung}</a></div>
        
            
    </div>

    <div class="item_big_link">
        {if $item.garantie_verf}
        <img src="/images/garantie/stern_artikeluebersicht.gif" alt="5 Jahre Ger&auml;teschutz m&ouml;glich!" title="5 Jahre Ger&auml;teschutz m&ouml;glich!">
        {/if}
    </div>
    {if $item.nachlass > 0}
    <div style="position:absolute;margin:80px 0 0 105px;">
    {include file="nachlass.tpl" format="kl" preis=$item.nachlass}
    </div>
    {/if}
</div>
<!-- ENDE Artikel -->
{/if}