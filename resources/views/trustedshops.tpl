<table style="border-bottom: none;">
    <tr>
        <td valign="top" colspan="2">
            <input type="checkbox" id="ts" value="{$tsProd.id}" name="ts">
            <label for="ts">Trusted Shops Käuferschutz (empfohlen)</label>
            <br>
        </td>
    </tr>
    <tr>
        <td style="padding:20px;">
            <a href="https://www.trustedshops.de/shop/certificate.php?shop_id={$ini.trustedShops.shop_id}" target="_blank"><img title="Klicke auf das Gütesiegel, um die Gültigkeit zu prüfen!" src="/images/fremdlogos/TS-Siegel_70x70px_transparent.png" /></a>
        </td>
        <td>
            Käuferschutz bis {$tsProd.max} EUR ({$tsProd.preis|money_format}  inkl. MwSt.)
            <br><br>
            Die im Käuferschutz enthaltene <a href="//www.trustedshops.com/shop/protection_conditions.php?shop_id={$ini.trustedShops.shop_id}" target="_blank">Trusted Shops Garantie</a> sichert deinen Online-Kauf ab. Mit der Übermittlung und <a href="https://www.trustedshops.com/shop/data_privacy.php?shop_id={$ini.trustedShops.shop_id}">Speicherung</a> meiner E-Mail-Adresse zur Abwicklung des Käuferschutzes durch Trusted Shops bin ich einverstanden. <a href="https://www.trustedshops.com/shop/protection_conditions.php?shop_id={$ini.trustedShops.shop_id}" target="_blank">Garantiebedingungen</a> für den Käuferschutz.
        </td>
    </tr>
</table>
