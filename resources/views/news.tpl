<div class="startseite" style="width:174px;">
    {foreach $news as $key => $elem}
    <div class="box">
        <h1>{$elem.ueberschrift}</h1>
        <p>{$elem.lang}</p>
    </div>
    {/foreach}    
</div>
