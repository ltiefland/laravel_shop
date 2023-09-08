        {if $nopermission==false}
        <script>
            $(document).ready(function(){
                $('.newsletter_checkbox').click(function(){
                    var daten=$('#newsletter_form').serializeArray();
                    $.ajax({
                        type: "POST",
                        url: "/module/newsletter_status.php?mode=newsletter_edit",
                        data: daten
                    }).done(function( html ){
                        $("#newsletter_status").html(html); 
                    });      
                });
                $('.open_input_info').click(function(){
                     $(this).next().slideToggle("fast");
                });
            });
        </script>
        <div id="newsletter_status">
            <div class="box_top">    
               <div class="h1 big" style="font-size:22px!important;">Newsletter verwalten</div>
            </div>
                <form style="padding:20px;" name="newsletter" id="newsletter_form" method="post" action="/index.php?mode=newsletter_edit">
                <p>Bitte w&auml;hlen Sie die Newsletter aus, die Sie empfangen m&ouml;chten:<br /><br /></p>
                
                <div style="margin-left:10px;" class="{if $kein_marketing=='on'}kein_marketing{/if}">
                
                
                {if $newsletters|is_array}
                    {foreach $newsletters as $key => $newsletter}
                        <div class="input_row">
                            <input name="newsletter[]" value="{$newsletter.ID}" class="newsletter_checkbox" type="checkbox" id="nl_{$newsletter.ID}"
                            {foreach $newsletter_status as $k => $v}
                                {if $newsletter.ID==$v.Verteiler}
                                    checked='checked' 
                                {/if}
                            {/foreach}
                            {if $kein_marketing=='on'}
                                disabled="disabled"
                            {/if}
                            /> 
                            <label for="nl_{$newsletter.ID}">{$newsletter.Name}</label>
                            
                            
                            {foreach $newsletter_status as $k => $v}
                                {if $newsletter.ID==$v.Verteiler}
                                    <i class="far fa-question-circle open_input_info"></i>
                                    <div id="info_{$newsletter.ID}" class="input_info">
                                        {assign var="erstellt_von" value=$v.erstellt_von|unserialize}
                                        <b>Anmeldeprotokoll</b><br />
                                        angemeldet am: {$v.erstellt_am|date_format:"d.m.Y H:i"} Uhr<br />
                                        angemeldet &uuml;ber: {$erstellt_von.src}
                                    </div>
                                {/if}
                            {/foreach}                        
                        </div>
                    {/foreach}
                {else}
                    <br />Keine Daten.<br />
                {/if}
                </div>
                
                <!--
                <p>
                <input type="hidden" name="kein_marketing" value="off" />
                <br /><br />
                <input type="checkbox" name="kein_marketing" id="kein_marketing" 
                {if $kein_marketing=='on'}
                    checked='checked'
                {/if}
                />
                
                <label for="kein_marketing">Ich m&ouml;chte generell keine E-Mails zu Werbezwecken erhalten.</label>
                </p>
                -->
                <input type="hidden" name="action" value="change_newsletter" />
                
                <!-- <input style="margin:20px;" type="submit" value="Speichern" /> -->
                <br /><br />
                {if $smarty.post.action=='change_newsletter'}
                  <p>  Ihre &Auml;nderungen wurden gespeichert.</p>
                {/if}
            </form>
            {else}
                <p>
                    Sie haben leider keine Berechtigung, diese Seite anzuzeigen.<br />
                    Bitte registrieren Sie sich, oder melden Sie sich an.
                </p>
            {/if}
    
        </div>
        
<style>
/* input Felder in z.B. tabs, akkordion */
.input_row {
    padding:5px 0;
}
.input_info {
    transition:all 2ms ease-in;
    padding:5px 0;
    display:none;
}        
.open_input_info {
    cursor:pointer;
}
</style>