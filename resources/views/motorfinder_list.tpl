<script>
    $(document).ready(function(){
        $(".box_middle").hover(function() {
            $(".subdir_basket img" ,this ).attr("src","/images/webelemente/basket_2.png");
          }, function() {
            $(".subdir_basket img" ,this ).attr("src","/images/webelemente/basket.png");
          })
        })
</script>

{if $items}
    {if $items_found}
        <div class="mf_list_close" style="display:none;">zur&uuml;ck</div>
        <div style="float:left;padding:5px 10px 5px 10px;width:809px;background-color:#BEBEBE;color:#fff;font-weight:normal!important;">{$items_found}</div>
    {/if}
    {section loop=$items name=a_ind}
        
        {cycle values="cleft,ccenter,cright" assign=class}
        {if $items[a_ind].Artikelstamm==1}
        
        {include file="subdir_artstamm.tpl" artstamm=$items[a_ind] class=$class addfrom='motorfinder'}
        {else}
        {include file="item_small.tpl" item=$items[a_ind] class=$class addfrom='motorfinder'}
        {/if}

    {/section}
    
    <div class="break"></div>
    <div class="break"></div>
    <div class="break"></div>
{else}
    <div style="padding:20px;font-size:14px;">Kein Suchergebnis. Bitte verfeinern Sie Ihre Auswahl.</div>
{/if}