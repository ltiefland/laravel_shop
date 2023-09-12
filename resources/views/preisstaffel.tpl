<!-- $Id: preisstaffel.tpl 2401 2022-10-07 09:59:46Z tiefland $ BEGIN -->
{if $item.staffel.menge|count > 1}
<div>
    <table>
        <tr>
            <th colspan="2">
                <strong>Staffelpreise:</strong>
            </th>
        </tr>
        {foreach $item.staffel.menge as $key => $menge}
        {if $key>0}
        <tr>
            <td>ab {$menge} VE: </td><td>{$item.staffel.preis[$key]|money_format|replace:"EUR":"&euro;"}</td>
        </tr>
        {/if}    
        {/foreach}
    </table>
</div>
{/if}
<!-- $Id: preisstaffel.tpl 2401 2022-10-07 09:59:46Z tiefland $ END -->