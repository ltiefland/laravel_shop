<style>
    .pinselstrich {
        background: url(/images/webelemente/pinselstrich_nebensonne.png);
        background-repeat: repeat;
        background-size: auto;
        background-size: cover;
        color: #fff;

        width: 76%;
        min-height: 138px;
        background-repeat: no-repeat;
        font-size: 1.2em;
        font-family: noticia_textbold;
    }
    .pinselstrich p {
        width: 68%;
        margin: 0 auto;
        padding-top: 9%;        
    }
    
    
    .anim_section {
        clear:both;
        float:none;
    }
    .flex {
        display:flex;
        flex-wrap: wrap;
        flex-direction: row;        
    }
    .anim_info {
        width:50%;
        padding:5%;
        padding-top:19vh;
    }
    .anim_info h1 {
        font-size:2.4em;
        color:#2FBABD;
    }
    .anim_info h2 {
        color:#3A3B3D;
        margin-bottom:20px;
    }
    .anim_buttons {
        margin-top:20px;
        display:flex;
        gap:20px;
        justify-content:center;
        width:calc(100% - 40px);
    }
    .anim_buttons > div {
        transition:all 200ms ease;
        background-color:#C8D2DC;
        color:#3A3B3D;
        border-radius:15px;
        padding:3%;
        font-family:noticia_textbold;
        cursor:pointer;
        width: 23%;
        text-align: center;        
        display:flex;
        align-items:center;
        justify-content:center;
    }
    .anim_btn01:hover,
    .anim_btn01:focus {
        background-color:#FF8DCC!important;
    }
    .anim_btn02:hover,
    .anim_btn02:focus {
        background-color:#2FBABD!important;
    }
    .anim_btn03:hover,
    .anim_btn03:focus {
        background-color:#FFE993!important;
    }
    
    .anim_btn01 {
        border:2px solid #EA5802;
    }
    .anim_btn02 {
        border:2px solid #0E2E7B;
    }
    .anim_btn03 {
        border:2px solid #FED639;
    }

    #anim {
        display:none;
        clear:both;
    }

    .anim {
        display: flex;
        align-items: center;
        justify-content: center;
        margin:5% auto;
        min-height:500px;
        margin:3% auto;
        width:40%;
    }
    .anim #kreis_hell {
        display:block;
        animation: pulse 5s infinite;
        position:absolute;
        transform: scale(1);
        animation: kreis_hell 1.6s ease-in-out; 
        -webkit-animation: kreis_hell 1.6s ease-in-out;
        background:transparent!important;
    }    
    .anim #kreis_dunkel {
        display:block;
        animation: pulse 5s infinite;
        position:absolute;
        transform: scale(1);
        animation: kreis_dunkel 1.3s ease-in-out; 
        -webkit-animation: kreis_dunkel 1.3s ease-in-out;
        background:transparent!important;
    }
    .anim #flasche {
        display:block;
        opacity:1;
        position:absolute;
        margin-top:0%;
        animation: flasche 1.6s ease-in-out; 
        -webkit-animation: flasche 1.6s ease-in-out;
        background:transparent!important;
    }
    .anim #waschcreme {
        display:block;
        position:absolute;
        margin-left: 22%;
        margin-top:20%;
        transform: scale(1);
        animation: waschcreme 1.8s ease-in-out;
        -webkit-animation: waschcreme 1.8s ease-in-out;
        background:transparent!important;
    }
    .anim #schwamm {
        display:block;
        opacity:1;
        position:absolute;
        transform: scale(1);
        margin-top:29%;
        margin-right:20%;
        animation: schwamm 2s ease-in-out; 
        -webkit-animation: schwamm 2s ease-in-out;
        background:transparent!important;
    }
    .anim .pulse1 {
        animation:pulse 200ms ease-in-out; 
    }
    .anim .pulse2 {
        animation:pulse 400ms ease-in-out; 
    }

    @keyframes kreis_hell {
        0% {
            transform: scale(0);
            -webkit-transform: scale(0);
        }
        40% {
            transform: scale(1.2);
            -webkit-transform: scale(1.2);
        }
        100% {
            transform: scale(1.0);
            -webkit-transform: scale(1.0);
        }
    }    
    
    @keyframes kreis_dunkel {
        0% {
            transform: scale(0);
            -webkit-transform: scale(0);
        }
        10% {
            transform: scale(0);
            -webkit-transform: scale(0);
        }
        50% {
            transform: scale(.5);
            -webkit-transform: scale(.5);
        }
        100% {
            transform: scale(1);
            -webkit-transform: scale(1);
        }
    }       
    
    @keyframes flasche {
        0% {
            opacity:0;
            margin-top:0%;
            transform: scale(0);
            -webkit-transform: scale(0);
        }
        50% {
            opacity:1;
        }
        60% {
            transform: scale(1.3);
            -webkit-transform: scale(1.3);
        }
        70% {
            transform: scale(.9);
            -webkit-transform: scale(.9);
        }
        
        100% {
            opacity:1;
            margin-top:0%;
            transform: scale(1);
            -webkit-transform: scale(1);
        }
    }    
    
    @keyframes waschcreme {
        0% {
            opacity:0;
            margin-left:0;
            transform: scale(0);
            -webkit-transform: scale(0);
        }
        25% {
            transform: scale(0);
            -webkit-transform: scale(0);
            
        }
        50% {
            opacity:1;
        }
        60% {
            transform: scale(1.2);
            -webkit-transform: scale(1.2);
        }
        
        100% {
            opacity:1;
            margin-left:22%;
            transform: scale(1);
            -webkit-transform: scale(1);
        }
    }
    
    @keyframes schwamm {
        0% {
            opacity:0;
            margin-right:0;
            margin-top:0;
            transform: scale(0);
            -webkit-transform: scale(0);
        }
        25% {
            transform: scale(0);
            -webkit-transform: scale(0);
            
        }
        50% {
            opacity:1;
        }
        60% {
            transform: scale(1.2);
            -webkit-transform: scale(1.2);
        }
        
        100% {
            opacity:1;
            margin-top:29%;
            margin-right:20%;
            
            transform: scale(1);
            -webkit-transform: scale(1);
        }
    }
    
    @keyframes pulse1 {
      0% {
        transform: scale(1);
      }
      100% {
        transform: scale(.95);
      }
    }    
    @keyframes pulse2 {
      0% {
        transform: scale(1);
      }
      30% {
        transform: scale(1);
      }
      
      100% {
        transform: scale(.9);
      }
    }    
    
    @media screen and (max-width:900px) {
        .pinselstrich {
            width:100%;
        }
        .pinselstrich p {
            padding-left: 33%;
        }
        .flex {
            flex-direction:column-reverse;
        }
        .anim_info {
            padding-top:2vh;
        }
        .anim_info,
        .anim {
            width:95%;
        }
        .anim {
            margin:3% 0;
        }
        #kreis_dunkel {
            width:85%;
        }
        #waschcreme {
            margin-top:59%!important;
            margin-left:58%!important;
        }
        #schwamm {
            margin-top: 95%!important;
            margin-right: 44%!important;            
        }
        
        @keyframes waschcreme {
            0% {
                opacity:0;
                margin-left:0;
                transform: scale(0);
                -webkit-transform: scale(0);
            }
            25% {
                transform: scale(0);
                -webkit-transform: scale(0);
                
            }
            50% {
                opacity:1;
            }
            60% {
                transform: scale(1.2);
                -webkit-transform: scale(1.2);
            }
            
            100% {
                margin-left:58%;
                margin-top:59%;
                transform: scale(1);
                -webkit-transform: scale(1);                
            }
        }
        
        @keyframes schwamm {
            0% {
                opacity:0;
                margin-right:0;
                margin-top:0;
                transform: scale(0);
                -webkit-transform: scale(0);
            }
            25% {
                transform: scale(0);
                -webkit-transform: scale(0);
                
            }
            50% {
                opacity:1;
            }
            60% {
                transform: scale(1.2);
                -webkit-transform: scale(1.2);
            }
            
            100% {
                opacity:1;
                margin-top:95%;
                margin-right:44%;
                
                transform: scale(1);
                -webkit-transform: scale(1);
            }
        }        
            
    }
    
