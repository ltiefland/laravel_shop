{extends file="page.tpl"}
{block name=content}
<!-- $Id: subdir.tpl 2980 2022-12-01 11:45:36Z erling $ BEGIN -->

    {include file="shopposition.tpl"}

<div class="subdir_info_wrapper">
    {if is_countable($subdir->media) && count($subdir->media) > 0}
        {if $subdir->media[1]->url}
            <div class="subdir_bild">
                {if $subdir->media[1]->url}
                    <img src="{$subdir->media[1]->url}" alt="">
                {/if}
            </div>
        {elseif $subdir->media[0]->url}
            <div class="subdir_bild">
                <img src="{$subdir->media[0]->url}" alt="">
            </div>
        {/if}
    {/if}

    {if $subdir->description}
        <div class="subdir_text">
            <h1>{$subdir->Alternativer_Titel|default:$subdir->name}</h1>
            {$subdir->description}

            {if $subdir->description2}
                <p class="infotext_subdir"><a href="#infotext">Mehr lesen</a></p>
            {/if}
        </div>
    {/if}
</div>

{if $subdir->subdirs|count}
<div class="subdir">
    {foreach $subdir->subdirs as $subDir}
    <div class="box_subdir">
            <a href="/directory/{$subDir->id}-{$subDir->slug}">
                <div class="top"
                {if $subDir->media[0]->url != ''}
                    style="
                        background: url('{$subDir->photo[0]->url_gr}') no-repeat center;
                        background-size:cover;
                    "
                {/if}
                alt="{$subDir->name}"
                >

                </div>
                <div class="bottom bold">
                    <span>{$subDir->name}</span>
                </div>
            </a>
        </div>
    {/foreach}
</div>
{/if}

<div class="subdir_artikel_wrapper">
    {if is_countable($subdir->items)}
        {if count($subdir->items) > 0}


            {if (isset($dropdown_opts) && ($dropdown_opts|count>0 )|| ( isset($bool_opts) && $bool_opts|count>0)) && $ini.filter_auspraegungen==1}
                <div class="subdir_sort loading">
                    <form name="sort" action="" method="get" id="modellForm1">
                        <strong>Produktfilter:</strong>
                        <div class="break"></div>
            	        <input type="hidden" name="navigation" value="{$subdir->id}" />
                        <input type="hidden" name="Father" value="{$subdir->id}" />
                        {include file="auspraegungen.tpl" nocache}
            	    </form>
                </div>
            {/if}


            {if $smarty.const.USE_SMARTY_PAGINATE===true}
            {include file="pagination.tpl"}
            {/if}

            {if $ini.subdir.switch_css==1}
            {include file="switch_css.tpl"}
            {/if}
            <div class="subdir_artikel">
                {foreach $subdir->items as $item}
                    {if $item->articlemaster==1}
                        {include file="subdir_artstamm.tpl"  artstamm=$item}
                    {else}
                        {include file="item_small.tpl"}
                    {/if}
                {/foreach}
            </div>

            {if $smarty.const.USE_SMARTY_PAGINATE===true}
                {include file="pagination.tpl"}
            {/if}

        {/if}
    {else}
        <div class="box_2">
            <div class="box_top">&nbsp;</div>
            <div class="box_middle">Keine Artikel gefunden</div>
        </div>
    {/if}
    <div class="break"></div>

    {if $subdir->description2}
    <section id="infotext">
        <div class="inner">

            {if $subdir->media[2]->url}
            <div class="subdir_bild">
                <img src="{$subdir->media[2]->preview_url}" alt="">
            </div>
            {/if}

            <div id="beschreibung2">
                <a name="infotext" id="infotext"></a>
                {$subdir->description2}
                <p class="topbutton_text"><a href="#top">Nach oben</a></p>
            </div>
        </div>
    </section>
    {/if}

</div>

<script>
    $('.box_subdir'). click(function(){
        window.location.href = $('.bottom a', this).attr("href");
    });

    $('.infotext_subdir a').click(function(e){
        e.preventDefault();
        let target = $(this).attr('href');
        let offset = $(target).offset();
        let scrollTo = $(target).offset().top;
        $("html, body").animate( { scrollTop: scrollTo }, 800, 'swing');
    });

</script>

<script>
    $(document).ready(function() {
        $('.tooltip_opener').mouseenter(function(){
            let id = $(this).attr('id');
            id = id.split("_");
            id = id[1];

            $('#tooltip_'+id).css("display","block");
        }).mouseleave(function(){
            $('.tooltip').hide();
        });
    });
</script>
<script>
    $(document).ready(function () {

        // ME: update filter using session data
        /*
        if($.session._cookieCache) {
            $.each($.session._cookieCache, function(index,value){
                console.log(index + " - " + value);
                var type = $("#" + index).attr("type");
                switch(type) {
                    case "checkbox":
                        $('#' + index).trigger("click");
                    break;
                    default:
                    break;
                }
            });
        }
        */

        $(".newsorting").css("display", "none");

        $("#drsort").change(function () {

            $(".box_2").css("background-color", "transparent");
            $(".subdir_artikel").css("background-color", "#ccc");
            $(".loader").show();

            let selid = $('#drsort').val();
            let mode = "result";

            let daten = $('#modellForm1').serializeArray();
            $.ajax({
                type: "POST",
                url: "/module/artikelmodell.php?mode=" + mode + "&sort=" + selid,
                data: daten,
                async: false,
                success: function (html) {

                    if (mode === "result") {
                        $(".pagination_container").css("display", "none");

                        $('.subdir_artikel').html(html);
                        $(".subdir_artikel").css("background-color", "transparent");
                        $(".loader").hide();

                        $(".newsorting").css("display", "block");

                    }
                }
            })

        });
    })
</script>
<style>

.item_slider_img:hover img {
    scale:110%;
}

</style>
<!-- $Id: subdir.tpl 2980 2022-12-01 11:45:36Z erling $ END -->
{/block}

