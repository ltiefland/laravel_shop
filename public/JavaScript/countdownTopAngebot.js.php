<?php
    if($temp = getSpecialOffer()) {
        $bis = explode("-",$temp['bis']);
    }else{
        $bis = time();        
    }
    $now = date("Y-m-d",time());
    
    $one_day = 86400;
    
    $timestamp_now = strtotime($now);
    $timestamp_bis = strtotime($temp['bis']);
    
    $timediff = $timestamp_bis - $timestamp_now;
    
    if(is_array($bis)) {  
?>
<script src="/JavaScript/jquery.countdown.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
            var datum = new Date(<?=$bis[0]?>,<?=intval($bis[1]-1)?>,<?=$bis[2]?>,23,59,59);
            <?php 
            if($timediff >= $one_day) {
                $days = "Tage";
                if($timediff==$one_day) {
                    $days = "Tag";
                }
                
                
                echo "$('#countdown').countdown({until: datum, format: 'dHMs', timezone: 1, layout: 'Das Angebot gilt noch {dnn} ".$days." und {hnn}{sep}{mnn}{sep}{snn} Std.'});";                
            }else{
                echo "$('#countdown').countdown({until: datum, format: 'HMS', timezone: 1, layout: 'Das Angebot gilt noch {hnn}{sep}{mnn}{sep}{snn} Std.'});";
            }
            ?>
            
});
</script>
<?php

    }
?>