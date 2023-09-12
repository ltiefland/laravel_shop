{if $aktion[0].items==NULL}
   <p style="padding:20px;">Zur Zeit sind gibt es leider keine Sonderangebote.</p> 
{/if}

{if $aktion[0].img} 
    {$aktion[0].img}
    <div class="aktion_spacer">&nbsp;</div>
{/if}

{if $aktion[0].headline or $aktion[0].text}
<div class="aktion_box">
    <h1>{$aktion[0].headline}</h1>
    <p>{$aktion[0].text}</p>
</div>
{/if}



<div class="subdir_artikel_wrapper">
    <div class="subdir_artikel">
        {section loop=$aktion[0].items name=a_ind}
            
                {assign var="item" value=$aktion[0].items[a_ind]}
                {if $aktion[0].items[a_ind].preis>0 && $aktion[0].items[a_ind].status==0}
                    {assign var="class" value="{cycle values='cleft,ccenter,cright'}"}
                    {include file="item_small.tpl"}    
                {/if}
        
        {/section}
    </div>
</div>
    
