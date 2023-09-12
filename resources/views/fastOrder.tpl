<!-- fastOrder.tpl -->
{if $smarty.session.SHOP.buy.Persdata.Status >= 1}
<script type="text/javascript" src="/JavaScript/DataTables-1.10.5/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/JavaScript/DataTables-1.10.5/extensions/TableTools/js/dataTables.tableTools.js"></script>
<script type="text/javascript" src="/JavaScript/DataTables-1.10.5/plugins/sorting/date-de.js"></script>
<script type="text/javascript" src="/JavaScript/DataTables-1.10.5/plugins/sorting/numeric-comma.js"></script>
<link rel="stylesheet" type="text/css" href="/JavaScript/DataTables-1.10.5/media/css/jquery.dataTables.css" /> 
<link rel="stylesheet" type="text/css" href="/JavaScript/DataTables-1.10.5/extensions/TableTools/css/dataTables.tableTools.css" />
<style>
    .schnellBestellenMenu button{
        padding: 2%;
    }
    .dataTables_wrapper{
        margin: 1% 0; 
    }
</style>
<script>
	$(document).ready(function() {
        tableTabs = intTable( "#tabsBasket .schnellBestellenMenu .artikeluebersicht" );
		tableAccordion = intTable( "#accordionBasket .schnellBestellenMenu .artikeluebersicht" );
        
        $('#tabsBasket .schnellBestellenMenu button').click( function() {
            var data = tableTabs.$('input').serialize();
            add_item_from_fastOrder( data );
            return false;
        });
        
        $('#accordionBasket .schnellBestellenMenu button').click( function() {
            var data = tableAccordion.$('input').serialize();
            add_item_from_fastOrder( data );
            return false;
        });
               
	});
    function intTable( selector ){
        table = $(selector).DataTable({
            "columnDefs": [
                {
                    "targets": [ 0,1,2,3,4,5,6 ],
                    "orderable": false,     
                },
                {
                    "visible": false, "targets": 0
                },
            ],
            
            "order": [ 1, 'asc' ],
            
            "lengthMenu": [[-1,24, 48, 96], ["Alle",24, 48, 96]],
			"language": {
				"sEmptyTable": "Keine Daten in der Tabelle vorhanden",
				"sInfo": "_START_ bis _END_ von _TOTAL_ Eintr&auml;gen",
				"sInfoEmpty": "0 bis 0 von 0 Eintr&auml;gen",
				"sInfoFiltered": "(gefiltert von _MAX_ Eintr&auml;gen)",
				"sInfoPostFix": "",
				"sInfoThousands": ".",
				"sLengthMenu": "_MENU_ Eintr&auml;ge anzeigen",
				"sLoadingRecords": "Wird geladen...",
				"sProcessing": "Bitte warten...",
				"sSearch": "Suchen",
				"sZeroRecords": "Keine Eintr&auml;ge vorhanden.",
				"oPaginate": {
					"sFirst": "Erste",
					"sPrevious": "Zur&uuml;ck",
					"sNext": "N&auml;chste",
					"sLast": "Letzte"
				},
				"oAria": {
					"sSortAscending": ": aktivieren, um Spalte aufsteigend zu sortieren",
					"sSortDescending": ": aktivieren, um Spalte absteigend zu sortieren",
				},
			},
            "drawCallback": function ( settings ) {
                var api = this.api();
                var rows = api.rows(  { page:'current' } ).nodes();
                var last=null;
     
                api.column(0, { page:'current' } ).data().each( function ( group, i ) {
                    if ( last !== group ) {
                        $(rows).eq( i ).before(
                            '<tr class="group"><td colspan="2"><b>'+group+'</b></td><td></td><td colspan="2" style="text-align: right;"><button>Artikel in den Warenkorb legen</button></td><td></td></tr>'
                        );
     
                        last = group;
                    }
                } );
            }
        });
        if($('#loading').is(':visible')==true) {
            $('#loading').dialog("close");    
        }
        return table;
    }
</script>
  
