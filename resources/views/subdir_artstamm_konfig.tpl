<div class="konfig_item" id="konfig_item_{$artstamm->id}">
    <div class="">
        <h2>{$artstamm->name}</h2>
        <div class="top">
            <div>
                
            {if $artstamm->hersteller_Logo1}
                <div class="box1_topright">{$artstamm->hersteller_Logo1}</div>
            {/if}
            {if $artstamm->description}
                <div class="description">
                    <div class="descriptionInner">
                        {$artstamm->description}
                    </div>
                </div>            
            {/if}
            </div>
        </div>
        <div class="center">
        
        {foreach $artstaemmeItems[$artstamm->id]->items as $key => $item}
            <div class="konfig_select_item" data-selecteditem="{$item->id}#{$item->price[0]->preis|default:0.00}#{$artstamm->id}">
                <div>
                    <img src="/images/upload/{$item->medium[0]->medium->folder}/{$item->medium[0]->medium->name}">
                </div>
                <div>
                    <p>{$item->name}</p>
                    <p class="konfig_preis">{$item->price[0]->preis|money_format}</p>
                </div>
            </div>
        {/foreach}

        </div>
        
        <!-- SELECTBOX für Konfigurator -->
        <select style="width:350px;" name="addon[]" class="select_components">
            <option value="0#0#{$artstamm->id}">keine Auswahl</option>
            {foreach $artstaemmeItems[$artstamm->id]->items as $key => $item}
                <option 
                {assign var="optkey" value="select_{$artstamm->id}"}
                value="{$item->id}#{$item->price[0]->preis|default:0.00}#{$artstamm->id}">{$item.name}: {$item.price[0]->preis|money_format}</option>
            {/foreach}
        </select>
         
        <input type="hidden" name="selectedPreis_{$artstamm->id}" id="selectedPreis_{$artstamm->id}" value="0" />
        
        {foreach $artstaemmeItems[$artstamm->id]->items as $key => $item}
        <div style="margin-top:10px;display:none;" class="select_infotext_{$artstamm->id} select_infotext" id="select_infotext_{$item->id}">
            {$item->description|nl2br}
        </div>    
        {/foreach}
    </div>
</div>