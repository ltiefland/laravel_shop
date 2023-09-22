{extends file="page.tpl"}
{block name=content}
    <!-- $Id$ BEGIN -->
    <div class="box_static">
        {if $hersteller->Bezeichnung}
            {assign var=herstellerName value=$hersteller->Bezeichnung}
        {else}
            {assign var=herstellerName value=$hersteller->name}
        {/if}

        <div class="box_middle">
            <div class="hLogo" style="padding:2%;">
                {if $hersteller->Logo2}
                    {if $hersteller->Logo2_href}<a href="{$hersteller->Logo2_href}">{/if}
                    <img src="/images/Hersteller/2/{$hersteller->Logo2}" alt="{$herstellerName}" title="{$herstellerName}" />
                    {if $hersteller->Logo2_href}</a>{/if}
                {else}
                    {if $hersteller->Logo1}
                        {if $hersteller->Logo1_href}<a href="{$hersteller->Logo1_href}">{/if}
                        <img src="/images/Hersteller/1/{$hersteller->Logo1}" alt="{$herstellerName}" title="{$herstellerName}" />
                        {if $hersteller->Logo1_href}</a>{/if}
                    {/if}
                {/if}
            </div>
            <div class="hText">
                <h1>{$herstellerName}</h1>
                {if $hersteller->Text}
                    <p>{$hersteller->Text|nl2br}</p>
                {/if}
                {if $hersteller->Text3}
                    <p>&nbsp;</p>
                    <p>{$hersteller->Text3}</p>
                {/if}
                </div>
                <div class="back" style="padding:2%;">
                    <a href="javascript:history.back();">
                        <img src="/images/webelemente/butt_zurueck.png" alt="zur&uuml;ck" />
                    </a>
                </div>
        </div>
    </div>


    <div class="hersteller_menu">
    {foreach $item_kats as $kat}
    <div class="herstellerKats" style="clear:both;float:none;background-color:#fff;">
           <span class='breadcrumb-trenner' style="color:#666;"> &raquo; </span>
            {$kat}
    </div>
    {/foreach}
    </div>

    {if $smarty.get.serviceCenter!=1}
    <div class="subdir_artikel_wrapper">
        {if $smarty.get.kat}
            <span style="color:#666;font-size:0.9em;">

            {$katIDs[$smarty.get.kat]} von {$herstellerName}
            </span><br /><br />
        {/if}

        {if $smarty.const.USE_SMARTY_PAGINATE===true}
        {include file="pagination.tpl"}
        {/if}
        {if $ini.subdir.switch_css==1}
            {include file="switch_css.tpl"}
        {/if}

        <div class="subdir_artikel">
        {foreach $items as $item}
            {if $item.preis > 0}

            {include file="item_small.tpl"  inline}
            {/if}
        {/foreach}
        </div>

        {if $smarty.const.USE_SMARTY_PAGINATE===true}
        {include file="pagination.tpl"}
        {/if}
    </div>
    {/if}

    <div class="break"></div>
<!-- $Id$ END -->
{/block}
