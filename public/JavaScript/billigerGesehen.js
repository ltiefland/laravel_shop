// JavaScript Document

/*
    billigerGesehen.css
    ...
    width:132px;
    height:68px;
    ...

*/



var billigerGesehen_min_x = 212; // Breite geschlossen
var billigerGesehen_min_y = 68; // Höhe geschlossen

var billigerGesehen_max_x = 412; // Breite geöffnet
var billigerGesehen_max_y = 225; // Höhe geöffnet

var billigerGesehen_step_x = 10;  
var billigerGesehen_step_y = 10;

var billigerGesehen_time = 5;

var billigerGesehen_action = 0;

var agent = navigator.userAgent.toLowerCase();

function billigerGesehenWidth(obj)
{   
    if (i = obj.style.width.match(/\d+/)) {

           if (agent.indexOf('msie')==true) {
               obj.style.marginLeft = -(parseInt(i)-billigerGesehen_min_x)+'px';
        }else{
            obj.style.marginLeft = 0+'px';
        }
        
        return parseInt(i); 
    } else {
        return billigerGesehen_min_x; 
    }
}

function billigerGesehenHeight(obj)
{
    if (i = obj.style.height.match(/\d+/)) { return parseInt(i); } else { return billigerGesehen_min_y; }
}

function billigerGesehenVerifyPreisInput(value)
{
    value = value.replace(/,/,'.');
    value = value.replace(/[^\d\.]/g,'');
    return value+" Euro";
}

function billigerGesehenSubmit(formObj)
{
    buffer= new Array;

    with (formObj)
    {
        if (billigerGesehen_kundeName.value == "")
        { 
            buffer.push(" - Ihr Name\n"); 
        }
            
        if (!billigerGesehen_kundeMail.value.match(/@/g))
        {
            buffer.push(" - Ihre E-Mail-Adresse\n"); 
        }
        
        if (billigerGesehen_kundePLZ.value == "")
        { 
            buffer.push(" - Ihre Postleitzahl\n"); 
        }

        if (isNaN(parseFloat(billigerGesehen_kundePreis.value)))
        {
            buffer.push(" - Ihre Preisvorstellung\n"); 
        }
    }

    if (buffer.length > 0)
    {
        alert("Bitte überprüfen Sie Ihre Eingaben in den folgenden Feldern:\n\n\t"+buffer.join("\t"));
        return false;    
    }
    else
    {
        formObj.method='post';
        formObj.submit();
    }
}

function billigerGesehenOpen(obj)
{
    if (billigerGesehen_action==0)
    {
        document.getElementById('col_1').style.marginLeft = "381px";
        document.getElementById(obj.id+"_body").style.display="block";
        document.getElementById(obj.id+"_head").style.display="none";
        document.getElementById(obj.id+"_submitButton").style.display="block";
        
        window.setTimeout("billigerGesehen_action=\"open\"; billigerGesehenFadeIn('"+obj.id+"')", 1);
    }
    
}

function billigerGesehenClose(obj)
{
    if (billigerGesehen_action==0)
    {
        document.getElementById(obj.id+"_body").style.display="none";        
        document.getElementById(obj.id+"_head").style.display="block";
        document.getElementById(obj.id+"_submitButton").style.display="none";
        
        window.setTimeout("billigerGesehen_action=\"close\"; billigerGesehenFadeOut('"+obj.id+"')", 1);
        
    }
    
}

function billigerGesehenFadeIn(obj_id) {
    
    if (billigerGesehen_action=="open")
    {
        var obj=document.getElementById(obj_id);
        var loopFlag=false;
    
        if (billigerGesehenHeight(obj) < billigerGesehen_max_y)
            { loopFlag=true; obj.style.height=(billigerGesehenHeight(obj) + billigerGesehen_step_y) + "px"; }

        if (billigerGesehenWidth(obj) < billigerGesehen_max_x)
            { 
                loopFlag=true; 
                obj.style.width=(billigerGesehenWidth(obj) + billigerGesehen_step_x) + "px";

            }

        if (loopFlag==true)
            { window.setTimeout("billigerGesehenFadeIn('"+obj_id+"')", billigerGesehen_time); }
        else
            { billigerGesehen_action=0; }
    }
}

function billigerGesehenFadeOut(obj_id)
{
    if (billigerGesehen_action=="close")
    {
        var obj=document.getElementById(obj_id);
        var loopFlag=false;
    
        if (billigerGesehenHeight(obj) > billigerGesehen_min_y)
            { loopFlag=true; obj.style.height=(billigerGesehenHeight(obj) - billigerGesehen_step_y) + "px"; }

        if (billigerGesehenWidth(obj) > billigerGesehen_min_x)
            { 
                loopFlag=true; obj.style.width=(billigerGesehenWidth(obj) - billigerGesehen_step_x) + "px";
                    
            
            }

        if (loopFlag==true)
            { window.setTimeout("billigerGesehenFadeOut('"+obj_id+"')", billigerGesehen_time); }
        else
            { billigerGesehen_action=0; }
        
        if (agent.indexOf('msie')==-1) {
            obj.style.marginLeft = "198px";
        }
    }
}