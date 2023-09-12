{nocache}
<script>
$(document).ready(function(){
    $( ".lastvisited_open" ).dialog({
            modal: false,
            autoOpen: false,
            show: "fade",
            hide: "fade",
            draggable: false,
            resizable: false,
            closeOnEscape: true,
            width:480,
            height:470,
            title:'Zuletzt angesehene Artikel:',
            position: {
                my: "right+7.4% bottom-35",
                at: "event",
                of: ".lastvisited_fixed .opener"
            }
    });
    $( ".lastvisited_fixed .opener" ).click(function() {
        $( ".lastvisited_open" ).dialog( "open" );
        return true;
    });    

    // deleteAllLink - alle loeschen
    $('.deleteAllLink').click(function(){
        $('#session').load("/module/setSessionVars.php?last_visited=false");
        $('.lastvisited_fixed').hide('fade');
        $( ".lastvisited_open" ).dialog( "close" );
    });
    
    // deleteLink - einzeln loeschen
    $('.deleteLink').click(function(){
        var gesamt = $('.item').length;
        var index = $(this).attr("id");
        $('#lvImg_'+index).hide("fade");
        $('#lvImg_'+index).remove();
        $('#lvItem_'+index).hide("fade");
        $('#lvItem_'+index).remove();
        $('#session').load("/module/deleteLastVisitedItem.php?index="+index);
        if(gesamt<=1) {
            $('.deleteAllLink').trigger('click');
        }
    });
});    
</script>
<div class="lastvisited_fixed noprint">
    <div class="itemText">
        Zuletzt gesehen:
    </div>
    <div class="items">
    {foreach $items as $i => $item}
    {if $i==3}
        {break}
    {/if} 
        <div class="itemImg" id="lvImg_{$i}">
            <a href="{$item.itemLink}">
                <img src="{$item.medien[0]->medium.bild_url_mini}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" {/if}/>
            </a>
        </div>
        
    {/foreach}
    </div>
    <div class="opener">
        <img src="/images/webelemente/butt_opener.png" alt="zuletzt angesehene Artikel anzeigen" />
    </div>
</div>

<div class="lastvisited_open" id="test">

    {foreach $items as $i => $item}
    {if $item.preis>0}
        <div class="item" id="lvItem_{$i}">
            <div class="itemImg">
                <a href="{$item.itemLink}">
                    <img src="{$item.medien[0]->medium.bild_url_mini}" {if $item.medien[0]->medium["beschreibung"] != ""}alt="{$item.medien[0]->medium["beschreibung"]}" title="{$item.medien[0]->medium["beschreibung"]}"{else}alt="{$item.kurzbezeichnung}" title="{$item.kurzbezeichnung}" {/if}/>
                </a>
            </div>
            <div class="itemText">
                <h3 class="bezeichnung">
                    <a href="{$item.itemLink}" title="{$item.kurzbezeichnung}">{$item.kurzbezeichnung}</a>
                </h3>
                <span class="preis">
                    <a href="{$item.itemLink}">{$item.preis|money_format|replace:"EUR":"&euro;"}</a>
                </span>
                <div class="buttons">
                    <a class="itemLink" href="{$item.itemLink}">zum Artikel</a>
                    <a class="deleteLink" id="{$i}">l&ouml;schen</a>
                </div>
            </div>
        </div>
    {/if}
    {/foreach}

    <p style="font-size:12px;">In dieser Liste werden bis zu {$ini.maxLV} zuletzt angesehene Artikel gespeichert. 
    <p style="float:right;texta:align:right;"><a class="deleteAllLink">Alle l&ouml;schen</a></p>
</div>
{/nocache}