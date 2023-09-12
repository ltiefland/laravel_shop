                {section loop=$dropdown_opts name=d_ind}
                    {if $dropdown_opts[d_ind].typ==3}
                    <select name="{$dropdown_opts[d_ind].name}" id="{$dropdown_opts[d_ind].id}" style="width:180px;margin-bottom:5px;">
                    {html_options options=$dropdown_opts[d_ind].options selected=$dropdown_opts[d_ind].selected}
                    </select>
                    {/if}
                {/section}
