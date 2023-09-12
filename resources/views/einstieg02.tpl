<section class="einstieg02">
    <div class="inner">
        {foreach $nav as $n}
            {foreach $n.top as $top}
                {if $n@index<=5}
                <div class="einstieg_box" style="background-image: url('{$top.medien[0]->medium.bild_url}');">
                    <a class="einstieg_name" href="{$top.dirLink}">
                        {$top.name}
                    </a>
                </div>
                {/if}
            {/foreach}
        {/foreach}
    </div>
</section>
