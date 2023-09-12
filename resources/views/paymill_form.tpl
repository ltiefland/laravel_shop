<style type="text/css">
.controls div {
    padding:4px;
}
.controls label {
    width:150px;
    display:block;   
    float:left; 
}
</style>
<form id="payment-form" action="/de-de/default/phpsample" method="POST">
    <div class="clearfix"></div>
    <div id="payment-form-cc">
        <input class="card-amount" type="hidden" value="0.15"/>
        <input class="card-currency" type="hidden" value="EUR"/>
        <div class="controls controls-row">
            <div class="span3">
                <label translate="iframe">Kreditkartennummer</label>
                <input class="card-number span3" type="text" size="20" value=""/>
            </div>
            <div class="span1">
                <label translate="iframe">Prüfziffer</label>
                <input class="card-cvc span1" type="text" size="4" value=""/>
            </div>
        </div>
        <div class="controls">
            <div class="span4">
                <label translate="iframe">Karteninhaber</label>
                <input class="card-holdername span4" type="text" size="20" value=""/>
            </div>
        </div>
        <div class="controls">
            <div class="span3">
                <label translate="iframe">Gültigkeitsdatum (MM/JJJJ)</label>
                <input class="card-expiry-month span1" type="text" size="2" value="12"/>
                <span> / </span>
                <input class="card-expiry-year span1" type="text" size="4" value="2015"/>
            </div>
        </div>
    </div>
    <div id="payment-form-elv" style="display: none;">
        <div class="controls">
            <div class="span3">
                <label translate="iframe">Kontoinhaber</label>
                <input class="elv-holdername span3" type="text" size="20" value=""/>
            </div>
        </div>
        <div class="controls controls-row">
            <div class="span3">
                <label translate="iframe">Kontonummer</label>
                <input class="elv-account span3" type="text" size="20" value=""/>
            </div>
        </div>
        <div class="controls">
            <div class="span3">
                <label translate="iframe">BLZ</label>
                <input class="elv-bankcode span3" type="text" size="20" value=""/>
            </div>
        </div>
    </div>
    <div class="controls">
        <div class="span3">
            <button class="submit-button btn btn-primary" type="submit" translate="iframe">Jetzt kaufen</button>
            <br /><br /><!-- img src="img/paymenticons.png" / -->
        </div>
    </div>
</form>