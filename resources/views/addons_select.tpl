{if $ini.modules.quickview==1}
<style>
.quickview_dlg {
    clear:both;
    float:none;
    display:none;
}
</style>
<script>
    $(document).ready(function(){

        $('.quickview_opener').click(function(event){
            var id = $(this).attr("id");
            id = id.split("_");
            id = id[1];

            $('#quickview_' + id).dialog({
                width:'80%',
                create: function( event, ui ) {
                    // Set maxWidth
                    $(this).closest(".ui-dialog").css("maxWidth", "900px");
                    $(this).closest(".ui-dialog").css("position", "fixed");
                }
            });
        });

    });
</script>
{/if}
{* /quickview dialog *}
<style>
.product_accordion_top div {
    padding: 0 !important;
}

.product_accordion {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
    border-bottom: 1px solid rgb(170,170,170);
    margin-bottom: 1%;
    min-height: 52px;
}

.product_accordion img {
    width: 55px;
}
.product_accordion p {
    font-size: 11px;
}

div.product_accordion:last-child {
    border: 0;
    margin-bottom: 0;
}

.product_accordion .products_checkbox,
.product_accordion .product_accordion_picture,
.product_accordion .quickview_opener {
    flex-grow: 1;
    display:flex;
    justify-content: center;
    align-items: center;
}

.product_accordion .product_accordion_info {
    flex-grow: 2;
    display:flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.product_accordion .product_accordion_info p {
    line-height: 18px;
    width: 100%;
}

.product_accordion .quickview_opener {
    cursor: pointer;
}

/* NEW VERSION */
.addons_select {
    max-width:93%;
}
.addons_select details {
    background-color: rgb(255, 255, 255, 1);
    border: 1px solid black;
    border-radius:5px;
    margin:2% 0;
}

.addons_select details summary {
    background-color: rgb(240, 240, 240, 1);
    padding: 10px;
    font-size: 19px;
    font-family: 'oswaldmedium';
    -webkit-touch-callout: none; /* IOS NEEDS TESTING K�nnte dazu f�hren das auf dem Element kein Input angenommen wird */
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    cursor: pointer;
    border-radius:5px;
}

.addons_select details summary:focus {
    border: 0;
    outline: 0;
    border-radius: 5px;
}

.addons_select details summary::-webkit-details-marker {
    /*display: none;*/
}

.addons_select details .product_wrapper .product {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    padding: 10px;
    border-top: 1px solid rgb(134, 134, 134);
    min-height: 50px;
    height: 100%;
}

.addons_select details .product_wrapper .product .checkbox {
    margin: 0 10px 0 0;
}

.addons_select details .product_wrapper .product label {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: start;
    flex-grow: 2;
}

.addons_select details .product_wrapper .product label .image img {
    width: 55px;
}

.addons_select details .product_wrapper .product label .informations {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: start;
}

.addons_select details .product_wrapper .product label .informations p {
    width: 100%;
    padding-left: 20px;
    padding-right: 10px;
}

.addons_select details .product_wrapper .product label .informations p.price {
    color: rgb(24, 24, 24);
}

.addons_select details .product_wrapper .product div .ui-icon,
.addons_select details .product_wrapper .product label,
.addons_select details .product_wrapper .product .checkbox {
    cursor: pointer;
}

</style>
<script>
  $( function() {
    $( "#product_accordion_top" ).accordion({
      collapsible: true
    });
  } );
  </script>

{if $addons|is_array}<br />
<h3>Passendes Zubeh&ouml;r</h3>
<div class="addons_select">
    {foreach $addons as $cnt => $alladdons}
        {assign var="i" value=0}
        {foreach $alladdons as $fatherID => $addonitems}
        <details>
            <summary>{$addonitems[0].FatherName}</summary>
            <div class="product_wrapper">
                {foreach $addonitems as $itemID => $addonitem}
                <div class="product" id="product_{$itemID}">
                    <input type="checkbox" class="checkbox" name="basket_addons[{$addonitem.ID}]" value="{$addonitem.ID}" id="product_{$addonitem.ID}" />
                    <label for="product_{$addonitem.ID}">
                        <div class="image">
                            <img src="{$addonitem.medien[0]->medium.bild_url_mini}" />
                        </div>
                        <div class="informations">
                            <p class="name" title="{$addonitem.name}">{$addonitem.name}</p>
                            <p class="price">{$addonitem.preis1|money_format}</p>
                        </div>
                    </label>
                    {if $ini.modules.quickview==1}
                        <!-- quickview opener -->
                        <div class="quickview_opener" id="qv_{$addonitem.ID}">
                            <span id="product_quick_info" class="ui-icon ui-icon-info"></span>
                        </div>
                        <div class="quickview_dlg" id="quickview_{$addonitem.ID}">
                            {include file="item_quickview.tpl" item=$addonitem}
                        </div>
                    {/if}
                </div>
                {/foreach}
            </div>
        </details>
        {/foreach}
    {/foreach}
</div>
{/if}
<!--
<option value="{$fatherID}###{$addonitem.ID}###{$addonitem.name|utf8_encode}{if $addonitem.beschreibung}###{$addonitem.beschreibung|utf8_encode|replace:'"':''}{else}###keine Beschreibung{/if}###{$addonitem.bild_1_url}###{$addonitem.preis1}###{$addonitem.preis1|money_format}">{$addonitem.name|utf8_encode} - {$addonitem.preis1|money_format}</option>
<option value="{$fatherID}###{$addonitem.ID}###{$addonitem.kurzbezeichnung_erweitert}{if $addonitem.beschreibung}###{$addonitem.beschreibung|utf8_encode|replace:'"':''}{else}###keine Beschreibung{/if}###{$addonitem.bild_1_url_mini}###{$addonitem.preis1}###{$addonitem.preis1|money_format}">{$addonitem.kurzbezeichnung_erweitert} - {$addonitem.preis1|money_format}</option>
-->

