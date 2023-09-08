<!-- ANFANG .content -->
<div class="content">
     
    {if ( ($smarty.request.mode=="login" && isset($login) && $login["ret"] === false) || 
        $smarty.get.mode == "login" ||
        $smarty.get.mode == "favoriten" ||
        $smarty.get.mode == "forgot_pw" || 
        $smarty.get.mode == "register" || 
        $smarty.get.mode == "list_orders" || 
 
        $smarty.get.mode == "change_pw" || 
        $smarty.get.mode == "addresses")}

        {include file="login_center.tpl"} 
        
        {if $smarty.get.basket==true}
            {include file="add_to_basket_dialog.tpl" hideWeiterButton=true}        
        {/if}
    
    {elseif $error_content}
        <section>
            <div class="inner">
                <div class="typo3content">     
                    {$error_content}
                </div>
            </div>
        </section>
    {else}
    
    
    
        {if $pagetype == "Startseite" && $file != "buy.tpl" && ( $neue_produkte )}

            {if $ini.modules.neue_produkte == 1 && is_array($neue_produkte) && count($neue_produkte)>2}
            <section class="section_itemSlider">
                {include file="itemSlider.tpl" items=$neue_produkte angebot=0 itemSliderHeadline="Neue Produkte" suffix="neueprodukte"}
            </section>
            {/if}

        {/if}
        

        {if $pagetype=="Startseite"}
           {include file="angebote.tpl"}
        {/if}
        
        {if $pagetype=="Startseite" && $ini.modules.herstellerListe==1 && $herstellerListe_footer|is_array}
            {include file="hersteller_slider.tpl"}    
        {/if}

        {*if $file && $file!="aktion.tpl"*}
            {block name="content"}{/block}
        {*/if*}
        
        {$content}
        
        {*
        {if $pagetype=="Startseite"}
            {include file="turnaround.tpl"}
        {/if}
        *}
        
        {if ($pagetype=="Startseite" || $pagetype=="Navigationsseite" || $pagetype=="Itemseite") && is_array($topseller) && count($topseller)>2}
        <section class="section_itemSlider">
            {include file="itemSlider.tpl" items=$topseller angebot=0 itemSliderHeadline="Unsere Topseller" suffix="topseller" anzahl=4}
        </section>
        {/if}

        {if $ini.modules.add_to_basket==1 && $file != "buy.tpl"}
            {include file="add_to_basket_dialog.tpl"}       
        {/if} 
    {/if}

</div>
<!-- ENDE .content -->