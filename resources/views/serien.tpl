{if $smarty.get.serie} 
    {include file="shopposition.tpl" nocache}
{/if}
<section id="subdir_artikel_wrapper">
    <div class="inner">
        <div class="subdir_artikel">
            <div class="loader" style="display:none;position:absolute;left:45%;background-color:#fff;margin-top:2%;padding:2%;z-index: 9999;">
                <img src="/images/webelemente/loading.gif" /> <span style="clear: both;display: block;margin-top: 10px;text-align: center;">L&auml;dt. Bitte warten</span>
            </div>
        
        {foreach $serien as $artstamm}
            {include file="subdir_artstamm.tpl" artstamm=$artstamm  inline}
        {/foreach}

        {foreach $items as $item}
            {include file="item_small.tpl"  inline}
        {/foreach}

        </div>
    </div> 
</section>