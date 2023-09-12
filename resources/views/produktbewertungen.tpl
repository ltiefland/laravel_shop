<!-- $Id: produktbewertungen.tpl 312 2022-06-08 13:06:08Z erling $ BEGIN -->
<style>
    
    .produktbewertung * {
        text-align:left;
    }
    .produktbewertung h1 {
        font-size:1em;
    }
    .produktbewertung h2 {
        font-size:.9em;
    }
    .produktbewertung p {
        font-size:.8em;
        font-family:'montserratmedium';
        
    }
    #submitBewertung {
        font-size:.6em;
        width:auto;
    }
    .bew_text {
        padding:0;
    }
    .bew {
        padding:0;
    }
    .stars {
        float:left;
    }
    .form_row {
        clear:both;
        padding:2% 0;
    }
    #sterne_anzahl {
        margin:1px 0 0 6px;
        width:20px;
        float:left;
    }
    .bew_bild {
        padding: 2% 0;
    }
    input,
    textarea {
        padding:1%!important;
        width:48%;
    }
    .produktbewertung label,
    #sterne_anzahl {
        font-size:.6em!important;
    }
    .box_top {
        background-image:none;
        padding:2%;
    }
    @media screen and (max-width:768px) {
        input,
        textarea {
            padding:1%!important;
            width:94%;
        }
    }
</style>
<script>
    $(function(){
        // text aufklappen
        $('.bew_opener').click(function(){
            $('.bew_beschreibung').slideToggle( "fast", function() {
                if($('.bew_beschreibung').is(":visible") == true) {
                    $('.bew_opener').html("weniger anzeigen");
                }else{
                    $('.bew_opener').html("mehr anzeigen");
                }
            });                
        });
        
        $('#submitBewertung').click(function(e){
            e.preventDefault();
            if($('#sterne').val()==0)
            {
                alert("Bitte geben Sie dem Produkt eine Note!");
                return false;
            }
            if($('#name').val()=="")
            {
                alert("Bitte geben Sie einen Namen ein!");
                return false;
            }
            $('#bewertungsFormular').submit();
        })
        $('.stars').css("cursor","pointer").click(function(){
            star=$(this).attr("data-val");
            for(i=1;i<=star;i++)
            {
                $('#star_'+i).attr("src","/images/webelemente/fullstar.png");
            }
            for(i=(parseInt(star)+1);i<=5;i++)
            {
                $('#star_'+i).attr("src","/images/webelemente/emptystar.png");
            }
            $('#sterne_anzahl').text("(" + star + ")");
            $('#sterne').val(star);
        });
    });
</script>

<div class="box_static produktbewertung">
    <div class="box_top">
        
        <h2>Produktbewertung</h2>
        
        
        <div class="bew_text">
            <div class="hersteller_logo">{$hersteller_Logo1}</div>
            <div class="bew_bild">
                <a href="{$link}"><img src="{$bild}" /></a>
            </div>
            
            
            <h1>{$hersteller_kurzbezeichnung}</h1>
            <p>Bitte bewerten Sie unser Produkt.<br />
            Füllen Sie das folgende Formular aus und drücken Sie 'Bewertung speichern'. <br /><br />Vielen Dank!</p>
            
        {if $meld}
            <div class="bew">
                {$meld}
            </div>
        
        {else}
            <form action="index.php" id="bewertungsFormular" method="post">
            <div class="bew">
                <div class="form_row">
                    
                    {assign var="sterne" value="5"}
                    {if $smarty.get.sterne}
                        {assign var="sterne" value=$smarty.get.sterne}
                    {/if}
                    {for $i=1;$i<=$sterne;$i++}
                    <img src="/images/webelemente/fullstar.png" style="width:20px;" id="star_{$i}" data-val="{$i}" class="stars" />
                    {/for}
                    {for $i=($sterne+1);$i<=5;$i++}
                    <img src="/images/webelemente/emptystar.png" style="width:20px;" id="star_{$i}" data-val="{$i}" class="stars" />
                    {/for}
                    <div id="sterne_anzahl">({$sterne})</div>
                    <input type="hidden" name="sterne" id="sterne" {if $smarty.get.sterne}value="{$smarty.get.sterne}"{/if} />
                </div>
                
                <div class="form_row">
                    <label>Ihr Name *:</label><br />
                    <input type="text" name="name" id="name" value="{$name}" />
                </div>
                
                <div class="form_row">
                    <label>Überschrift:</label><br />
                    <input type="text" name="titel" id="titel" />
                </div>            
    
                <div class="form_row">
                    <label>Bewertungstext:</label><br />
                    <textarea rows="5" name="text" id="text"></textarea>
                </div>            
    
                <div class="form_row">
                    <p class="small align-left" style="padding-top:1%; font-size:0.6em;">Die mit einem * gekennzeichneten Felder sind Pflichtfelder.</p>
                    <input type="submit" id="submitBewertung" value="Bewertung speichern" /><br />
                    
                </div>            
    

    
            <input type="hidden" name="mode" value="produktbewertung" />
            <input type="hidden" name="artikel" value="{$artikel}" />
            <input type="hidden" name="hash" value="{$hash}" />
            <input type="hidden" name="login" value="{$login}" />
            </div>            
        </form>
        {/if}
           
            <br />
            <a class="shopButton" href="{$link}">zurück zum Produkt</a>
        </div>
    </div>
</div>
<!-- $Id: produktbewertungen.tpl 312 2022-06-08 13:06:08Z erling $ END -->