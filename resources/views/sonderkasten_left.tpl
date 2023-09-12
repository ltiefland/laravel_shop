

{section loop=$skl name=sk_ind}

    {if $skl[sk_ind].typ=="frei"}
    <div class="box_1">
        {if $skl[sk_ind].bild_url}
            
            {if $skl[sk_ind].bild_link}
                <a href="{$skl[sk_ind].bild_link}" 
                {if $skl[sk_ind].bild_link|strstr:"http"}
                target="_blank"
                {/if}
                >{/if}<img src="/images/sonderkasten/{$skl[sk_ind].bild_url}" />{if $skl[sk_ind].bild_link}</a>{/if}
             
        {else}
            {if $skl[sk_ind].titel}
                <h1 class="big sonderkasten_top">{$skl[sk_ind].titel}</h1>
            {/if}
        {/if}


        <div class="box_middle horizontal_verlauf align_center">
    
            {if $skl[sk_ind].inhalt}
                <p>{$skl[sk_ind].inhalt}</p>
            {/if}
        </div>
    </div>
    {else}
        {if $skl[sk_ind].position|stristr:$pagetype}
            {if $skl[sk_ind].untertyp=="Shopnavigation"}
            {include file="navigation.tpl"}
            {elseif $skl[sk_ind].untertyp=="Warenkorb"}
            {include file="basket_info.tpl"}
            {elseif $skl[sk_ind].untertyp=="Suche"}
            {include file="search.tpl"}
            {elseif $skl[sk_ind].untertyp=="Login/Passwort"}
            {include file="login.tpl"}
            {elseif $skl[sk_ind].untertyp=="ServiceCenter"}
            {include file="service_center.tpl"}
            {elseif $skl[sk_ind].untertyp=="Last-visited"}
            {include file="lastvisited.tpl"}
            {elseif $skl[sk_ind].untertyp=="Top Seller"}
            {include file="topseller.tpl"}
            {elseif $skl[sk_ind].untertyp=="Top Offer"}
            {include file="sonderangebote.tpl"}
            {elseif $skl[sk_ind].untertyp=="New Products"}
            {include file="neue_produkte.tpl"}
            {elseif $skl[sk_ind].untertyp=="News"}
            {include file="news.tpl" news=$smarty.session.news}
            {elseif $skl[sk_ind].untertyp=="Hersteller"}
                {if $hersteller_arr}
                    {include file="sk_hersteller.tpl"}
                {/if}
            {/if}
        {/if}
    {/if}
    
{/section}