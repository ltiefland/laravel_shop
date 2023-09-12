<div class="break" style="height:10px;"></div>                    
                                        
<div class="box_1">
    <div class="box_top">
        <div class="box_head_left toggle_searchbox_hide">
            <img id="arrow_searchbox" src="/images/webelemente/arrow_black.gif" alt="">
        </div>
        <div class="box_head_right toggle_searchbox_hide" style="font-size:1.2em;">
            Hersteller 
        </div>
    
    </div>
    <div class="box_middle searchbox_hide">
        <div style="padding:10px;">
            <ul>
    	    {foreach $herstellerListe as $h_id => $hersteller}
                <li style="list-style-type:none;font-size:0.9em;"><a href="/?hersteller={$h_id}">{$hersteller}</a></li>
    		{/foreach}
            </ul>
        </div>
    </div>
    
</div>