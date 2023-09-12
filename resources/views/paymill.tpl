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
<script type="text/javascript">
      var PAYMILL_PUBLIC_KEY = '{$ini.kreditkarte.public_key}';
</script>
<script src="https://bridge.paymill.com/"></script>
<script language="javascript" type="text/javascript">
    $(function () 
    {
          function PaymillResponseHandler(error, result) 
          {
              if (error) {
                  // Show the error message above the form
                  $(".payment-errors").text(error.apierror);
              }
              else
              {
                  $(".payment-errors").text("");
                  var form = $("#payment-form");
                  // Token
                  var token = result.token;
                  // Insert token into the payment form
                  form.append("<input type='hidden' name='paymillToken' value='" + token + "'/>");
                  form.get(0).submit();
              }
              $(".submit-button").removeAttr("disabled");
          }
 
          $("#payment-form").submit(function (event) {
              // Deactivate the submit button to avoid further clicks
              $('.submit-button').attr("disabled", "disabled");
              if (false == paymill.validateCardNumber($('.card-number').val())) 
              {
                  $(".payment-errors").text("Invalid card number");
                  $(".submit-button").removeAttr("disabled");
                  return false;
              }
 
              if (false == paymill.validateExpiry($('.card-expiry-month').val(), $('.card-expiry-year').val())) 
              {
                  $(".payment-errors").text("Invalid date of expiry");
                  $(".submit-button").removeAttr("disabled");
                  return false;
              }
 
              paymenttype = $('.paymenttype.disabled').length ? $('.paymenttype.disabled').val() : 'cc';
              switch (paymenttype) 
              {
                  case "cc":
                      var params = 
                      {
                          amount_int:     $('.card-amount-int').val(),  // E.g. "15" for 0.15 Eur
                          //amount:         $('.card-amount').val(),    // deprecated!
                          currency:       $('.card-currency').val(),    // ISO 4217 e.g. "EUR"
                          number:         $('.card-number').val(),
                          exp_month:      $('.card-expiry-month').val(),
                          exp_year:       $('.card-expiry-year').val(),
                          cvc:            $('.card-cvc').val(),
                          cardholdername: $('.card-holdername').val()
                      };
                      break;
 
                  case "elv":
                      var params = 
                      {
                          number:         $('.elv-account').val(),
                          bank:           $('.elv-bankcode').val(),
                          accountholder:  $('.elv-holdername').val()
                      };
                      break;
              }
              paymill.createToken(params, PaymillResponseHandler);
 
              return false;
          });
 
          // Toggle buttons and forms
          $(".paymenttype").click(function (event) 
          {
              $(this).addClass('btn-primary disabled');
              $('#payment-form-cc').toggle();
              $('#payment-form-elv').toggle();
              if($(this).val()=='cc') {
                  $('#btn-paymenttype-elv').removeClass('btn-primary disabled');
              }
              else 
              {
                  $('#btn-paymenttype-cc').removeClass('btn-primary disabled');                  
              }
          });
      });
 </script>
<!-- START: ZAHLUNGSFORMULAR -->
<div class="controls">
    <div class="span4">
        <div class="payment-errors text-error"></div>
    </div>
</div>
<div class="clearfix"></div>
<div id="transaction-form">
    <div class="well span5" style="margin:40px 0; padding:30px 19px;">
        <form id="payment-form" action="/return_{$bestellId}.html" method="POST">
            <div class="clearfix"></div>
            <div id="payment-form-cc">
                <input class="card-amount-int" type="hidden" value="{$summe}"/>
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
            <input type="hidden" name="order_id" value="{$bestellId}">
        </form>
    </div>
</div>
<!-- END: ZAHLUNGSFORMULAR -->