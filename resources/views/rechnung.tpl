<div class="adressdaten">
    <!-- PayPalCheckout Rückgabe Rechnungskauf BEGIN -->
    {if $smarty.session.SHOP.paypalCheckout.return.error===true && $smarty.get.ratepay_error==true}
        <div>
            <div>Fehler beim Rechnungskauf. {$langstrings.PayPalCheckout.rechnungskauf_error_add}</div>
            <div>{$smarty.session.SHOP.paypalCheckout.return.msg}</div>
        </div>
    {/if}
    <!-- PayPalCheckout Rückgabe Rechnungskauf END -->

    {if $smarty.get.anfrage!=1 && $smarty.get.mode != "register"}
        <h4>    {$langstrings.buy.billing_address}</h4>
    {/if}

        <p>Bitte tragen Sie Ihre Adressdaten ein. Mit einem * gekennzeichnete Felder sind Pflichtfelder.</p>
    
        <div>
            {html_options name="Persdata[Anrede]" options=$anreden selected=$smarty.session.SHOP.buy.Persdata.Anrede}
            <span class="input_error_msg">Pflichtfeld</span>
        </div>
        
        <div class="addr_100">
            <div class="addr_50">        
                <div class="placeholder">{$langstrings.buy.firstname} *</div>
                <input type="text" name="Persdata[Vorname]" class="text" value="{$old.Persdata.Vorname|default:$smarty.session.SHOP.buy.Persdata.Vorname}" maxlength="255" autocomplete="given-name" required>
                <span class="input_error_msg">Pflichtfeld</span>
                <input type="hidden" name="req[Vorname]" value="persdata">
                
            </div>
            
            <div class="addr_50">
                <div class="placeholder">{$langstrings.buy.name} *</div>
                <input name="Persdata[Nachname]" type="text" class="persdata" value="{$old.Persdata.Nachname|default:$smarty.session.SHOP.buy.Persdata.Nachname}" maxlength="255" autocomplete="family-name" required>
                <span class="input_error_msg">Pflichtfeld</span>
                <input type="hidden" name="req[Nachname]" value="persdata">
            </div>
        </div>
        
        <div>
            <div class="placeholder">{$langstrings.buy.company}</div> 
            <input type="text" name="Persdata[Firma]" class="text" value="{$old.Persdata.Firma|default:$smarty.session.SHOP.buy.Persdata.Firma}" maxlength="255">
        </div>
        
        <div class="addr_100">
            <div class="addr_50">
                <div class="placeholder">{$langstrings.buy.street} *</div>
                <input type="text" name="Persdata[Strasse]" class="text" value="{$old.Persdata.Strasse|default:$smarty.session.SHOP.buy.Persdata.Strasse}" maxlength="31" autocomplete="street-address" required>
                <span class="input_error_msg">Pflichtfeld</span>
                <input type="hidden" name="req[Strasse]" value="persdata">
                
            </div>
            
            <div class="addr_50">        
                <div class="placeholder">Hausnummer *</div>
                <input type="text" name="Persdata[Hausnummer]" class="text" value="{$old.Persdata.Hausnummer|default:$smarty.session.SHOP.buy.Persdata.Hausnummer}" maxlength="255" required />
                <span class="input_error_msg">Pflichtfeld</span>
                <input type="hidden" name="req[Hausnummer]" value="persdata">
                
            </div>
        </div>        
        
        <div class="addr_100">
            <div class="addr_50">
                <div class="placeholder">{$langstrings.buy.postalcode} *</div>
                <input type="text" name="Persdata[PLZ]" id="plz" class="text" value="{$old.Persdata.PLZ|default:$smarty.session.SHOP.buy.Persdata.PLZ}" maxlength="20" autocomplete="postal-code" required />
                <span class="input_error_msg">Pflichtfeld</span>
                <input type="hidden" name="req[PLZ]" value="persdata">
                
            </div>
            
            <div class="addr_50">        
                <div class="placeholder">{$langstrings.buy.city} *</div>
                <input type="text" name="Persdata[Ort]" id="ort" class="text" value="{$old.Persdata.Ort|default:$smarty.session.SHOP.buy.Persdata.Ort}" maxlength="255" autocomplete="address-level2" required />
                <span class="input_error_msg">Pflichtfeld</span>
                <input type="hidden" name="req[Ort]" value="persdata">
                
            </div>
        </div>
                
        <div>
            {html_options options=$Laender id="Land" name="Persdata[Land]" selected=$old.Persdata.Land|default:$smarty.session.SHOP.buy.Persdata.Land|default:$defaultLandID}
            <span class="input_error_msg">Pflichtfeld</span>
        </div>
        
        <div>
            <div class="placeholder">{$langstrings.buy.e_mail} *</div>
            <input type="email" name="Persdata[email]" class="text" value="{$old.Persdata.email|default:$smarty.session.SHOP.buy.Persdata.email}" autocomplete="email" required>
            <span class="input_error_msg">Pflichtfeld</span>
            <input type="hidden" name="req[email]" value="mail">
            
        </div>
        
        <div>
            <div class="placeholder">{$langstrings.buy.phone} *</div>
            <input type="text" name="Persdata[Telefon]" class="text" value="{$old.Persdata.Telefon|default:$smarty.session.SHOP.buy.Persdata.Telefon}" maxlength="31" autocomplete="tel" required>
            <span class="input_error_msg">Pflichtfeld</span>
            <input type="hidden" name="Persdata[ID]" value="{$smarty.session.SHOP.buy.Persdata.ID}">
            <input type="hidden" name="req[Telefon]" value="persdata">
            
        </div>
        
        <div>
            <div id="ustidnr_text">
               {$langstrings.buy.ustidnr_text|nl2br}
            </div>
            <div id="ustidnr_input" style="display:none;">
                <div class="placeholder">{$langstrings.buy.ustidnr}</div>
                <input type="text" name="Persdata[UStIdNr]" class="text" value="{$smarty.session.SHOP.buy.Persdata.UStIdNr}" maxlength="31">
            </div>
        </div>
    
    {if $ini.finanzierung.aktiv==1}
        <div>
            <div class="placeholder"> {$langstrings.buy.birthday}</div>
            {html_select_date field_array="Persdata[bday]" start_year=1900 end_year="-18" field_order="DMY" day_empty="Tag" month_empty="Monat" year_empty="Jahr" time=$smarty.session.SHOP.buy.Persdata.birthday day_value_format="%02d"}
            {if $versandInfo.versandart=="finanzierung"}
                <span class="input_error_msg">Pflichtfeld</span>
            {/if}
            
            {if $versandInfo.versandart=="finanzierung"}
                <input type="hidden" name="req[birthday]" value="date">
            {/if}
            {$langstrings.buy.birthday_explain}
            
        </div>
    {/if}

        <div id="AGBCheckboxWrapper" class="{if $old.AGB||$smarty.session.AGB=="gelesen"}checked{else}unchecked{/if}">
            <div class="checkbox">
                <input id="AGB" type="checkbox" class="checkbox" name="AGB" value="gelesen" {if $old.AGB||$smarty.session.AGB=="gelesen"}checked="checked"{/if} required="required">
                <span class="input_error_msg">Pflichtfeld</span>
                <input type="hidden" name="req[AGB]" value="text">
                <label for="AGB"> Ich akzeptiere die <a style="font-weight:bold;" href="/cms/agb" target="_blank">AGB.</a></label>
            </div>

            

        </div>
