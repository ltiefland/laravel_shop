{extends file="page.tpl"}

{block name="content"}
<script src="/JavaScript/money_format.js" type="text/javascript"></script>
<!-- START Basisartikel -->
{assign var="itemKey" value=$artstaemmeItems|count}
{assign var="item" value=$subdir.items[0]}
{include file="shopposition.tpl" nocache}



<form name="bestellung" action="/" id="basket">
    <input type="hidden" name="confirm" value="true" />
    <input type="hidden" name="buy" value="false" />
    <input type="hidden" name="Menge" value="1" />
    <input type="hidden" name="item" value="{$item->id}" />
    <input type="hidden" name="basket" value="true" />

<!-- ENDE Basisartikel -->
<section id="subdir_info_wrapper" class="konfig_wrapper">
    <div class="inner">
        {if $subdir.name || $subdir.description}
        <div>
            {if $subdir.name}
            <div>
               <h1>{$subdir.name}</h1>
            </div>
            {/if}
            {if $subdir.description}
            <div class="konfig_text">
                    {$subdir.description}
            </div>
            {/if}
        </div>
        {/if}
    </div>
    
    <div class="konfig_basket_button">
        <div class="scroll">
            <div>Dein persönlicher Komplettpreis:</div>
            <div id="orig_preis" style="display:none;">{$item->price[0]->preis}</div>
            <div id="current_preis" style="display:none;">{$item->price[0]->preis}</div>
            <div class="itemPreis" style="clear:both;float:none;margin-top:10px;text-align:right;">
                <span id="itemPreis">{$item->price[0]->preis|money_format|replace:"EUR":"&euro;"}</span>
            </div>
            <div style="clear:both;text-align:right;">
                <br /><font class="msg_small">{$langstrings.shop.price_msg_brutto} <a href="/index.php?mode=versand_uebersicht" style="cursor:pointer;">{$langstrings.shop.price_msg_link}</a></font>
                {if $item->weight > 0}
                   <br /> <font class="msg_small">Versandgewicht: {$item->weight} kg</font>
                {/if}
                {if $item->property_1 == 1}
                    <br /><font class="msg_small">(Speditionsartikel)</font>
                {/if}
                                        
                {if $item->gebinde_menge > 0 && $item->gebinde_einheit}
                    <br /><font class="msg_small">
                    Grundpreis: {$item->price[0]->preis/$item->gebinde_menge|number_format:2} / {$item->gebinde_einheit}
                    </font><br />
                {/if}
            </div>
            
            <div class="add_konfigitem_to_basket"> 
                <div class="basket_text">
                    {$langstrings.shop.in_basket}
                </div>
                <div class="button_inner">
                    <img src="/images/webelemente/icon_warenkorb_weiss.svg" alt="in den Warenkorb" />
                </div>
            </div>   
                    
        </div>
    </div>            
    
</section>

{if $artstaemmeItems||$smarty.get.auspraegung}
<section id="subdir_konfig_wrapper">
    <div class="inner">
        <div class="konfig_box">
            <div class="konfig_menu_container">
                <div class="konfig_menu">
                    {foreach $artstaemmeItems as $key => $artstamm}
                        <div class="konfig_menu_item" data-konfigid="{$artstamm->id}">
                            <div class="selected" id="selected_{$artstamm->id}" title="{$artstamm->name}"><i class="fa fa-check" aria-hidden="true"></i></div>
                            {if $artstamm->medium[1]}
                                <img class="konfig_menu_img" src="/images/upload/{$artstamm->medium[1]->medium->folder}/kl/{$artstamm->medium[1]->medium->name}" alt="{$artstamm->name}" title="{$artstamm->name}">
                            {elseif $artstamm->medium[0]}
                                <img class="konfig_menu_img" src="/images/upload/{$artstamm->medium[0]->medium->folder}/kl/{$artstamm->medium[0]->medium->name}" alt="{$artstamm->name}" title="{$artstamm->name}">
                            {/if}
                        </div>
                    {/foreach}
                </div>
            </div>
            <div class="konfig_items">
            
                {foreach $artstaemmeItems as $key => $artstamm}
                    {$res[] = $artstamm->id}
                    {include file="subdir_artstamm_konfig.tpl" artstamm=$artstamm}
                {/foreach}
            </div>
        </div>
    {$new = implode(",",$res)}
        <input type="hidden" name="orderitems" value="{$new}"/>
    {if $konfig==1}
        <input type="hidden" id="basisartikel" name="basisartikel" value="{$item->id}" />
    {/if}
    <div class="break"></div>
    {if $item->addonitems}
        {assign var="addonitems" value=$item->addonitems}
        {include file="addonItemsKonfig.tpl"}
    {/if}    
    </div>
