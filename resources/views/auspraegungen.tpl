{if $dropdown_opts|count>0 || $bool_opts|count>0 || isset($subdir.hersteller)}
<div class="optionsReload">
    {include file="auspraegung_auswahl.tpl" nocache}
</div>
{/if}