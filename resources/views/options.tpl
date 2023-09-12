{foreach from=$optionen key=key item=item}
    <div>
        <label>{$item.featureName}:</label><br />
        
        <select name="option[{$key}]" style="" class="options">
        {foreach from=$item.options key=o_id item=option}
            <option value="{$o_id}">{$option.optionName}{if $option.aufschlag>0} Aufschlag: {$option.aufschlag|money_format|replace:"EUR":"&euro;"}{/if}</option>    
        {/foreach}
        </select>
    </div> 
{/foreach}