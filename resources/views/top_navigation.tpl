<script type="text/javascript" src="/JavaScript/jquery.hoverIntent.min.js"></script>
<script>
    $(document).ready(function(){
        let windowWidth = $(window).width();
        removeMobileNav(windowWidth);

        $(".topnav_ul li").hoverIntent(
            function(){
                var topLvl = String( $(this).attr("class") );

                var topExpl = topLvl.split("_");
                var topId = topExpl[1];
                $(this).removeClass('highlight');

                if( windowWidth > 850){
                    $('.subnav').removeClass("topnav-hover");
                    $('.sub_'+topId).addClass("topnav-hover");
                    $(".topnav_ul li").removeClass('highlight');
                }
            }, function(){
                var topLvl = String( $(this).attr("class") );
                var topExpl = topLvl.split("_");
                var topId = topExpl[1];
                $('.sub_'+topId).removeClass("topnav-hover");
                $(".topnav_ul li").removeClass('highlight');
            }

        );

        $(".opener").hoverIntent(
            function(){
                $('.opener').removeClass("highlight");
                $('.subdir_box').hide();
                let id = $(this).attr("id");
                $(this).addClass("highlight");
                $('#sub_'+id).css("display","flex");
            }, function(){

            }

        );


        $(".subnavClose").on( "click", function(){
            $('.subnav').removeClass("topnav-hover");
            $('.subnav').css("visibility", "hidden");
        });

        // height subnav
        /*
        var maxHeight = 0;
        $(".subnav_inner_container").each(function(){
            var actHeight = $(this).height();

            if( maxHeight == 0 ){
                maxHeight = actHeight;
            }else{
                if( maxHeight < actHeight ){
                    maxHeight = actHeight;
                }
            }
        });
        if( maxHeight > 0 ){
            $(".subnav_inner_container").css("height", maxHeight + 30);
        }
        */

        function removeMobileNav(w) {
            if(w>850) {
                $('.mobileNav').remove();
            }
        }
    });
</script>
<style>

.subnav {
    width:100%;
    left:0;
    margin:-5px auto 0;
    border-bottom:2px solid #ccc;
    min-height:50vh!important;
    font-size:1.15rem;
}
.subnav_outer_container {
    margin:0 auto;
    float:none;
    width:70%;
}
.sub_2400 {
    /*visibility:unset;*/
}
.subs {
    width:69%;
    transition:all 200ms ease;
}
.sub2 {
    display:flex;
}
.sub_head {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    margin:1px 0;
}
.topnav_next {
    text-align:right;
}
.sub2 a,
.subhead a {
    padding:4%;
    width:92%;
    border-radius:5px;
    cursor:pointer;
}
.subnav a {
    border-radius:5px;
    display: block;
    width: 100%;
}
.subnav_paddings:hover .subdir_box {
    display:flex;
}
.subs .subnav-hover {
    display:flex;
}
.subs .subdir_box {
    display:none;
    flex-wrap:wrap;
    transition:all 200ms ease;
    column-gap:20px;
}
.subs .subdir_box span {
    min-width:calc(33.33% - 20px);
    transition:all 200ms ease;
}
.opener.highlight,
.opener:hover,
.opener:focus {
    background:#f4f4f4;
    border-radius:5px;
}
.fa-chevron-right {
    color:#e95802;
    margin-top:2px;
}
</style>
<nav class="topnav noprint">
    <div class="inner">


        <li id="li_one" style="cursor:pointer;">
            <a class="topnav_li" id="one" href="/manufacturers/">Marken</a>
            <div id="topnav_active_one" class="topnav_active desktop"></div>
        </li>

        <ul class="topnav_ul">
        {foreach $nav as $n}

            {foreach $n->top as $top }
            <li class="{if $n@last}last{/if} li_{$top->id}">
                <a class="topnav_li" id="{$top->id}" href="{$top->dirLink}" title="Zu {$top->name}">{$top->name}</a>
            </li>
            {/foreach}
        {/foreach}
        </ul>
    </div>
        {foreach $nav as $n}

            {foreach $n->top as $top}
                {if is_iterable($n->sub) && $n->sub|count}
                <div class="subnav sub_{$top->id}">
                   <div class="subnav_outer_container">

                        <div class="subnav_inner_container">
                          <div class="subnav_paddings">

                            <div class="subdir_col">
                                {* 1st level opener *}
                                {foreach $n->sub as $sub}
                                    {if $sub->link}
                                        <div id="{$sub->id}" class="opener {if $smarty.foreach.sub.last}subdir_last{/if}">
                                            <span class="sub_head"><a href="{$sub->link}" title="Zu {$sub->name}">{$sub->name}</a>
                                                {if count($sub->sub2)}
                                                    <a href="{$sub->link}" class="topnav_next" data-closename="{$top->name}" data-id="sub2_{$sub->id}" data-name="{$sub->name}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                                                {/if}
                                            </span>
                                        </div>
                                    {/if}
                                {/foreach}

                            </div>

                            <div class="subdir_col subs">

                                {* 1st level *}
                                {foreach $n->sub as $sub}
                                <div id="sub_{$sub->id}" class="subdir_box {if $smarty.foreach.sub.last}subdir_last{/if}">

                                        {if is_iterable($sub->sub2) && $sub->sub2|count>0}
                                        {foreach $sub->sub2 as $sub3}
                                            <span id class="sub2"><a href="{$sub3->link}" title="Zu {$sub3->name}">{$sub3->name}</a></span>
                                        {/foreach}
                                        {/if}
                                </div>
                                {/foreach}
                            </div>
                           </div>
                        </div>
                    </div>
                </div>
                {/if}
            {/foreach}
        {/foreach}

</nav>
