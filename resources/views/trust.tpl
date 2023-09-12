<div class="basketInfoBoxen">
    {if $ini.trustedShops.shop_id}
    <div class="basketbox01">
        <p>
        <script type="text/javascript">
          _tsRatingConfig = {
        	tsid: '{$ini.trustedShops.shop_id}',
        	variant: 'skyscraper_horizontal', 
        	// valid values: 'skyscraper_vertical', 'skyscraper_horizontal', vertical
        	theme: 'light',
        	reviews: 10, 
        	// default = 10
        	borderColor: '#aabbcc', 
        	// optional - override the border
        	colorclassName: 'test', 
        	// optional - override the whole sticker style with your own css class
        	introtext: 'Was unsere Kunden über uns sagen:',
        	// optional, not used in skyscraper variants
                richSnippets: 'on', 
          };
          var scripts = document.getElementsByTagName('SCRIPT'),
          me = scripts[scripts.length - 1];
          var _ts = document.createElement('SCRIPT');
          _ts.type = 'text/javascript';
          _ts.async = true;
          _ts.charset = 'utf-8';
          _ts.src ='//widgets.trustedshops.com/reviews/tsSticker/tsSticker.js';
          me.parentNode.insertBefore(_ts, me);
          _tsRatingConfig.script = _ts;
        </script>      
  
        </p>
        
    </div>
{/if}    
{*
    <div class="basketbox02">
        <img src="/images/webelemente/logo_comodo.gif" />
    </div>
*}    
{if $ini.trustPilot.aktiv==1 && $ini.trustPilot.widgetCode}       
    <div class="basketbox03">
            {$ini.trustPilot.widgetCode}
    </div>
{/if}
</div>
