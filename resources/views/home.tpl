<div class="home">
    
    <div class="colspan-6"  onclick="javascript:window.location.href='/produktfinder.html';">
        <img src="/images/einstieg/FaltradBerater.jpg" width="690" height="355" />
        <div class="home_button uppercase"><h1>Faltrad<strong>berater</strong></h1></div>
        </div>
    
    <div class="colspan-6 rowspan-2" onclick="javascript:window.location.href='/1752-Brompton-Konfigurator/';">
        <img src="/images/einstieg/Brompton-Konfigurator.jpg" width="690" height="729" />
        <div class="home_button2">
            <p>Für die, die genau wissen, was sie wollen</p>
            <h1 class="uppercase">Brompton  <strong class="uppercase">Konfigurator</strong></h1>
        </div>    
    
    
    </div>
    <div class="colspan-6" onclick="javascript:window.location.href='/?id=60';"><img src="/images/einstieg/Filiale.jpg" width="690" height="355" />
        <div class="home_button uppercase">
            <h1>Faltradxxs <strong>Filiale</strong></h1>
        </div>    

    </div>
    <div class="colspan-8 flex" onclick="javascript:window.location.href='/?mode=sonderangebote&a=Sonderangebote'">
        <div class="home_button3 w72">
            <div>
                <p>Für Schnäppchenjäger</p>
                <h1>Sonder<strong>Angebote</strong></h1>
            </div>
            
        </div>    
        <div><img src="/images/einstieg/Sonderangebote.jpg" width="868" height="350" /></div>
    </div>
    <div class="colspan-4" onclick="javascript:window.location.href='/faltrad-sonderangebote.html?t=B-Ware'"><img src="/images/einstieg/B-Ware.jpg" width="505" height="350" />
        <div class="home_button uppercase">
            <h1>B-Ware</h1>
        </div>    
    
    </div>
    
    <div class="colspan-6" onclick="javascript:window.location.href='/2110-Neuheiten-2023/';"><img src="/images/einstieg/Neuheiten.jpg" width="690" height="450" />
        <div class="home_button2">
            <p>Unsere Neuheiten</p>
            <h1 class="uppercase"><strong>2023</strong></h1>
        </div>    
    </div>
    
    <div class="colspan-6" onclick="javascript:window.open('/blog/');"><img src="/images/einstieg/Blog.jpg" width="690" height="450" />
        <div class="home_button2">
            <p>Tipps, Trends und Neuheiten</p>
            <h1 class="uppercase">Unser <strong class="uppercase">Blog</strong></h1>
        </div>    
    </div>
    
    <div class="colspan-3" onclick="javascript:window.open('https://www.facebook.com/FaltradXXS/');"><img src="/images/einstieg/Facebook.jpg" width="335" height="335" />
        <div class="home_button_center uppercase">
            <h1>Facebook</h1>
        </div>    
    </div>
    <div class="colspan-3" onclick="javascript:window.open('https://www.instagram.com/faltradxxs.de/');"><img src="/images/einstieg/Instagram.jpg" width="335" height="335" />
        <div class="home_button_center uppercase">
            <h1>Instagram</h1>
        </div>    
    </div>
    <div class="colspan-6 flex" onclick="javascript:window.open('https://www.youtube.com/user/marinesalesde');">
        <div class="home_button3 w72">
            <div>
                <p>Wir teilen unser Wissen mit dir</p>
                <h1>You<strong>Tube</strong></h1>
            </div>
        </div>    
    <img src="/images/einstieg/Youtube.jpg" /></div>
    
</div>

<section>
    <div class="inner">
        {include file="newsletter_anmeldung.tpl"}
    </div>
</section>

<style>
    .home * {
        box-sizing:border-box;
    }
    .home {
        margin:0 auto;
        width:100%;
        max-width:1400px;
        display:grid;
        gap:19px;
        grid-template-columns: repeat(12,1fr);
        overflow:hidden;        
    }
    .home > div {
        cursor:pointer;
    }
    .home img {
        transition:all 1000ms ease-in-out;
        max-width:100%;
        height:auto;
    }
    .home > div {
        font-size:0;
        overflow:hidden;
    }
    .home div.colspan-3 {
        grid-column: span 3;
    }
    
    .home div.colspan-4 {        
        grid-column: span 4;
    }
    .home div.colspan-5 {
        grid-column: span 5;
    }
    .home div.colspan-6 {
        grid-column: span 6;
    }
    .home div.colspan-7 {
        grid-column: span 7;
    }
    .home div.colspan-8 {
        grid-column: span 8;
    }
    
    .home div.rowspan-2 {
        grid-row:span 2;
    }
    
    /* fonts / buttons */
    .home .home_button {
        background: #EA5802;
        border-radius: 10px;
        padding: 10px 20px;
        margin-top: -120px;
        margin-left: 40%;
        position: relative;
        width: fit-content;
        float:right;
        margin-right:7%;
        cursor:pointer;
    }
    .home .home_button_center {
        background: #EA5802;
        border-radius: 10px;
        padding: 10px 20px;
        position: relative;
        width: fit-content;
        cursor: pointer;
        margin: -120px auto;        
    }
    .home div:hover .home_button_center,
    .home div:focus .home_button_center,
    .home div:hover .home_button,
    .home div:focus .home_button
    
     {
        background:#FFB725;
     }
    .home h1 {
        font-size:1.3rem;
        font-weight:normal;
        font-family:work_sansregular!important;
        color:#fff;
    }
    .home h1 strong {
        font-weight:normal;
        font-family:work_sanssemibold;
    }
    .home .home_button2 {
        background: #2FBABD;
        color: #fff;
        height:87px;
        display: flex;
        align-items: center;
        justify-content: center;
        position: unset;
        flex-wrap: wrap;
        margin-top: -87px;
        position: relative;
        flex-direction: column;
    }

    .home .home_button3 {
        background: #2FBABD;
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        position: unset;
        flex-wrap: wrap;
        position: relative;
        z-index:1;
        text-align:center;
    }

    .home .home_button2 p,
    .home .home_button3 p {
        width: 100%;
        height: auto;
        color: #fff !important;
        text-align:center;        
        font-size:1rem;
        font-family:work_sanslight;
    }


    .home div:hover .home_button2,
    .home div:focus .home_button2,
    .home div:hover .home_button3,
    .home div:focus .home_button3 {
        background:#9CD9DA;
    }
    .home div:hover img,
    .home div:focus img {
        rotate:5deg; 
        scale:1.2;
    }
    
    .flex {
        display:flex;
    }
    .home .w72 {
        width:72%!important;
    }
    
    /* mobile */
    @media screen and (max-width:768px) {
        .home div.colspan-3 {
            display:none;
        }
        .home div.colspan-3,    
        .home div.colspan-4,
        .home div.colspan-6, 
        .home div.colspan-8 {
            grid-column: span 12;
        }
    }
    
</style>

