
<div class="box_1">
    <div class="box_top black" style="width:203px!important;">
       <h1 >Herstellerauswahl:</h1>
    </div>
    <div class="box_middle anthrazit">
        <div class="inner">
        {foreach $herstellerListe as $key => $hersteller}
            <a href="/index.php?hersteller={$hersteller.ID}">{$hersteller.Name}</a><br />
        {/foreach}
        </div>
    </div>
    <div class="box_middle black">
        <div class="inner align_right font_red small">
            <a href="">Erweiterte Suche...</a>
        </div>
    </div>
</div>