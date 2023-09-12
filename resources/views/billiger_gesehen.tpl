<style>
/* billiger_gesehen */
section.billiger_gesehen {
    padding:2%;
    display:flex;
    justify-content: center;
    align-content: center;
    max-width:calc(1206px - 4%);
    margin:0 auto;
}
.grill_anim {
    max-width:min-content;
    margin:2%;
    width:auto;
    padding:2%;
}
.billiger_gesehen_headline {
    max-width: 25%;
    padding: 2%;
    display:flex;
    justify-content: center;
    align-content: center;
    flex-wrap: wrap;  
    text-align:center;
}

.billiger_gesehen_content input[type=text],
.billiger_gesehen_content textarea
 {
    padding:1%;
    width:96%;
    margin:1%;
}
.billiger_gesehen_content p {
    padding: 0 1%;
}
.billiger_gesehen_content a:link,
.billiger_gesehen_content a:active,
.billiger_gesehen_content a:visited {
    color:#fff;
    text-decoration:underline;
}
.billiger_gesehen_content a:hover,
.billiger_gesehen_content a:focus {
    color:rgb(240,240,240);
}


</style>
<script>
$(function()
{
    $('input:submit, input:button, input:reset').button();
});
</script>

<section class="billiger_gesehen">
    
    <div class="grill_anim">
        <img src="/images/webelemente/loading.gif">
    </div>
    
    <div class="billiger_gesehen_headline">
        <h2>
           Sie haben Ihren Traumgrill woanders g&uuml;nstiger gesehen?
        </h2>
    </div>
    <div class="billiger_gesehen_content">
        <form action="" method="post" onsubmit="return billigerGesehenSubmit(this)">
            <input type="hidden" name="billigerGesehen_shopPreis" value="{$item.preis}" onchange="this.value=billigerGesehenVerifyPreisInput(this.value)" onkeyup="this.value=billigerGesehenVerifyPreisInput(this.value)" />
            <input type="hidden" name="item" value="{$item.ID}" />
            <input type="hidden" name="billigerGesehen" value="true" />
    
            <div class="billigerGesehen_form">
                <p>
                    <strong>Sagen Sie uns Bescheid! Wir machen Ihnen ein Angebot!</strong>
                </p>
                <div class="billiger_gesehen_form_toggle">                          
                    <input type="text" name="billigerGesehen_kundeName" value="" placeholder="Ihr Name">
                            
                    <input type="text" name="billigerGesehen_kundePLZ" value="" placeholder="Ihre PLZ">
                    
                    <p>Wo und wann haben Sie diesen Artikel g&uuml;nstiger gesehen?<br />(Bitte geben Sie auch den Link zum Artikel an.)</p>
                    <textarea name="billigerGesehen_kundeNachricht" placeholder="Ihr Kommentar"></textarea>
    
                    <input type="text" name="billigerGesehen_kundeMail" value="" placeholder="Ihre E-Mailadresse">
                    
                    <p>Welchen Preis haben Sie gesehen?</p>
                    <input type="text" name="billigerGesehen_kundePreis" value="" placeholder="G&uuml;nstigerer Preis">
    
                    <p>Ich habe die <a href="/cms/datenschutz">Datenschutzbestimmungen</a> gelesen.
                    <br /><span style="font-size:0.8em;"> Felder, die mit einem * gekennzeichnet sind, sind Pflichtfelder.</span></p> 
                    <input id="billigerGesehen_{$item.ID}_submitButton" class="button" type="submit" name="confirm" value="Preisanfrage abschicken" />
                </div>       
            </div>
        </form>
    </div>
    
</section>