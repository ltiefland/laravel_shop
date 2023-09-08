
<div>Erweiterte Suche</div>
<br />
<div>
    <form name="search_extended" id="search" autocomplete="off" action="/index.php" method="get">
        <input type="hidden" name="search" value=""/>
        <select name="search_type" size="1">
            <option value="artikelnr">Hazet-Artikelnummer</option>
            <option value="text">Volltextsuche</option>
            <option value="ean">EAN-Nummer</option>
            <option value="artikelname">Artikelname</option>
        </select>
        <input name="search" id="suchbegriff_extended" type="text" size="30" style="margin-left:3px;" value="{$smarty.get["search"]|default:""}"/>
        <input type="submit" value="Suchen" id="searchSubmit_extended"/>
    </form>
</div>