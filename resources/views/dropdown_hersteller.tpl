{section loop=$dropdown_hersteller name=d_ind}
{if $dropdown_hersteller[d_ind].typ!=3}
<div style="float:left;">
    <select name="{$dropdown_hersteller[d_ind].name}" id="{$dropdown_hersteller[d_ind].id}" style="width:200px;margin-bottom:5px;">
        <option>Hersteller:</option>
        {html_options options=$dropdown_hersteller[d_ind].options selected=$dropdown_hersteller[d_ind].selected}
    </select>
</div>
{/if}
{/section}