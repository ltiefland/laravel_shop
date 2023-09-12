{if $pagetype != "Itemseite" && !$smarty.get.item }
<div class="leftcontent">
    <!--leftcontent-->
    {if ( $smarty.get.navigation && !$isArtikelstamm ) }
        <div class="startseite" style="width:174px;">
            <div class="box subdir_info" style="border:none;">{$subdir["Beschreibung"]}</div>
        </div>
    {else}
        {include file="news.tpl" news=$smarty.session.news}
        {include file="sonderkasten_left.tpl"}
    {/if}
</div>
{/if}