// JavaScript Document

var selbstabholer_min_x = 319;
var selbstabholer_min_y = 72;
var selbstabholer_max_x = 319;
var selbstabholer_max_y = 370;

var selbstabholer_step_x = 10;
var selbstabholer_step_y = 20;

var selbstabholer_time = 5;

var selbstabholer_action = 0;

function selbstabholerWidth(obj)
{
    if (i = obj.style.width.match(/\d+/)) { return parseInt(i); } else { return selbstabholer_min_x; }
}

function selbstabholerHeight(obj)
{
    if (i = obj.style.height.match(/\d+/)) { return parseInt(i); } else { return selbstabholer_min_y; }
}

function selbstabholerVerifyPreisInput(value)
{
    value = value.replace(/,/,'.');
    value = value.replace(/[^\d\.]/g,'');
    return value+"€";
}

function selbstabholerSubmit(formObj)
{
    buffer= new Array;

    with (formObj)
    {
        if (elements["selbstabholer_kundeName_"].value == "")
            { buffer.push(" - Ihr Name\n"); }
            
        if (!elements["selbstabholer_kundeMail_"].value.match(/@/g))
            { buffer.push(" - Ihre E-Mail-Adresse\n"); }
            
        if (elements["selbstabholer_anschrift_"].value == "")
            { buffer.push(" - Ihre Anschrift\n"); }
            
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

function selbstabholerOpen(obj)
{
    if (selbstabholer_action==0)
    {
        document.getElementById(obj.id+"_body").style.display="block";
        document.getElementById(obj.id+"_head").style.display="none";
        document.getElementById(obj.id+"_submitButton").style.display="block";

        window.setTimeout("selbstabholer_action=\"open\"; selbstabholerFadeIn('"+obj.id+"')", 1);
    }
}

function selbstabholerClose(obj)
{
    if (selbstabholer_action==0)
    {
        document.getElementById(obj.id+"_body").style.display="none";        
        document.getElementById(obj.id+"_head").style.display="block";
        document.getElementById(obj.id+"_submitButton").style.display="none";
        
        window.setTimeout("selbstabholer_action=\"close\"; selbstabholerFadeOut('"+obj.id+"')", 1);
    }
}

function selbstabholerFadeIn(obj_id)
{
    if (selbstabholer_action=="open")
    {
        var obj=document.getElementById(obj_id);
        var loopFlag=false;
    
        if (selbstabholerHeight(obj) < selbstabholer_max_y)
            { loopFlag=true; obj.style.height=(selbstabholerHeight(obj) + selbstabholer_step_y) + "px"; }

        if (selbstabholerWidth(obj) < selbstabholer_max_x)
            { loopFlag=true; obj.style.width=(selbstabholerWidth(obj) + selbstabholer_step_x) + "px"; }

        if (loopFlag==true)
            { window.setTimeout("selbstabholerFadeIn('"+obj_id+"')", selbstabholer_time); }
        else
            { selbstabholer_action=0; }
    }
}

function selbstabholerFadeOut(obj_id)
{
    if (selbstabholer_action=="close")
    {
        var obj=document.getElementById(obj_id);
        var loopFlag=false;
    
        if (selbstabholerHeight(obj) > selbstabholer_min_y)
            { loopFlag=true; obj.style.height=(selbstabholerHeight(obj) - selbstabholer_step_y) + "px"; }

        if (selbstabholerWidth(obj) > selbstabholer_min_x)
            { loopFlag=true; obj.style.width=(selbstabholerWidth(obj) - selbstabholer_step_x) + "px"; }

        if (loopFlag==true)
            { window.setTimeout("selbstabholerFadeOut('"+obj_id+"')", selbstabholer_time); }
        else
            { selbstabholer_action=0; }
    }
}