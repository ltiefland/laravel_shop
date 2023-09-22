<script>
    $(document).ready(function(){
        var windowWidth = $(window).width();
        removeMobileNav(windowWidth);

        $('.menu_close').on("click",function() {
            $('.subnav').removeClass('topnav-hover');
            $('.sub2container').removeClass('topnav-hover');
            $('body').removeClass("active-nav");
            $('.menu_path').html("Menü");
        });

        $('.topnav_next').on("click",function() {
            let id = $(this).data("id");
            let name = $(this).data("name");
            let closename = $(this).data("closename");

            if(id.indexOf("sub2_")==0) {
                $('.menu_path').attr("data-close","sub2container");
            }else {
                $('.menu_path').attr("data-close","subnav");
                $('.subnav').removeClass('topnav-hover');
                closename = "Menü";
            }


            $('.menu_path').attr("data-closename",closename);
            $('.menu_path').attr("data-id",id);
            $('#'+id).addClass('topnav-hover');
            $('.menu_path').html("<i class='sub_close fa fa-chevron-left' aria-hidden='true'> "+name+"</i>");

        });


        $('.menu_path').on("click",function() {

            let closeItem = $(this).data("id");
            let closename = $(this).data("closename");
            let closeclass = $(this).data("close");

            if($(".sub2container").is("visible")==false) {
                $('.menu_path').html("Menü");
                $(".sub2container").removeClass('topnav-hover');
                $(".subnav").removeClass('topnav-hover');
            }else {
                if( closeItem  ) {
                    $('.menu_path').html("<i class='sub_close fa fa-chevron-left' aria-hidden='true'> " + closename);
                    $('.menu_path').data("closename", closename);
                    $("#"+closeItem).removeClass('topnav-hover');
                    if(closeclass) {
                        $('.'+closeclass).removeClass('topnav-hover');
                    }
                }
            }

        });



        /*
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
        */


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
.subs {
    width:55%;
    transition:all 200ms ease;
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

}
.subs .subdir_box span {
    min-width:33.33%;
    transition:all 200ms ease;
}
.opener.highlight,
.opener:hover,
.opener:focus {
    background:#DDDEDE;
}
.mobile .menu_top {
    display:flex!important;
    flex-direction:column;
    overflow:hidden;
    max-width:100%;
    background: rgb(233,88,1);!important;
    background: linear-gradient(130deg, rgba(233,88,1,1) 0%, rgba(251,149,24,1) 100%, rgba(0,212,255,1) 100%)!important;
    color:#fff;
    padding:0;
}
.mobile .menu_close {
    padding: 2% !important;
    text-align: right;
    width: 96% !important;
    font-size:1.4rem;
}
.mobile .menu_path {
    padding:2%!important;
    text-transform:uppercase;
    font-size:1.2rem;
}
.mobile .topnav_next {
    cursor:pointer;
}
.mobile .topnav_next i {
    color:#E95902!important;
    text-align:right!important;
}
.mobile .topnav_ul > li {
    display:flex;
}
.mobile .subnav {
    background:#fff;
    left:100%;
    height:100vh!important;
}
.mobile .topnav-hover.subnav {
    left:0;
}
.mobile .sub_head {
    border-bottom:1px solid #ccc;
    font-size:1.1em;
    display:flex;
}
.mobile .sub_head > a {
    padding:4% 3%!important;
    display:block;
}
#topnav.mobile .inner {
    height:100vh!important;
}
.mobile .topnav_nextsub  {
    text-align:right;
}
.mobile .topnav_nextsub i {
    color:#E95902 !important;
}
.mobile .subs {
    position:absolute;
    left:100%;
    background:#fff;
}
.mobile .sub2 {
    padding:4% 3%!important;
    border-bottom:1px solid #ccc;
    font-size:1.1em;
}
.mobile .sub2container {
    position:absolute;
    left:100%;
    background:#fff;
}
.mobile .sub2container {
    height:100vh!important;
}
.mobile .sub2container.topnav-hover {
    left:0!important;
}

</style>
<nav class="topnav noprint">
    <div class="menu_top mobile">
        <div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div>
        <div class="menu_path fa" data-id="subnav">Menü</div>
    </div>
    <div class="inner">
        <ul class="topnav_ul">
        {foreach $nav as $n}
            {foreach $n->top as $top }
            <li class="{if $n@last}last{/if} li_{$top->id}">
                <a class="topnav_li" id="{$top->id}" href="{$top->dirLink}" title="Zu {$top->name}">{$top->name}</a>
                {if $smarty.session.isMobile==true}
                    {if $n->sub|count>0}
                        <a class="topnav_next mobile" data-closename="Menü" data-id="sub_{$top->id}" data-name="{$top->name}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                    {/if}
                {/if}
            </li>
            {/foreach}
        {/foreach}
        </ul>
        {foreach $nav as $n}
            {foreach $n->top as $top}
                {if $n->sub|count}
                <div class="subnav sub_{$top->id}" id="sub_{$top->id}">
                   <div class="subnav_outer_container">

                        <div class="subnav_inner_container">
                          <div class="subnav_paddings">

                            <div class="subdir_col">
                                {* 1st level opener *}
                                {section loop=$n->sub start=0 name=s_ind}
                                    {if $n->sub[s_ind].link}
                                        <div id="{$n->sub[s_ind].id}" class="opener {if $smarty.section.s_ind.last}subdir_last{/if}">
                                            <span class="sub_head">
                                                <a href="{$n->sub[s_ind].link}" title="Zu {$n->sub[s_ind].name}">{$n->sub[s_ind].name}</a>
                                                {if $smarty.session.isMobile==true}
                                                    {if is_array($n->sub[s_ind].sub2)}
                                                        <a class="topnav_next mobile" data-closename="{$top->name}" data-id="sub2_{$n->sub[s_ind].id}" data-name="{$n->sub[s_ind].name}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                                                    {/if}
                                                {/if}
                                            </span>
                                        </div>

                                        {if $n->sub[s_ind].id}
                                            {if is_array($n->sub[s_ind].sub2)}
                                            <div id="sub2_{$n->sub[s_ind].id}" class="sub2container">
                                            {foreach $n->sub[s_ind].sub2 as $sub3}
                                                <div>
                                                  <span class="sub2"><a data-closename="{$n->sub[s_ind].name}" data-id="sub_{$top->id}" href="{$sub3->dirLink}" title="Zu {$sub3->ame}">{$sub3->name}</a></span>
                                                </div>
                                            {/foreach}
                                            </div>
                                            {/if}
                                        {/if}

                                    {/if}
                                {/section}

                            </div>









                            {if !$smarty.session.isMobile}
                            <div class="subnav_special">

                            </div>
                            {/if}


                           </div>
                        </div>
                    </div>
                </div>
                {/if}
            {/foreach}
        {/foreach}
    </div>
</nav>
