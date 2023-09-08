<div class="subdir_artikel_wrapper">
{if $paginate.total > 0}
    {if $smarty.const.USE_SMARTY_PAGINATE===true}
        {include file="pagination.tpl"}
    {/if}
    {if $ini.subdir.switch_css==1}
        {include file="switch_css.tpl"}
    {/if}
    <div class="box_static">
        <div class="box_top search_result_msg">
            <span>
            {if $smarty.const.USE_SMARTY_PAGINATE===false && $search_result.gesCount > 300}
                Zu viele Ergebnisse! Bitte Suche einschr&auml;nken!
            {else}
                Ihre Suche nach "{$smarty.get.search}" ergab folgendes Ergebnis:<br>
            {/if}
            </span>
        </div>
    </div>
    <div class="subdir_artikel">
        {section loop=$search_result.items name=s_ind}
            {if $search_result.data[s_ind].template=="item"}
                {if $search_result.items[s_ind] && $search_result.items[s_ind].preis > 0}
                    {cycle values="cleft,ccenter,cright" assign=class}
                    {include file="item_small.tpl" item=$search_result.items[s_ind]}
                {/if}
            {elseif $search_result.items[s_ind].template=="itemContainer"}
                {include file="subdir_artstamm.tpl" artstamm=$search_result.items[s_ind]}
            {/if}
        {/section}
        <div class="break"></div>
        {if $smarty.const.USE_SMARTY_PAGINATE===true}
            {include file="pagination.tpl"}
        {/if}
    </div>
{else}
    <div class="box_static">
        <div class="box_top">
            <h1 >Suche erfolglos</h1>
        </div>
        <div class="bestellvorgang">
            <p>
                {if $search_string_too_short} 
                    {$search_string_too_short}
                {else}
                Ihre Suche nach "{$smarty.get.search}" ergab leider kein Ergebnis!
                <br>
                Bitte prüfen Sie Ihre Eingabe.
                {/if}
            </p>
        </div>
    </div>
{/if}
</div>