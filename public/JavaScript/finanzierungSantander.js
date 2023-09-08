  var faktor = new Array();


   
  
faktor[0] = 0.169005;
faktor[1] = 0.113342;
faktor[2] = 0.102211;
faktor[3] = 0.085514;
faktor[4] = 0.057687;
faktor[5] = 0.052126;
faktor[6] = 0.043779;
faktor[7] = 0.03544;
faktor[8] = 0.029879;
faktor[9] = 0.025916;
faktor[10] = 0.022941;
faktor[11] = 0.020631;
faktor[12] = 0.018779;
faktor[13] = 0.01727;
faktor[14] = 0.01602;
var effzins = new Array();
effzins[0] = 4.9;
effzins[1] = 4.9;
effzins[2] = 4.9;
effzins[3] = 4.9;
effzins[4] = 4.9;
effzins[5] = 4.9;
effzins[6] = 4.9;
effzins[7] = 4.9;
effzins[8] = 4.9;
effzins[9] = 4.9;
effzins[10] = 4.9;
effzins[11] = 4.9;
effzins[12] = 4.9;
effzins[13] = 4.9;
effzins[14] = 4.9;
  // Funktionen 
  function Runden2Dezimal(x, stellen) {
    rundungsfaktor = Math.pow(10, stellen); 
    Ergebnis = Math.round(x * rundungsfaktor) / rundungsfaktor; 
    return Ergebnis; 
  } 
  
  function calcSollzins(effzins) {
    Ergebnis = (Math.pow((1+effzins/100),(1/12))-1)*100;
    Ergebnis = Ergebnis * 12
    return Runden2Dezimal(Ergebnis, 3);
  }
  
 function calc() {
    // Hole Laufzeit Index + Laufzeit aus Dropdown Menu
    var e = document.getElementById("laufzeit");
    var laufzeitindex = e.options[e.selectedIndex].value;
    var laufzeit = e.options[e.selectedIndex].text.replace('Monate','');
    var nettodarlehensbetrag = parseFloat(document.getElementById("volume").value.replace(',', '.'));

    if( isNaN(nettodarlehensbetrag)) {
     // Ausgabe Fehlermeldung
     document.getElementById("serror").style.display="block";
     
     //ggf. vorherige Berechnungsergebnisse zuruecksetzen
     document.getElementById("nettoBetrag").value = "";
     document.getElementById("zinsBetrag").value = "";
     document.getElementById("hoeheRaten").value = "";
     document.getElementById("anzRaten").innerHTML = "0";
     document.getElementById("bruttoBetrag").value = "";
     document.getElementById("sollZins").value = "";
     document.getElementById("effZins").value = "";
    }
    else {
     //eine vorher ggf. eingeblendete Fehlermeldung wieder ausblenden
     document.getElementById("serror").style.display="none";
     
     // Berechnungen
     var rate = Runden2Dezimal(nettodarlehensbetrag * faktor[laufzeitindex], 2);

     var gesamt 
     if (effzins[laufzeitindex] == 0.00) gesamt = nettodarlehensbetrag;
     else gesamt = Runden2Dezimal(laufzeit * rate, 2);

     var zinssumme    
     if (effzins[laufzeitindex] == 0.00) zinssumme = 0;
     else zinssumme = Runden2Dezimal(gesamt - nettodarlehensbetrag, 2);
     
     //Ausgabe Berechnungsergebnisse
     document.getElementById("nettoBetrag").value = nettodarlehensbetrag.toFixed(2).toString().replace('.',',');
     document.getElementById("zinsBetrag").value = zinssumme.toFixed(2).toString().replace('.',',');
     document.getElementById("hoeheRaten").value = rate.toFixed(2).toString().replace('.',',');
     document.getElementById("anzRaten").innerHTML = laufzeit;
     document.getElementById("bruttoBetrag").value = gesamt.toFixed(2).toString().replace('.',',');
     document.getElementById("sollZins").value = calcSollzins(effzins[laufzeitindex]).toFixed(2).toString().replace('.',',');
     document.getElementById("effZins").value = effzins[laufzeitindex].toFixed(2).toString().replace('.',','); 
    }
   }
  // Funktionen Ende
