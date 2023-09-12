<section class="serviceInfo">
    <div class="inner">
    {foreach $mainnav2 as $key => $arr}
        {if $mainnav2[$key]["top"][0].medien[0]->medium.bild_url || $mainnav2[$key]["top"][0].name}
        <div class="serviceBanner">
            <a href="{$mainnav2[$key]['top'][0].dirLink}"><img src="{$mainnav2[$key]['top'][0].medien[0]->medium.bild_url}" /></a>
        </div>
        {/if}
    {/foreach}
    </div>
</section>