</div>
<style>
    #AGBCheckboxWrapper {
        display: flex;
        flex-direction: row;
        gap: 0.5%;
        padding: 2%;
        width: fit-content;
        border-radius:5px;
    }

    #AGBCheckboxWrapper > .checkbox {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-start;
        gap:8px;
    }

    #AGBCheckboxWrapper .checkbox span.input_error_msg {
        margin-top: 0;
        padding: 0;
    }

    #AGBCheckboxWrapper label  {
        min-width: max-content;
    }

    .unchecked {
        transition:all 200ms ease;
        background:rgba(226,6,50,.3);
    }
    .checked {
        transition:all 200ms ease;
        background:rgba(33,143,61,.3);
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // AGB toggle
        const checkboxEl = document.querySelector('#AGB');
        const wrapperEl = document.querySelector('#AGBCheckboxWrapper');

        checkboxEl.addEventListener('change', () => {
            wrapperEl.className = (checkboxEl.checked) ? 'checked' : 'unchecked';
        });

        wrapperEl.addEventListener('click', (e) => {
            const tag = e.target.nodeName.toLowerCase();
            if(tag !== 'a' && tag !== 'input' && tag !== 'label') {
                checkboxEl.checked = !checkboxEl.checked;
                wrapperEl.className = (checkboxEl.checked) ? 'checked' : 'unchecked';
            }
        });

        // Required
        const inputElements = document.querySelectorAll('input');
        for(const inputElement of inputElements) {
            const required = (inputElement.required);
            const errorMsg = inputElement.parentElement.querySelector('.input_error_msg');

            if(!errorMsg || inputElement.id === 'AGB' || inputElement.type === 'hidden') {
                continue;
            }

            if(inputElement.value.length > 0 || required === false) {
                errorMsg.style.opacity = '0';
            }

            if(required && (inputElement.value.length === 0 || inputElement.autocomplete === 'email')) {
                let valid = false;
                if(inputElement.autocomplete === 'email') {
                    valid = validateEmail(inputElement.value);
                }
                // inputElement.style.outline = (valid) ? 'unset' : 'red dashed 1px';
                errorMsg.style.opacity = (valid) ? '0' : '1';
            }

            if(required) {
                inputElement.addEventListener('blur', (e) => {
                    let valid = false;
                    const inputElement = e.target;
                    const errorMsg = e.target.parentElement.querySelector('.input_error_msg');
                    switch (inputElement.autocomplete) {
                        case 'email':
                            valid = validateEmail(inputElement.value);
                            break;
                        default:
                            valid = (inputElement.value.length > 0);
                            break;
                    }
                    inputElement.style.outline = (valid) ? 'unset' : 'red dashed 1px';
                    errorMsg.style.opacity = (valid) ? '0' : '1';
                });
            }
        }
    });

    function validateEmail(email) {
        {literal}
        const emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        {/literal}
        return email.match(emailRegex);
    }

