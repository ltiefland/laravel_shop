<script>
$(document).ready(function(){
    $('.sort').change(function(){
        var sort = $(this).val();
        var href = window.location.href.split('?');
        if(href.length>1) {
            if( href[1].match("search") ) {
                var search = $(".searchValue").val();
                window.location.href = href[0] + "?search="+ search +"&sort="+sort;    
            }else{
                window.location.href = href[0] + "?sort="+sort;
            } 
            
         }else{
                window.location.href = href[0] + "?sort="+sort;
         }
    });
});
</script>
<div class="pagination_container">
    
        <label>Sortieren:&nbsp;</label>
        {if $smarty.session.sort}
            {assign var="sort" value=$smarty.session.sort}
        {/if}
        <select name="sort" class="sort">
            <option {if $sort=="beliebt" || !$smarty.get.sort}selected='selected'{/if} value="beliebt">nach Beliebtheit</option>
            <option {if $sort=="rel"}selected='selected'{/if} value="rel">nach Relevanz</option>
            <option {if $sort=="desc"}selected='selected'{/if} value="desc">Preis absteigend</option>
            <option {if $sort=="asc"}selected='selected'{/if} value="asc">Preis aufsteigend</option>
        </select>
        <input type="hidden" class="searchValue" value="{$smarty.get.search}" />
    
    <div>
        <div class="p_artikel"> Artikel {$paginate.first|default:0} - {$paginate.last} ({$paginate.total} Gesamt)
                <div class="pagination_artikelproseite">
                {$langstrings.pagination.items_per_page}
                {foreach $limits as $limit}
                    {if $smarty.session.Paginate.limit!=$limit}
                        {if $sp_url|strpos:"?"}
                            <a href="{$sp_url}&limit={$limit}">{$limit}</a>
                        {else}
                            <a href="{$sp_url}?limit={$limit}">{$limit}</a>
                        {/if}
                    {else}
                        {$limit}
                    {/if}
                    {if !$limit@last} | {/if}
                {/foreach}
                </div>
            
        </div>
    </div>
    <div>  
        <div class="p_page"> 
            Seite:
            {if $paginate.page_current > 1}
            <span>{paginate_first class="pagination"}</span>
            {/if}
            <span class="active">{paginate_middle format="page" class="pagination" page_limit="5"}</span>
            {if $paginate.page_current < $paginate.page_total}
            <span>{paginate_last class="pagination"}</span>
            {/if}   
        </div>
    </div>
</div>