</style>

<section class="anim_section">
    <div class="inner flex">
        <div class="anim_info">
            <h1>Perlglanz - Unser Original</h1>
            <h2>Qualität seit 1980</h2>
            
            <div class="pinselstrich">
                <p>Wir sind die Marke für Menschen, die auf Qualität vertrauen.</p> 
            </div>
            
            {*
            <div class="anim_buttons">
                <div onclick="window.location.href='/4-Bad-WC/';" class="anim_btn01">Bad & WC</div>
                <div onclick="window.location.href='/3-Kueche-Haushalt/';"class="anim_btn02">Küche & Haushalt</div>
                <div onclick="window.location.href='/5-Spar-Sets/';" class="anim_btn03">Spar-Sets</div>
            </div>
            *}
            
        </div>
    
        <div class="" id="anim">
            <img id="kreis_hell" class="pulse1" src="/images/animation/kreis_55transparenz.png">
            <img id="kreis_dunkel" class="pulse2" src="/images/animation/kreis_full.png">
            <img id="flasche" src="/images/animation/flasche1.png">
            <img id="waschcreme" src="/images/animation/waschcreme.png">
            <img id="schwamm" src="/images/animation/schwamm1.png">
        </div>
    </div>
</section>

<script>
    $(document).ready(function() {
        animCSS();
        $(window).scroll(function() {
            animCSS();
        });
    });
    
    function animCSS() {
        let animPos = $('.anim_section').offset();
        animPos = animPos.top;
        
        let animH = $('#anim').height();
        let screenH = $(window).height();
        let scrollPos = 0;
        scrollPos = window.scrollY;
        
        if((scrollPos+animH) > animPos) {
            setTimeout(function() {
                $('#anim').css("display","flex");
                $('#anim').addClass('anim');
            }, 600);
        }
    }
    
</script>




















