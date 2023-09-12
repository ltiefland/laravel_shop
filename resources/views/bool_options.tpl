{if $bool_opts} 
    {foreach $bool_opts as $index => $data}
    <div class="auspraegungsfilter">
        <input type="checkbox" name="{$data["name"]}" id="{$data["id"]}" value="{$data["value"]}" {if $data["value"] == $data["selected"]} checked="checked"{/if}/>
        <label for="{$data["id"]}">{$data["label"]}</label>    
    </div>
    {/foreach}
{/if}