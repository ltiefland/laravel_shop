<button style="width:100%;" class="not_found_small">{$langstrings.item.not_found}</button>

<div id="ng_top">
    
    <div class="title">{$langstrings.item.not_found_headline}</div>
    <div class="hide"><a id="close_ng" href="#">{$langstrings.shop.close} <span style="font-size:1.4em;">X</span></a></div>
    
    <div class="text">{$langstrings.item.not_found_text}
    
    {$langstrings.item.quick_answer}<br />
    </div>
    
    <div class="form">
        <form method="post" class="ng-form" id="ng-form">
            <input type="hidden" name="mode" value="not_found" />
            <div class="eingabefeld">
                {$langstrings.item.product_brand}<br />
                <input type="text" name="brand" value="" size="22" id="brand" />
            </div>
            
            <div class="eingabefeld">
                {$langstrings.buy.product_name}<br />
                <input type="text" name="type" value="" size="22" id="type" />
            </div>
            
            <div class="eingabefeld">
                Kommentar / Anmerkung<br />
                <textarea style="font-size:1.1em;" name="comment" cols="20" rows="3" id="comment"></textarea>
            </div>

            <div class="eingabefeld">
              Ihr Name<br />
                <input type="text" name="name" value="" size="22" id="name" />
            </div>
            
            <div class="eingabefeld">
               Ihre E-Mail Adresse<br />
                <input type="text" name="email" value="" size="22" id="email" />
            </div>

            {if $smarty.session.auspraegungen||$smarty.session.search_text}
            <input type="hidden" name="back" value="1">
            {/if}
            <button id="send_ng">Anfrage absenden</button>
        </form>
    </div>
</div>

<div id="nicht_gefunden_msg" title="Artikelanfrage">
    {$fb}
</div>