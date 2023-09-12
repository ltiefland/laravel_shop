<!-- $Id: turnaround.tpl 2401 2022-10-07 09:59:46Z tiefland $ BEGIN -->

<style>
    .products {
        width:100%;
        display:flex;
        margin:5% 0;
    }
    .content_turnaround {
        width:50%;
        overflow:hidden;
        text-align:center;
        padding-top: 6%;
        padding-left: 2%;
        padding-right: 2%;        
    }
    .content_turnaround h3,h4 {
        
        text-align:left!important;
    }
    @media screen and (max-width:800px) {
        .content_turnaround h3,h4 {
            padding-left:5%!important;    
        }
    }
    .content_turnaround h3 {
        font-size:2.1em;
        padding:1% 0;
    }
    .video {
        text-align:center;
        width:50%;
    }
    .video img {
        padding:2%;
    }
    #wcpulver {
        margin-top:13%;
    }
    
    @media screen and (max-width:800px) {
        .products {
            flex-direction: column;
            text-align: center;
            justify-content: center;
            align-items: center;    
        }
        .content_turnaround {
            width:100%;
        }
        .video {
            width:100%;
        }        
    }
    
</style>
		<script type="text/javascript">
			// hide URL field on the iPhone/iPod touch
			function hideUrlBar() {
			}
            
            $(document).ready(function() {
                let w = $('#wcpulver').width();
                let f = 1.666666667;
                let h = w/f;
                $('#wcpulver').height(h);
            });
            
		</script>

		{* <script type="text/javascript" src="/images/turnaround_photo/object2vr_player.js"></script> 
		<script type="text/javascript" src="/images/turnaround_photo/skin.js"></script>*}
  <div class="products">
        <div class="content_turnaround">
            <h3 style="color: #a9222e;">Unser Bestseller</h3>
            <h4>Mit Kalt-Wasser-Formel</h4>
            <p><a href="/perlglanz-wc-pulver-set.html"><img src="/images/webelemente/eimer_komplett.png"></a></p>
        </div>
        <div class="video">
            <img src="/images/webelemente/wc_pulver_video_top.png">
            <iframe id="wcpulver" width="100%" src="https://www.youtube.com/embed/cSdhlC_hyww" title="Original Perlglanz WC-Pulver mit Frische-Duft "Meeresbrise"" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        {*
        <script type="text/javascript">
	
			// create the object player with the container
			obj=new object2vrPlayer("container_turnaround");
			// add the skin object
			skin=new object2vrSkin(obj);
			// load the configuration
			str='<?xml version="1.0" encoding="UTF-8"?>';
				str+='<vrobject>';
				str+='  <input states="1" windowheight="1200" width="1800" imagepath="images/turnaround_photo/images" preview="4" windowwidth="1200" height="1800" preload="1" columns="24" rows="1" fileextension="jpg"/>';
				str+='  <control simulatemass="1" lockedmouse="0" swapxy="0" lockedkeyboard="0" dblclickfullscreen="0" revx="0" invertwheel="0" revy="0" wrapx="1" wrapy="0" trapwheel="1" automovemode="1" lockedwheel="0" speedwheel="1.000" controller="1" sensitivity="10"/>';
				str+='  <view>';
				str+='    <start row="0" column="0" state="0"/>';
				str+='    <zoom default="1.000" centerx="0.00000" centery="0.00000" min="1" max="1.500"/>';
				str+='    <viewer imagescaling="1" backgroundcolor="0xffffff" background="1"/>';
				str+='  </view>';
				str+='  <autorotate speed="0.200" onlyonce="0" delay="5.00" start="1"/>';
				str+='  <userdata title="" datetime="" description="Produktion:" copyright="www.perlglanz.de" author="www.turnaround.photo" source="" comment="" info=""/>';
				str+='  <qthotspots enabled="0" reuse="8">';
				str+='    <label width="180" backgroundalpha="1.000" enabled="0" height="20" backgroundcolor="0xffffff" bordercolor="0x000000" border="1" textcolor="0x000000" background="1" borderalpha="1.000" borderradius="1" wordwrap="1" textalpha="1.000"/>';
				str+='  </qthotspots>';
				str+='  <hotspots>';
				str+='    <label width="180" backgroundalpha="1.000" enabled="0" height="20" backgroundcolor="0xffffff" bordercolor="0x000000" border="1" textcolor="0x000000" background="1" borderalpha="1.000" borderradius="1" wordwrap="1" textalpha="1.000"/>';
				str+='    <polystyle mode="0" backgroundalpha="0.251" backgroundcolor="0x0000ff" bordercolor="0x0000ff" borderalpha="1.000"/>';
				str+='  </hotspots>';
				str+='</vrobject>';
				str+='';
			obj.readConfigString(str);
			// hide the URL bar on the iPhone
			setTimeout(function() { hideUrlBar(); }, 10);
		</script>
		<noscript>
			<p><b>Please enable Javascript!</b></p>
		</noscript>
        *}
    </div>
    
<!-- $Id: turnaround.tpl 2401 2022-10-07 09:59:46Z tiefland $ END -->