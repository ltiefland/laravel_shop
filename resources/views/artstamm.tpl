{extends file="page.tpl"}
{block name="content"}
<style>
    .zoomWrapper{
        border: none;
    }
    .ui-widget-header {
        background-image:none!important;
    }
</style>
{include file="shopposition.tpl"}
<div class="box_2">
    <div class="box_top">
        <div class="itemTopContainer">
            <h1>{$subdir.name} {$subdir.kennung}</h1>
        </div>
    </div>
    <div class="box_middle">
        <div class="item_top">
            <div class="itemLeftContainer" style="min-height:450px;">
                {include file="artstamm_artikelBild.tpl"}
            </div>
            <div class="itemRightContainer">
                {if $subdir.manufacturer.logo1}
                <span style="float: left;"><img src="/images/manufacturer/1/{$subdir.manufacturer.logo1}"></span>
                {/if}
                <div class="itemTopSection">
                    {if isset($subdir.description2)}<span>{$subdir.description2}</span>{/if}
                </div>
                
                <div class="itemRightLeft">
                    {if $dropdown_opts}
                    <div class="options">
                        <form id="modellForm">
                            {include file="dropdown_options.tpl"}
                            <input type="reset" value="zur&uuml;cksetzen" id="resetForm" />
                            <input type="hidden" name="Father" value="{$artstamm.ID}" />
                        </form>
                    </div>
                    {/if}
                    {if $subdir.bestand}
                    <div class="liefer_0">
                        <input type="hidden" id="bestand" name="bestand" value="{$artstamm.bestand}" />
                        Auf Lager: 
                        {if $subdir.bestand>=50}
                            > 50 Stk.
                        {else}
                            {$subdir.bestand} Stk.
                        {/if}
                        {if $subdir.bestandsdatum}
                            <br />Stand: {$subdir.bestandsdatum} Uhr
                        {/if} 
                    </div>           
                    {/if}      
                    {if $subdir.Eigenschaft_2_text}
                    <div>{$subdir.Eigenschaft_2_text}</div>
                    {/if}
                    
                    <div class="basketReload">
                        {*include file="artstamm_basket.tpl"*}
                    </div>
                </div>
            </div>   
        </div>
        {if $subdir.items != ""}
        <div id="artikel">
            {include file="artstamm_artikel.tpl"}    
        </div>
        {/if}
    </div>
    <div id="reiter" style="float:left;">
        <ul>
            {section loop=$subdir.reiter name=r_ind}
            {if $subdir.reiter[r_ind].name}
            <li>
                <a href="/module/reiter/{$subdir.reiter[r_ind].url}.php?item={$subdir.id}">{$subdir.reiter[r_ind].name}</a>
            </li>
            {/if}
            {/section}
        </ul>
    </div>
    <div class="break"></div>
</div>
   

    
{if $subdir.items[0].addonItems}
    {include file="addonItems.tpl" addonitems=$subdir.items[0].addonItems}
{/if}
<div class="break"></div>
<script>
    $(document).ready(function(){
        zoomType = 'inner';
        {if $smarty.session.isMobile == true}
        zoomType='inner';
        {/if}
        initElevateZoom(zoomType);
    });
</script>
{/block}
