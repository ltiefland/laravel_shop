        {if $item->sameDayDeliverText}
        <span>
            <span class="tooltip-root"></span>
            <span class="tooltip-root fixed">
                <a class="tooltip tooltip-trigger" href="/kurier.html">
                    <img src="/images/webelemente/dhlkurier/sdd-icon-klein.png" alt="SDD-Versand"/>
                </a>
                <div style="display:none;">
                    <div class="tooltip-data">{$item->sameDayDeliverText}</div>
                    <div class="tooltip-title">DHL Kurier</div>
                </div>
            </span>
        </span>
        {/if}

