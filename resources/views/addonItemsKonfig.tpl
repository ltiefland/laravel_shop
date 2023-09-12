<div class="zubehoer_scroll item_zubehoer">
    <h1 style="padding-left:10px;">Bestelle passend dazu gleich mit:</h1>
        
        {foreach $addonitems as $item}
        <!-- ANFANG Artikel -->
  
            
            <div style="float:left;margin:10px;border:1px solid #ccc;width:130px;padding:5px;">
                <div style="font-size:0.8em;height:40px;width:130px;">
                    <b>{$item.kurzbezeichnung_erweitert|truncate:50:"...":true:false}</b>
                </div>

                <div class="box_middle" style="width:130px;position:relative;">
                {$item.NEU}
                    <div style="width:50px;height:70px;float:left;">
                        <img src="{$item.bild_1_url_mini}" width="50" alt="{$item.kurzbezeichnung_erweitert}" title="{$item.kurzbezeichnung_erweitert}" />
                    </div>
                    <div style="width:78px;float:left;text-align:right;">
                        <div style="clear:both;float:none;text-align:right;">
                            <strong style="font-size:0.85em;color:#700000;">
                            {$item.preis1|money_format|replace:"EUR":"&euro;"}</strong><br />
                            <div style="font-size:0.65em;">{$langstrings.shop.price_msg_brutto}<a class="link" style="cursor:pointer;">{$langstrings.shop.price_msg_link}</a></div>
                        </div>
                    </div>
                    <div style="padding-top:5px;clear:both;float:none;text-align:center;">
                    
                        {if $smarty.get.basket==true}
                        <input class="addon_basket" type="image" src="/images/webelemente/basket_mini.gif" alt="{$langstrings.shop.in_basket}" title="{$langstrings.shop.in_basket}" id="addon_{$item.ID}" />
                        {else}
                        <div style="width:130px!important;clear:both;float:none;height:18px;">
                            <input style="height:18px;vertical-align:middle;" id="addon_{$item.ID}" type="checkbox" 
                                name="addons[]" value="{$item.ID}" />
                            <label style="height:18px;vertical-align:middle;font-size:0.8em;" for="addon_{$item.ID}">mitbestellen</label>
                            
                        </div>
                        {/if}
                    
                    
                    </div>
                   
                </div>
            </div>

            <!-- ENDE Artikel -->
        {/foreach}

</div>