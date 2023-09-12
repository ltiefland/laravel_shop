<!-- $Id$ BEGIN -->
{$pi = $smarty.session.SHOP.BASKET->paymentInfo}
<style>
    a.payment-button {
        color: #000;
        background-color: #fff;
        border: 1px solid #ccc;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #paypal-button-container {
        width:100%;
        text-align:center;
    }
    .payment-button-container{
        width: 100%;
        max-width: 750px;
        margin: 0 auto;
    }
    .payment-button{
        position: relative;
        display:block;
        width:100%;
        height:55px;
        text-align:center;
        border-radius:4px;
        background-color:#eee;
        margin-bottom:17px;
        cursor: pointer;
        overflow:hidden;
    }
    .payment-button:hover{
        filter: brightness(0.95);
    }
    .payment-button img{
        /*
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        */
        cursor: pointer;
    }
    @media only screen and (max-width: 500px){
        .payment-button{
            height:45px;
            margin-bottom:14px;
        }
    }

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://www.paypal.com/sdk/js?client-id={$ini.PayPalPlus.clientId}&intent=authorize&currency=EUR&components=buttons,marks&locale=de_DE"></script>
<div id="paypal-button-container"></div>
<div id="additional-button-container" class="payment-button-container">
            <a id="Vorkasse" class="additional payment-button"><img src="/images/webelemente/za_vorkasse.png" alt=""></a>
    {foreach $versandOptionen as $opt}
        {if $opt.rufname=="vorkasse"}
        {elseif $opt.rufname=="crefopay"}
            <a id="crefopay" class="additional payment-button"><img src="/images/webelemente/za_crefopay.png" alt=""></a>
        {elseif $opt.rufname=="selbstabholung"}
            <a id="Barzahlung" class="additional payment-button"><img src="/images/webelemente/za_selbstabholung.png" alt=""></a>
        {elseif $opt.rufname=="nachnahme"}
            <a id="Nachnahme" class="additional payment-button"><img src="/images/webelemente/za_nachnahme.png" alt=""></a>
        {elseif $opt.rufname=="sofortueberweisung"}
            <a id="sofortüberweisung" class="additional payment-button"><img src="/images/webelemente/za_sofortueberweisung.png" alt=""></a>
        {elseif $opt.rufname=="easycredit"}
            {if $smarty.session.SHOP.SUMME >= 200 && $smarty.session.SHOP.SUMME <=10000}
                <a id="easycredit" class="additional payment-button"><img src="/images/webelemente/za_easycredit.png" alt=""></a>
            {/if}
        {/if}
    {/foreach}
    {if $ini.PayPalCheckout.invoicePayment==1 && $pi.Total >= 5 && $pi.Total <=2500}
        <a id="PaypalRechnungskauf" class="additional payment-button"><img src="/images/webelemente/za_rechnung.png" alt=""></a>
    {/if}
</div>
<script>
    {$summe=$pi.Total}
    {foreach $smarty.session.SHOP.BASKET->items as $bItem}
        {if $bItem->code}
            {$discount=($bItem->price*-1)}
            {$summe=$summe+$discount}
        {/if}
    {/foreach}
    paypal.Buttons({
        createOrder: (data, actions) => {
            return actions.order.create({
                purchase_units: [{
                    shipping:{
                        "name": {
                            "full_name": {if $smarty.session.SHOP.Lieferadresse === "packstation" }"{$smarty.session.SHOP.buy.Persdata.liefer_Vorname_pst} {$smarty.session.SHOP.buy.Persdata.liefer_Nachname_pst}"{else}"{$smarty.session.SHOP.buy.Persdata.liefer_Vorname} {$smarty.session.SHOP.buy.Persdata.liefer_Nachname}"{/if}
                        },
                        "address": {
                            "address_line_1": {if $smarty.session.SHOP.Lieferadresse === "packstation" }"{$smarty.session.SHOP.buy.Persdata.liefer_Strasse_pst} {$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer_pst}"{else}"{$smarty.session.SHOP.buy.Persdata.liefer_Strasse} {$smarty.session.SHOP.buy.Persdata.liefer_Hausnummer}"{/if},
                            "address_line_2": {if $smarty.session.SHOP.Lieferadresse === "packstation" }"{$smarty.session.SHOP.buy.Persdata.liefer_Firma_pst}"{else}"{$smarty.session.SHOP.buy.Persdata.liefer_Firma}"{/if},
                            "admin_area_2": {if $smarty.session.SHOP.Lieferadresse === "packstation" }"{$smarty.session.SHOP.buy.Persdata.liefer_Ort_pst}"{else}"{$smarty.session.SHOP.buy.Persdata.liefer_Ort}"{/if},
                            "postal_code": {if $smarty.session.SHOP.Lieferadresse === "packstation" }"{$smarty.session.SHOP.buy.Persdata.liefer_PLZ_pst}"{else}"{$smarty.session.SHOP.buy.Persdata.liefer_PLZ}"{/if},
                            "country_code": {if $smarty.session.SHOP.Lieferadresse === "packstation" }"{$smarty.session.SHOP.buy.Persdata.liefer_Land_pst|getIsoCode}"{else}"{$smarty.session.SHOP.buy.Persdata.liefer_Land|getIsoCode}"{/if}
                        }
                    },
                    amount: {
                        value: '{$pi.Total}',
                        breakdown:{
                            item_total:{
                                value:'{$pi.Total}',
                                currency_code:"EUR"
                            },
                            {if $discount}
                            discount:{
                                value:{$discount},
                                currency_code:"EUR"
                            },
                            {/if}
                            shipping:{
                                value:'{$smarty.session.SHOP.VERSAND.preis|default:0.00}',
                                currency_code:"EUR"
                            }
                        }
                    },
                    items:[
                        {foreach $smarty.session.SHOP.BASKET->items as $bItem}
                        {if !$bItem->code}
                        {
                            name:"{$bItem->name|escape:"javascript"}",
                            unit_amount:{
                                value:"{$bItem->price}",
                                currency_code:"EUR"
                            },
                            quantity: "{$bItem->menge}",
                            sku: "{$bItem->id}",
                        },
                        {/if}
                        {/foreach}
                    ]
                }]
            });
        },
        onApprove: function(data, actions) {
            actions.order.authorize().then(function (authorization) {
                let authorizationID = authorization.purchase_units[0].payments.authorizations[0].id
                $.post('/module/paypalcheckout.php', {
                    orderID: data.orderID,
                    authorizationID: authorizationID
                }, function () {
                    document.location.href = "/bestellen_seite_3.html"
                });
            });
        }
    }).render('#paypal-button-container');
    $(function(){
        $('.additional').click(function (e) {
            e.preventDefault();
            let rufname = $(this).attr("id");
            $.post("/updateSession", {
		_token: "{csrf_token()}",
                thirdPartyPaymentMethod: rufname
            },function(erg) {
                $('#step').val("2");
                $('#buy_form').attr("action","{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_2.html")
                if (rufname==="easycredit"||rufname==="crefopay"||rufname==="crefopayKK"||rufname==="PaypalRechnungskauf")
                {
                    $('#step').val("1b");
                    $('#buy_form').attr("action","{if $ini.ssl_buy==1}https://{$smarty.server.SERVER_NAME}{/if}/bestellen_seite_1b.html")
                }
                $('#buy_form').submit();
                return false;
            });
        })
    })
</script>
<!-- $Id$ END -->
