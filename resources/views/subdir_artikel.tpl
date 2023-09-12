{foreach $subdir.items as $item}
    {if $item.Artikelstamm==1}
       {include file="subdir_artstamm.tpl"  artstamm=$item}
    {else}        
       {include file="item_small.tpl"  inline}
    {/if}
{foreachelse}
    <div class="box_2">
        <div class="box_top">&nbsp;</div>
        <div class="box_middle" style="padding: 2%;text-align: center;font-size: 1.5em;">Keine Artikel gefunden <br /><br />
            <button class="shopButton resetSearchButton" style="font-size:0.7em !important">Suchfilter zur&uuml;cksetzen</button>
        </div>
    </div>
{/foreach}
<script>
    $(document).ready(function(){
        $(".resetSearchButton").button();
        $(".resetSearchButton").click(function(){
            $(".resetbutton").trigger("click");
        });
    })
</script>