<div style="padding: 1% 0 2%;line-height: 1.5em;">{$langstrings.login.fastOrderInfo}</div>
<table class="artikeluebersicht display hover" cellspacing="0" width="100%" border="0">

	<thead>
		<tr>
            <th>Ordner</th>
            <th style="display:none;">&nbsp;</th>
            <th>&nbsp;</th>
            <th>Artikelname</th>
            <th>Menge</th>
            <th>Preis</th>
            <th></th>
		</tr>
	</thead>
    
    <tbody>
        {foreach $directories as $directoryID => $directoryName}
            {assign var="counter" value=0}
            {foreach $directoriesArtikel[$directoryID] as $artikelData}
                {if $artikelData["preis"] > 0}
                {if $artikelData.Artikelstamm!=NULL}
                <tr>
                    <td>
                        {$directoryName}
                    </td> 
                    <td style="display:none;">
                        {$kennung[$directoryID]}
                    </td>
                    {if $counter == 0} 
                    <td rowspan="{$directoriesArtikel[$directoryID]|count}" style="max-width:180px;">
                        {if isset($artikelData.medien[0]->medium.bild_url_br) && $artikelData.medien[0]->medium.bild_url_br != ""}
                            <img src="{$artikelData.medien[0]->medium.bild_url_br}" alt="Artikelbild" style="width:100%;max-width:170px;"/>
                        {/if}
                    </td>
                    <td>{$artikelData["kurzbezeichnung"]}</td>
                    {/if}
                    {if $counter != 0} 
                    <td style="display: none;"></td>
                    <td>{$artikelData["kurzbezeichnung"]}</td>
                    {/if}
                    <td>
                        <div class="mengen_input"> 
                          {if !$smarty.session.SHOP.BASKET}
                             {$value = 0}  
                             {else}     
                          {foreach $smarty.session.SHOP.BASKET as $key => $row}
                              {if $row.ID == $artikelData.ID}
                                  {$value = $row.Menge}     
                                  {break}
                              {else}    
                                   {$value = 0}  
                              {/if}                   
                          {/foreach}
                          {/if}
                              <input class="mengeninput" type="text" name="{$artikelData.ID}" value="{$value}" />
                        </div>
                    </td>
                    <td>
                        {$artikelData["preis"]|money_format|replace:"EUR":"&euro;"}
                        {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                        zzgl. MwSt, 
                        {else}
                        inkl. MwSt,
                        {/if}
                         zzgl. Versand
                    </td>
                    <td class="artikelID" id="{$artikelData['ID']}">
                        {* Ausgabe: Menge der zuletzt gekauften Artikel (90 Tage) *}
                    </td>
                </tr>
                {else}
                <tr>
                    <td>{$directoryName}</td> 

                    <td style="display:none;">{$kennung[$directoryID]}</td> 
                     
                    <td style="max-width:180px;">
                        {if isset($artikelData.medien[0]->medium.bild_url_br) && $artikelData.medien[0]->medium.bild_url_br != ""}
                            <img src="{$artikelData.medien[0]->medium.bild_url_br}" alt="Artikelbild" style="width:100%;max-width:170px;"/>
                        {/if}
                    </td>
                    <td>{$artikelData["kurzbezeichnung"]}</td>

                    <td>
                        <div class="mengen_input"> 
                            {if !$smarty.session.SHOP.BASKET}
                             {$value = 0}  
                             {else}   
                            {foreach $smarty.session.SHOP.BASKET as $key => $row}
                              {if $row.ID == $artikelData.ID}
                                  {$value = $row.Menge}     
                                  {break}
                              {else}    
                                   {$value = 0}  
                              {/if}                   
                          {/foreach}
                          {/if}
                            <input class="mengeninput" type="text" name="{$artikelData.ID}" value="{$value}" />
                        </div>
                    </td>
                    <td>
                        {$artikelData["preis"]|money_format|replace:"EUR":"&euro;"}
                        {if ( isset( $smarty.session.netto_preis ) && $smarty.session.netto_preis == true ) || $ini.netto_preise == true}
                        zzgl. MwSt, 
                        {else}
                        inkl. MwSt,
                        {/if}
                         zzgl. Versand
                    </td>
                    <td class="artikelID" id="{$artikelData['ID']}">--</td>
                </tr>
                {/if}
                {assign var="counter" value=$counter + 1}
                {/if}
                
                
            {/foreach} 
        {/foreach}
    </tbody>
</table>
{else}
    {$langstrings.login.fastOrderInfoLogin}
{/if}

<script>

$(document).ready(function(){
    $('.artikelID').each(function(){
        var trgt = $(this);
        var id = $(this).attr('id');
        var posting = $.post("/module/getGekaufteArtikel.php", { artikel:id } );
        posting.done(function(data){
            $('#' + id).html(data);
        });
    });
});
</script>
<!-- /fastOrder.tpl -->