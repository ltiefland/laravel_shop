dojo.require("dijit.dijit"); 
dojo.require("dojo.fx");


var animationMethod = "combine";  // chain || combine
var _showing = false;
var animG, offsetW, offsetH = null;
var lieferbox = null;
var _loaded = false;

var boxMixin = {
    startWidth: 0,
    startHeight: 0,
    endWidth: 518,
    endHeight: 299,
    duration: 650
};

/* DoJoX part 
dojo.addOnLoad(function() {
    lieferbox = dojo.byId('lieferbox'); 
    centerNode(lieferbox);
    dojo.connect(lieferbox,"onmouseover",null,"show");
    dojo.connect(lieferbox,"onmouseout",null,"hideCheck"); 
    //dojo.connect(lieferbox,"onmouseout",null,"hideCheck"); 
    //dojo.connect(but1,"onclick",null,"show");
    _loaded = true;
});
*/
function hideCheck(node) {
    if (_showing) { 
        setTimeout("hide('lieferbox')",250); 
    }
}

function centerNode(node) {
    var viewport = dijit.getViewport();
    var mb = dojo.marginBox(node);
    var style = node.style;
    offsetW = mb.w - style.width;
    offsetH = mb.h - style.height; 
    style.left = (viewport.l + (viewport.w - mb.w)/2) + "px";
    style.top = (viewport.t + (viewport.h - mb.h)/2) + "px";
}

function doUnderlay() {
    console.debug('make underlay'); 

}

function hide() {
    return false;    
}
function show() {
    return false;    
}

function show1() {
    if(!_loaded) { return ; }
    if (_showing) { return; }
    
    if (animG && animG.status == "playing") { animG.stop(); }
    _showing = true; 
    var viewport = dijit.getViewport();

    var newLeft = (viewport.l + (viewport.w - boxMixin.endWidth)/2);
    var newTop = (viewport.t + (viewport.h - boxMixin.endHeight)/2);

    var style = lieferbox.style; 
    var anim1 = dojo.animateProperty({
        node: lieferbox,
        duration: boxMixin.duration/2,
        properties: {
            width: { /* start: boxMixin.startWidth, */ end: boxMixin.endWidth, unit:"px" },
            left: { end: newLeft, unit:"px" }
        },
        beforeBegin: doUnderlay()
    });
    var anim2 = dojo.animateProperty({
        node: lieferbox,
        duration: boxMixin.duration/2,
        properties: {
            height: { /*start: boxMixin.startHeight, */ end: boxMixin.endHeight, unit:"px" },
            top: { end: newTop, unit: "px" }
        },
        onEnd: function() { 
            _showing = true; 
            dojo.byId('lieferbox').style.overflow = 'visible';
        } 

    });

    animG = dojo.fx[animationMethod]([anim1,anim2]).play();

    // chain:
    
        // animate width / left position
        // animate height / top position
    // onend: fadeIn content?
}

function hide1(node) {
    if (!_showing) return; 
    if (animG && animG.status() == "playing") { animG.stop(); }
    
    var viewport = dijit.getViewport(); 
    var newLeft = (viewport.l + (viewport.w - boxMixin.startWidth)/2);
    var newTop = (viewport.t + (viewport.h - boxMixin.startHeight)/2);

    var style = node.style; 
    var anim1 = dojo.animateProperty({
        node: lieferbox,
        duration: boxMixin.duration/2,
        properties: {
            width: { end: boxMixin.startWidth, unit:"px" },
            left: { end: newLeft, unit:"px" }
        }
    });
    var anim2 = dojo.animateProperty({
            node: lieferbox,
        duration: boxMixin.duration/2,
        properties: {
            height: { end: boxMixin.startHeight, unit:"px" },
            top: { end: newTop, unit: "px" }
        },
        onBegin: function() { 
            _showing = true; 
            dojo.byId('lieferbox').style.overflow = 'hidden';
        },
        onEnd: function() { 
            _showing = false; 
            //dojo.byId('lieferbox').style.overflow = 'hidden';
        } 
    });
    // if we chain, do anim2 first [because height/top is how anim2 in show() ends]
    animG = dojo.fx[animationMethod]([anim2,anim1]).play();
    
}


/* end dojox */