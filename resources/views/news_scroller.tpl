<a href="/gaestebuch/gaestebuch.htm">
<div class="news_scroller">
    <div class="head_icon"><img src="/images/webelemente/kundenmeinungen.gif" /></div>
    <div id="scrollup">
        {if $headlines}
        {section name=n_ind loop=$headlines}
        <div class="headline"> "{$headlines[n_ind].text|strip_tags|truncate:200}" - <i>{$headlines[n_ind].Name|strip_tags}, {$headlines[n_ind].Datum}</i></div> 
        {/section}
        {/if}     
    </div>
</div>
</a>
<div style="height:10px;background-color:#FFECCE;">&nbsp;</div>