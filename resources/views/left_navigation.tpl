{if $smarty.get.item>0 || $smarty.get.navigation>0}
<!-- ANFANG der linken Navigationsleiste -->
<div class="box_1_menu">
    <div class="box_middle noborder">
        {section loop=$nav name=n_ind start=0}
            {section loop=$nav[n_ind].top name=t_ind}
                    {if $nav[n_ind].sub|@count}
                    <ul class="level3" id="{$smarty.section.t_ind.index}">
                    {section loop=$nav[n_ind].sub name=s_ind}
                    
                        {if $nav[n_ind].sub[s_ind].id==$shopPosition[1].dirID}
                            
                            {foreach $nav[n_ind].sub[s_ind].sub2 as $sub3}
                                <li class="level3 big">
                                <div class="navi_level3
                                {if !$nav[n_ind].sub[s_ind].sub3[$sub3.ID]}
                                nochange
                                {/if}
                                ">
                                <img class="navi_arrow3" src="/images/webelemente/navi_arrow_white.png" />
                                <a 
                                {if !$nav[n_ind].sub[s_ind].sub3[$sub3.ID]}
                                    href="{$sub3.dirLink}"
                                {/if}
                                class="fakelink">{$sub3.Name}</a>
                                </div>
                                
                                {if $nav[n_ind].sub[s_ind].sub3}
                                    {if $nav[n_ind].sub[s_ind].sub3[$sub3.ID]}
                                    <ul class="level4" id="{$sub3.ID}">
                                    {foreach $nav[n_ind].sub[s_ind].sub3[$sub3.ID] as $sub4}
                                        
                                        <li class="level4 navi_level4">
                                        <a class="fakelink4" href="{$sub4.dirLink}">
                                        {if $sub4.ID == $shopPosition[3].dirID}
                                        <img class="navi_arrow4 nochange" src="/images/webelemente/navi_arrow_red.png" />
                                        {else}
                                        <img class="navi_arrow4" src="/images/webelemente/navi_arrow_white.png" />
                                        {/if}
                                        {$sub4.Name}</a>
                                        
                                        </li>
                                    {/foreach}
                                    </ul>
                                    {/if}
                                {/if}
                                </li>
                            {/foreach}

                        {/if}
                    {/section}
                    </ul>
                    {/if}
            
            {/section}
        {/section}
        <div class="break">&nbsp;</div>
    </div>
</div>
<div class="break"></div>
<!-- ENDE der linken Navigationsleiste -->
{/if}