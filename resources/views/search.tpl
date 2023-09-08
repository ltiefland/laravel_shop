<script>
     $(document).ready(function(){
             
        var suchbegriff = ""; 
        $("#suchbegriff").autocomplete({

			source: "/source/includes/content/search.php?autocomplete=true", 
            minLength: 1,
            open: function(event, ui) {
                
                $(".ui-autocomplete").css("z-index", 999999999999999999);
                $(".ui-autocomplete").css("text-align", "left");
            },
            select: function( event, ui ) {
                var link = ui.item.link;
                window.location = ui.item.link;
            },
            focus: function(event, ui) {
                event.preventDefault();
                $("#suchbegriff").val(ui.item.label);
            }           
        }).autocomplete( "instance" )._renderItem = function( ul, item ) {
                return $( '<li></li>' ).data( "item.autocomplete", item )
                    .append( "<a href="+ item.link +"><div class='searchBild'><img src='" + item.icon + "' style='max-width:60px;'/></div><span class='searchLabel'>" + item.label+ "</span><div class='searchPreis'>"+ item.preis +"</div></a>" )
                    .appendTo( ul );
        };
        
        
        $('#suchbegriff').focus(function() {
            $('#topinfo .search').css("width","450px");
        });        
        $('#suchbegriff').blur(function() {
            $('#topinfo .search').css("width","205px");
        });        
        
    });
</script>
<div class="search">
    <div id="suggest">
        <form name="search" id="search" action="/index.php" method="get" enctype="application/x-www-form-urlencoded">    
            <input autocomplete="off"  id="suchbegriff" type="text" name="search" value="{$smarty.get.search}" placeholder="Was suchst du?" />
            <input type="submit" name="searchSubmit" id="searchSubmit" value=""/>
            
        </form>
    </div>
    {*
    <div class="social">
        <div>Besuche uns auch hier:&nbsp;</div>
        <div><a href="https://www.instagram.com/pieper_zeltdepot/" target="_blank"><img src="/images/logos/instagram.png"></a></div>
        <div><a href="https://www.youtube.com/channel/UCVXgjwywU_gqW40GokNY55w" target="_blank"><img src="/images/logos/youtube.png"></a></div>
        <div><a href="https://de-de.facebook.com/pieper.freizeit/" target="_blank"><img src="/images/logos/fb.png"></a></div>
        
    </div>
    *}
</div>
