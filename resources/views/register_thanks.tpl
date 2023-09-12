<div class="box_static">
    <div class="box_top">
        <h1 >{$langstrings.login.register}</h1>
    </div>
    <div class="box_middle">
        <p style="padding:10px;">
            {$langstrings.login.register_thanks}
        </p>
        {if $smarty.post.back}
            <p>
                <a href="/bestellen_seite_1.html">Weiter zum Bestellvorgang</a>
            </p>
        {/if}   
    </div>
    <div class="box_bottom"></div>
</div>