</section>    
</form>
{/if}
<script>
    $(document).ready(function() {
        $('.konfig_menu_item').on("click",function() {
            $('.konfig_item').css("display","none");
            let id = $(this).data("konfigid");
            $('#konfig_item_'+id).show("fade");
        });
        
        $('.konfig_select_item').on("click",function() {
            let parent = $(this).parent().parent().parent();
            let parentId = parent.attr("id");
            let selecteditem = $(this).data("selecteditem");

            let parentArr = parentId.split("_");
            let menuId = parentArr[2];
            
            $('#'+parentId+' select.select_components option').removeAttr("selected");
            $('#'+parentId+' select.select_components option').each(function() {
                if($(this).val()==selecteditem) {
                    $(this).attr("selected",true);
                }
            });
            
            $('#selected_'+menuId).css("z-index","1");
            $('#'+parentId+' .konfig_select_item').removeClass('konfig_select_active');
            $(this).addClass('konfig_select_active');
            select_konfig_item(this);
        });
    });
    
    /* Funktionen für den Konfigurator */
    function select_konfig_item(item) {
        
        let expl = $(item).data("selecteditem").split("#");

        let id = expl[0];
        let newPreis = 0;
        if(expl[1]) {
            newPreis = parseFloat( expl[1] );    
        }

        let artstammID = expl[2];

        // den zuvor gewählten Preis holen (input hidden)
        let selectedPreis = parseFloat($('#selectedPreis_' + artstammID).val());

        // den aktuellen Preis holen
        let currentPreis = parseFloat($('#current_preis').html());


        // den gewählten Preis in den Zwischenspeicher laden
        $('#selectedPreis_'+artstammID).val(newPreis);
        
        // den neuen Preis berechnen
        // eventuell vorher ausgewählten preis abziehen
        let tempPreis = (currentPreis - selectedPreis);
        newPreis = (tempPreis + newPreis);

        $('#current_preis').html(newPreis);
        $('#itemPreis').html(newPreis.money_format() + " &euro;");


        let varname = "select_" + artstammID;
        let varvalue = id;

        $.get('/setSessionVars?'+varname+'='+varvalue);
    }    
</script>
<style>
    .konfig_wrapper {
        display:flex;
    }
    .konfig_box {
        display:flex;
        border:1px solid #e95801;
    }
    .konfig_box .select_components {
        position:relative;
        z-index:-1;
    }
    .konfig_menu_img {
        width:100px;
        height:100px;
    }
    .konfig_menu_container {
        background: #e95801;
    }
    .konfig_menu {
        display: flex;
        width: 239px;
        
        color: #fff;
        flex-wrap: wrap;
        gap: 20px;
        padding: 20px;
    }
    .konfig_item {
        display:none;
    }
    .konfig_item:first-of-type {
        display:flex;
    }
    .konfig_item .top {
        display:flex;
        gap:40px;
    }
    .konfig_item h2 {
        font-size:1.8rem;
        padding-bottom:20px;
    }
    .konfig_items {
        padding:20px;
        max-width: calc(100% - 305px);        
    }
    .konfig_menu_item {
        border:1px solid #fff;
        width:100px;
        height:100px;
        cursor:pointer;
        display: flex;
        justify-content: center;
        align-items: center;        
    }
    .konfig_menu_item img {
        width:80px;
        height:80px;
    } 
    .konfig_preis {
        font-family:'work_sanssemibold';
        color:#EA5802;
        font-size:1rem;
    }
    .konfig_select_item {
        border:3px solid #f4f4f4;
        cursor:pointer;
        text-align:center;
        max-width:23%;
        padding:0;
        color:#3e3e3e;
        background:#fff;
        display: flex;
        flex-direction: column;
        align-content: center;
        align-items: center;
        justify-content: center;
    }
    .konfig_select_active,
    .konfig_select_item:hover,
    .konfig_select_item:focus {
        border:3px solid #e95801;
    }
    .konfig_item .center {
        display:flex;
        gap:20px;
        flex-wrap:wrap;
        padding:20px 0;
    }
    .konfig_basket_button {
        width: 100%;
        text-align: right;
        padding-right: 1%;
        display: flex;
        align-items: end;
        padding-bottom: 20px;
        justify-content: end;
        margin:20px 0;
    }
    
    .add_konfigitem_to_basket {
        background:#2fbabd;
        color:#fff;
        display:flex;
        justify-content:center;
        align-items:center;
        border-radius:5px;
        padding:10px 20px;
        cursor:pointer;
        margin:20px 0;
    }
    .add_konfigitem_to_basket:hover,
    .add_konfigitem_to_basket:focus {
        background:#9cd9da;
    }
    .add_konfigitem_to_basket img {
        width:30px;
        height:30px;
    }
    #itemPreis {
        font-family:'work_sanssemibold';
        color:#EA5802;
        font-size:1.7rem;
    }
    .selected {
        position:absolute;
        width:100px;
        height:100px;
        background: rgba(255,255,255,.6);
        display:flex;
        justify-content:center;
        align-items:center;
        font-size:4rem;
        z-index:-1;
    }
    .selected .fa {
        color:#76bd37;
    }
    
    @media screen and (max-width:800px) {
        .konfig_wrapper {
            flex-direction:column;
        }
        .konfig_wrapper > div {
            padding:1% 2%;
        }
        .konfig_basket_button {
            width:96%;
        }
        form#basket {
            width:96%;
        }
        .konfig_box {
            flex-direction:column;
        }
        .konfig_menu {
            width:unset;
            gap: 5px;
            padding: 5px;    
        }
        .konfig_menu_item {
            width:auto;
            height:auto;
        }
        .konfig_menu_item img {
            width:55px;
            height:55px;
            margin:2px;
        }
        .konfig_item .center {
            gap:5px;
            padding:5px;
        }
        .konfig_select_item {
            max-width:47%;
        }
        .selected {
            width:55px;
            height:55px;
            font-size:2rem;
        }
        .konfig_items {
            max-width:unset;
            padding:5px;
        }
        .konfig_item h2 {
            font-size:1.2rem;
        }
        
    }
</style>
{/block}
