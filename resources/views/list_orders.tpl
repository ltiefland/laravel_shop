<div class="box_static">
    <div class="box_top">
        <h1>Meine Bestellungen</h1>
        <p>{$langstrings.buy.my_orders_text}</p>
    </div>
    <div class="box_middle">
        <p>
        <table width="90%" style="margin:20px 10px 0 10px;">
            <tr class="order">
                <td>
                    <h1>Bestellnummer</h1>
                </td>
                <td>
                    <h1 >Bestelldatum</h1>
                </td>
                <td align="right">
                    <h1 >Betrag</h1>
                </td>
                <td align="right">
                    <h1 >Versanddatum</h1>
                </td>
            </tr>
            {section loop=$orders name=o_ind}
            <tr class="order">
                <td>
                    <img src="/images/webelemente/plus.gif" class="order_details_button order_details_button_{$orders[o_ind].ID}" id="order_details_button_{$orders[o_ind].ID}" style="cursor:pointer">
                    <img src="/images/webelemente/minus.gif" class="order_list_button order_list_button_{$orders[o_ind].ID}" id="order_list_button_{$orders[o_ind].ID}" style="cursor:pointer;display:none;">
                    {$orders[o_ind].ID}
                </td>
                <td>
                    {$orders[o_ind].erstellt_am|date_format:"d.m.Y H:i:s"}
                </td>
                <td align="right">
                    {$orders[o_ind].gesamtsumme_buffer|money_format|replace:"EUR":"&euro;"}&nbsp;
                </td>
                <td align="right">
                    {section loop=$orders[o_ind].tracking name=t_ind}
                    <a href="{$orders[o_ind].tracking[t_ind]}" target="_blank">
                        {$orders[o_ind].versanddatum[t_ind]|date_format:"d.m.Y"}
                    </a>
                    <br>
                    {sectionelse}
                        Noch nicht versandt
                    {/section}
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="order_details" id="order_details_{$orders[o_ind].ID}" id="order_details_{$orders[o_ind].ID}" style="display:none;">&nbsp;<br></div>
                </td>
            </tr>
            {/section}
        </table>
        </p>
        
    </div>
</div>
    
