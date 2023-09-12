<!-- ANFANG .news -->
<div class="content">
    <div class="box_static">
        <div class="box_top">
            <h1>Grillshop-24 News</h1>
        </div>
        <div class="box_middle middlecontent">
        
            {section loop=$news.news_items name=n_ind}
                {if $news.news_items[n_ind].id==$smarty.get.newsitem}
                    
                    {if $news.news_items[n_ind].bild_1_url}
                        <div class="news_img">
                            <p><a onmouseover="return overlib('<img src=\'/images/news/1/{$news.news_items[n_ind].bild_1_url}\' />', CAPTION, '{$news.news_items[n_ind].bild_text}', HAUTO, VAUTO);" onmouseout="return nd();"><img width="100" src="/images/news/1/{$news.news_items[n_ind].bild_1_url}" /></a></p>
                        </div>
                    {/if}
                    <div class="news_text">
                        <p>
                            {$news.news_items[n_ind].datum}<br />
                            {$news.news_items[n_ind].title}
                        </p>
                        
                        <p>
                            {$news.news_items[n_ind].text}
    
                            {if $news.news_items[n_ind].dok1}
                                <br /><br /><a href="/dokumente/news/1/{$news.news_items[n_ind].dok1}"><img src="/images/webelemente/nav_pfeil.png" /></a>&nbsp;<a class="mainlink" href="/dokumente/news/1/{$news.news_items[n_ind].dok1}">Mehr Infos </a>
                            {/if}
    
                        </p>
                        
                    </div>
    
                {/if}
            {/section}
        
        </div>
    
    </div>
    <div class="break" style="height:10px;"></div>
</div>

<!-- ENDE .news -->