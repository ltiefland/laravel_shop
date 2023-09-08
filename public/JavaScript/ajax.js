    function xml_erz()
    {
        var resObjekt=null;
        try
        {
            resObjekt=new ActiveXObject("Microsoft.XMLHTTP");
        }        
        catch (Error)
        {
            try
            {
                resObjekt=new ActiveXObject("MSXML2.XMLHTTP");
            }
            catch(Error)
            {
                try
                {
                    resObjekt=new XMLHttpRequest();
                }
                catch(Error)
                {
                    alert("Fehler 3");
                }
            }
        }
        //
        return resObjekt;
    }

    function show_reiter(reiter, id)
    {
        karten=new Array();
        karten[0]="beschreibung";
        karten[1]="billiger_gesehen";
        karten[2]="testergebnisse";
        karten[3]="media";
        karten[4]="datenblatt";
        karten[5]="empfehlen";
        karten[6]="artstamm_beschreibung";

        anzreiter=karten.length;
        for(index=0;index<anzreiter;index++)
        {
            x='reiter_'+karten[index];
            //alert(x);
            if(karten[index]==reiter && document.getElementById(x)!=null)
            {
                document.getElementById(x).innerHTML='<img src="/images/webelemente/reiter/'+karten[index]+'_on.png" alt="Reiter '+karten[index]+'">';
            }
            else if(document.getElementById(x)!=null)
            {
                state_on="src='/images/webelemente/reiter/"+karten[index]+"_on.png'";
                state_off="src='/images/webelemente/reiter/"+karten[index]+"_off.png'";
                document.getElementById(x).innerHTML='<img src="/images/webelemente/reiter/'+karten[index]+'_off.png" onClick="show_reiter('+"'"+karten[index]+"'"+', '+id+')" style="cursor:pointer" onmouseover="'+state_on+'" onmouseout="'+state_off+'" alt="Reiter '+karten[index]+'">';
            }
        }
        if(reiter!="beschreibung")
        {
            if(reqObj)
            {
                read_tab(reiter, id);
            }
            else
            {
                alert("Bitte warten Sie, bis die Seite komplett geladen wurde!");
            }
        }
        else
        {
            document.getElementById('answer').style.display='none';
            document.getElementById('beschreibung').style.display='block';
        }
    }
    
    function read_tab(reiter, id, extra)
    {
        document.getElementById('answer').innerHTML="Laden...";
        document.getElementById('answer').style.display='block';
        document.getElementById('beschreibung').style.display='none';
        url='/module/reiter/'+reiter+'.php?item='+id;
        if(extra)
        {
            url+="&"+extra;
        }
        reqObj.open('get', url,true);
        reqObj.onreadystatechange=display_tab;
        reqObj.send(null); 
    }
    
    function display_tab()
    {
        var text="";
        if (reqObj.readyState == 4)
        {
            if(reqObj.responseText!="")
            {
                text=reqObj.responseText;
            }
            document.getElementById('answer').innerHTML=text;
        }
    }
    function init_objs()
    {
        reqObj=xml_erz();
    }
    
    function rechnen(item, monate)
    {
/*        var raten=new Array();
        raten[6]=170.80;
        raten[12]=87.30;
        raten[18]=59.40;
        raten[24]=45.50;
        raten[30]=37.20;
        raten[36]=31.60;
        
        var schluss=new Array();
        schluss[6]=170.76;
        schluss[12]=86.26;
        schluss[18]=58.92;
        schluss[24]=45.56;
        schluss[30]=34.92;
        schluss[36]=30.91;
        
        var zins=new Array();
        zins[6] = 24.76;
        zins[12] = 16.56;
        zins[18] = 38.72;
        zins[24] = 62.06;
        zins[30] = 83.72;
        zins[36] = 106.91;

        var nomzins=new Array();
        nomzins[6]=8.52;
        nomzins[12]=2.97;
        nomzins[18]=4.71;
        nomzins[24]=5.82;
        nomzins[30]=6.17;
        nomzins[36]=6.54;
                
        var rate=Math.abs(raten[monate]*preis/1000);
        var schlussr=Math.abs(schluss[monate]*preis/1000);
        var zinsen=zins[monate]*preis/1000;
        
        if(monate==6)
        {
            bkosten=0;
        }
        else
        {
            bkosten=30.00*preis/1000;
        }
        
        var summe=zinsen+bkosten+preis;

        document.getElementById("rate").innerHTML=number_format(rate,2,',','.')+' &euro;';
        document.getElementById("finale_rate").innerHTML=number_format(schlussr,2,',','.')+' &euro;';
        document.getElementById("summe").innerHTML=number_format(summe, 2, ',', '.')+' &euro;';
        document.getElementById("zinsen").innerHTML=number_format(zinsen, 2, ',', '.')+' &euro;';
        document.getElementById("kosten").innerHTML=number_format(bkosten, 2, ',', '.')+' &euro;';
        document.getElementById("nominaler_zins").innerHTML=nomzins[monate]+'%';*/   
        read_tab('finanzierung', item, "monate="+monate);     
    }