$( document ).ready(function() {
    {* // toggle checked status (CSS)
    $('#AGB').click( function() {
        var chk = $(this).parent().parent();
        let classname = chk.attr("class");
        if(classname=="checked") {
            chk.attr("class",'unchecked');
        }else {
            chk.attr("class",'checked');
        }
    }); *}
    let marginInputFields;
    $('#Land, #liefer_Land').change(function(){
        let land=$('#Land').val();
        if($('#Lieferadresse_f').prop("checked")==false)
        {
            land=$('#liefer_Land').val();
        }
        let c_url="/update_versand?Land="+land+"&liefer=1";
        console.log(c_url);
        $.get(c_url,function(pppVersand){
            $('#Versand').val(pppVersand);
        });
    })

    $( "#ustidnr_input" ).hide();
    $( "#ustidnr_text" ).hide();
    $('#Land').change(function(){
        let selected_country = $( "#Land" ).val();
        
        if (selected_country == 47) {
            $( "#ustidnr_input" ).hide();
            $( "#ustidnr_text" ).hide();
        } else {
            $( "#ustidnr_text" ).show();
            $( "#ustidnr_input" ).show();
        }
    });  
    
    // placeholder anim
    $('.placeholder').click(function() {
        $(this).next().focus();
    });
    $('.adressdaten input[type=text], .adressdaten input[type=email], .adressdaten textarea').each(function() {
        let inpt = $(this).val();
        if (inpt.length > 0 && textAnimationData2D($(this)[0])) {
            const { placeholder: { rawHeight } } = textAnimationData2D($(this)[0]);
            $(this).prev().css({
                "margin-left": "0px",
                "margin-top": -rawHeight + "px",
                "color": "#000",
            });
        }
    });
    $('.adressdaten input[type=text], .adressdaten input[type=email], .adressdaten textarea').focus(function(){
        let inpt = $(this).val();
        if(inpt.length == 0 && textAnimationData2D($(this)[0])) {
            const { placeholder: { rawHeight } } = textAnimationData2D($(this)[0]);
            $(this).prev().css({
                "margin-left": "0px",
                "margin-top": -rawHeight + "px",
                "color": "#000",
            });
        }
    });      
    $('.adressdaten input[type=text], .adressdaten input[type=email]').blur(function(){
        let inpt = $(this).val();
        if(inpt.length == 0 && textAnimationData2D($(this)[0])) {
            const { input:{ height: heightInput }, placeholder:{ height: heightPlaceholder } } = textAnimationData2D($(this)[0]);
            const margin = (heightInput - heightPlaceholder) / 2;
            $(this).prev().css({
                "margin-left": margin / 2 + "px",
                "margin-top": margin + "px",
                "color":"#8E8E8E",
            });
            marginInputFields = margin;
        }
    });
    {*
        INFO: Es kommt zu einem Problem mit der Animation
        wenn vorher kein anderes Feld mit der Animation angesprochen wird da marginInputFields sonst leer ist.
        Die Rückkehr animation funktioniert dann schlich nicht .
    *}
    $('.adressdaten textarea').blur(function(){
        let inpt = $(this).val();
        if(inpt.length == 0 && textAnimationData2D($(this)[0])) {
            const { input:{ height: heightInput }, placeholder:{ height: heightPlaceholder } } = textAnimationData2D($(this)[0]);
            $(this).prev().css({
                "margin-left": marginInputFields / 2 + "px",
                "margin-top": marginInputFields + "px",
                "color":"#8E8E8E",
            });
        }
    });


    function textAnimationData2D(inputElement, textSelector = '.placeholder') {
        if(!inputElement || !isDOM(inputElement)) return;
        const placeholder = inputElement.parentElement.querySelector(textSelector);
        if(!placeholder || !isDOM(placeholder)) return;

        const { height: inputHeight } = getElement2DData(inputElement);
        const { height: placeholderHeight, rawHeight: placeholderRawHeight } = getElement2DData(placeholder);

        return {
            input: {
                height: inputHeight,
            },
            placeholder: {
                height: placeholderHeight,
                rawHeight: placeholderRawHeight,
                ref: placeholder,
            },
        }
    }

    function getElement2DData(element) {
        if(!isDOM(element)) return;
        const style = getComputedStyle(element);

        const paddingX = parseFloat(style.paddingLeft) + parseFloat(style.paddingRight);
        const paddingY = parseFloat(style.paddingTop) + parseFloat(style.paddingBottom);
        const borderX = parseFloat(style.borderLeftWidth) + parseFloat(style.borderRightWidth);
        const borderY = parseFloat(style.borderTopWidth) + parseFloat(style.borderBottomWidth);

        return {
            height: element.offsetHeight,
            width: element.offsetWidth,
            paddingX: paddingX,
            paddingY: paddingY,
            paddingLeft: parseFloat(style.paddingLeft),
            paddingRight: parseFloat(style.paddingRight),
            paddingTop: parseFloat(style.paddingTop),
            paddingBottom: parseFloat(style.paddingBottom),
            borderX: borderX,
            borderY: borderY,
            borderLeft: parseFloat(style.borderLeftWidth),
            borderRight: parseFloat(style.borderRightWidth),
            borderTop: parseFloat(style.borderTopWidth),
            borderBottom: parseFloat(style.borderBottomWidth),
            rawHeight: element.offsetHeight - paddingY - borderY,
            rawWidth: element.offsetWidth - paddingX - borderX,
            ref: {
                target: element,
                parent: element.parentElement
            }
        }
    }

    function isDOM(Obj) {
        return Obj instanceof Element;
    }
});
</script>