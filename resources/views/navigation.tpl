                <!-- ANFANG der oberen Navigationsleiste -->
                <div>
                {section loop=$nav name=n_ind start=0 max=8}
                    {section loop=$nav[n_ind].top name=t_ind}
                    <div class="box_1">
                        <div class="box_top">
                            <a href="{$nav[n_ind].top[t_ind].link}">{$nav[n_ind].top[t_ind].name}</a>
                        </div>
                        <div class="box_middle">
                            {if $nav[n_ind].sub|@count}
                            <ul>
                            {section loop=$nav[n_ind].sub name=s_ind}
                                <li class="layer2">
                                    <a href="{$nav[n_ind].sub[s_ind].link}">{$nav[n_ind].sub[s_ind].name}</a>
                                </li>
                            {/section}
                            </ul>
                            {/if}
                        </div>
                    </div>
                    {/section}
                {/section}
                </div>
                <!-- ENDE der oberen Navigationsleiste -->