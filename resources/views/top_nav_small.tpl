<nav class="topnav noprint" role="navigation">
    <div class="inner">
        {foreach $nav as $n}
        <ul class="level1">
            {foreach $n.top as $top}
            <li class="{if $n@last}last{/if}">
                <a href="{$top.dirLink}" style="cursor:pointer;" class="topnav_li" id="{$top.id}" title="Zur Kategorie {$top.name}">{$top.name}</a>  
                {if $n.sub}
                <ul class="big level2 level2ul padding_top">         
                    {section loop=$n.sub name=s_ind}
                    {if $n.sub[s_ind].name}
                    <li class="navi_level2">
                        <a href="{$n.sub[s_ind].link}" title="Zu {$n.sub[s_ind].name}">
                        {$n.sub[s_ind].name}</a>
                    </li>
                    {/if}
                    {/section}
                </ul>
                {/if}                        
            </li>  
            {/foreach}
        </ul>
        {/foreach}
    </div>
</nav>