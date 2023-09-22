{extends file="page.tpl"}
{block name=content}
    <div class="box_2">
        <div class="box_top"><h1 >{if $smarty.get.serviceCenter==1}Serviceadressen{else}Hersteller{/if}</h1></div>
        <div class="box_middle" style="padding-bottom:20px;">
        {assign var="sc" value=""}
        {if $smarty.get.serviceCenter==1}
           {assign var="sc" value="&serviceCenter=1"}
        {/if}

            <!--<ul class="alph">
                <li><a href="/index.php?mode=herstellerListe&letter=a{$sc}">A</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=b{$sc}">B</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=c{$sc}">C</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=d{$sc}">D</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=e{$sc}">E</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=f{$sc}">F</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=g{$sc}">G</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=h{$sc}">H</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=i{$sc}">I</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=j{$sc}">J</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=k{$sc}">K</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=l{$sc}">L</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=m{$sc}">M</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=n{$sc}">N</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=o{$sc}">O</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=p{$sc}">P</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=q{$sc}">Q</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=r{$sc}">R</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=s{$sc}">S</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=t{$sc}">T</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=u{$sc}">U</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=v{$sc}">V</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=w{$sc}">W</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=x{$sc}">X</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=y{$sc}">Y</a></li>
                <li><a href="/index.php?mode=herstellerListe&letter=z{$sc}">Z</a></li>
            </ul>-->

            <ul class="hersteller_alph">

            {foreach $herstellerListe as $key => $value}
                {if $value->Bezeichnung}
                    {assign var=herstellerName value=$value->Bezeichnung}
                {else}
                    {assign var=herstellerName value=$value->name}
                {/if}
                <li><a href="/manufacturers/{$value->slug}.html">{$herstellerName}</a></li>
            {/foreach}

            </ul>

        </div>
    </div>
{/block}
