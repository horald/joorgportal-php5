document.write('<script type="text/javascript" src="js/prototype.js"><\/script>');
var GB_ROOT_DIR = "";
document.write('<script type="text/javascript" src="js/greybox.js"><\/script>');
document.write('<link rel="stylesheet" href="stylesheet.css" type="text/css">');

var dragobjekt = null;
var overobjekt = null;

var dragx = 0;
var dragy = 0;

var posx = 0;
var posy = 0;

var objBody;

var debug; 

var nResizeTop    = false;
var nResizeBottom = false;
var nMove         = false;

var nDragStart = false;

var objekty      = 0;
var objektheight = 0;
var nAktuell     = 0;

var nGreifPos = 0;

var nGreifbarResize = 5;

var nAktiv = false;

var nDiffY = 0;

var nTopGrid = null;

var objNewEvent    = null;
var nDivAktuellPos = null;  

// Variablen für Ajax-Funktionalität
var nAnzZeilenProStunde = 0;
var nZeilenHoehe        = 0;
var nMode               = 0;
var nTage               = 0;
var nKW                 = 0;
var nJahr               = 0;
var nDisplayStundenVon  = 0;
var nDisplayStundenBis  = 0;

// NEu

var nMaxBottom          = 0;

var nGridPos1   = 0;
var nGridLaenge = 0;

var ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

function addResizeEvent(func) {
  var oldonresize = window.onresize;
  if (typeof window.onresize != 'function') {
    window.onresize = func;
  } else {
    window.onresize = function() {
      if (oldonresize) {
        oldonresize();
      }
      func();
    }
  }
}

function getOffsetLeft(elem) {
  xPos = elem.offsetLeft;
  tempEl = elem.offsetParent;
  while (tempEl != null) {
    xPos += tempEl.offsetLeft;
    tempEl = tempEl.offsetParent;
  }
  return xPos;
}

function getOffsetTop(elem) {
  yPos = elem.offsetTop;
  tempEl = elem.offsetParent;
  while (tempEl != null) {
    yPos += tempEl.offsetTop;
    tempEl = tempEl.offsetParent;
  }
  return yPos;
}

function draginit() {
  document.onmousemove = drag;
  document.onmouseup = dragstop;
}

function overend(element) {
	overobjekt = null;
}

function overstart(element) {
	overobjekt = element;
}

function dragstart(element) {
  dragobjekt = element;
  
  // 
  nMaxBottom = (parseInt((dragobjekt.offsetTop-1)/nZeilenHoehe)+parseInt((dragobjekt.offsetHeight-1)/nZeilenHoehe))-((nDisplayStundenBis+1) - nDisplayStundenVon) * nAnzZeilenProStunde;
  
  dragx = posx - dragobjekt.offsetLeft;
  dragy = posy - dragobjekt.offsetTop;
  
  // Fürs verschieben in andere Tage
  nGridPos1   = getOffsetLeft($('eventTag1'));
  nGridLaenge = getOffsetLeft($('eventTag2'))-getOffsetLeft($('eventTag1'));
   
  objekty = getOffsetTop(dragobjekt);
  objektheight = dragobjekt.offsetHeight;
  nAktuell = 0;
  
  nGreifPos = posy-objekty;
  
  nDragStart = true;
}


function dragstop() {
	if (dragobjekt!=null) {
		if (nResizeTop==true || nResizeBottom==true) {
			nId = dragobjekt.id.substr(6).toString();
			resizeEvent(nId, dragobjekt.style.top, dragobjekt.style.height);
		}
		if (nMove==true) {
			nId = dragobjekt.id.substr(6).toString();
			nTag = dragobjekt.parentNode.id.substr(8).toString();
			moveEvent(nId, dragobjekt.style.top, dragobjekt.style.height, nTag);
		}
		
	  dragobjekt.style.zIndex  = '0';
	  dragobjekt.className     = 'event';
	  dragobjekt=null;		
	}
  nAktiv        = false;
  nDragStart    = false;
	nResizeTop    = false;
	nResizeBottom = false;  
	nMove         = false;  
  objBody.style.cursor = 'default';
  
  nMarkierer   = null;
  nDivAktuell  = null;


  if (objNewEvent!=null) {			
  	nTop    = Math.round(objNewEvent.offsetTop / nZeilenHoehe)*nZeilenHoehe;
		nHeight = objNewEvent.offsetHeight;
		nTag    = objNewEvent.id.substr(9).toString();  
 
  	objNewEvent.style.display = 'none';
    objNewEvent    = null;
  	nDivAktuellPos = null;       
    
  	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
  	ajaxUrl = ajaxUrl + '&aktion=newTermin&nTag=' + nTag + '&nTop=' + nTop + '&nHeight=' + nHeight;

  	
    GB_show('Neuen Termin anlegen', ajaxUrl, /*optional*/ 350, 500, null);
  }
  
  objNewEvent    = null;
	nDivAktuellPos = null;   
}


function drag(ereignis) {
  posx = document.all ? window.event.clientX : ereignis.pageX;
  posy = document.all ? window.event.clientY : ereignis.pageY;
  
  posy = posy + document.getElementById('CalendarTableBody').scrollTop;
  
  // ie extrawurst
  if (navigator.appName.indexOf("Explorer") > -1) 
    posy = posy + document.getElementsByTagName('body')[0].scrollTop;
  
  if(objNewEvent!=null) {  	
  	if (Math.round((posy-nTopGrid)/nZeilenHoehe)>=0 && nDivAktuellPos>=Math.round((posy-nTopGrid)/nZeilenHoehe)) {
	  	objNewEvent.style.top = (Math.round((posy-nTopGrid)/nZeilenHoehe)*nZeilenHoehe) + 1 + 'px';
	  	objNewEvent.style.height = ((nDivAktuellPos - Math.round((posy-nTopGrid)/nZeilenHoehe)) * nZeilenHoehe) + nZeilenHoehe + 'px';
  	}
  	else if (nDivAktuellPos<Math.round((posy-nTopGrid)/nZeilenHoehe)) {
  	  if (nMaxBottom >= (Math.round((posy-nTopGrid)/nZeilenHoehe) - nDivAktuellPos)) {
  		  objNewEvent.style.height = (Math.round((posy-nTopGrid)/nZeilenHoehe) - nDivAktuellPos) * nZeilenHoehe;
  	  }
  	}
  }
    
  if(overobjekt!=null) {
  	if (nDragStart==false) {
  		// Resize Top
	  	if (posy-getOffsetTop(overobjekt)<=nGreifbarResize) {
	  		overobjekt.style.cursor = 's-resize';
	  		nResizeTop    = true;
	  		nResizeBottom = false;
	  		nMove         = false;
	  	}
	  	else if (posy-(getOffsetTop(overobjekt)+overobjekt.offsetHeight)<=nGreifbarResize && posy>(getOffsetTop(overobjekt)+overobjekt.offsetHeight-nGreifbarResize)) {
	  		overobjekt.style.cursor = 's-resize';
	  		nResizeTop    = false;
	  		nResizeBottom = true;
	  		nMove         = false;
	  	}
	  	// Verschieben allgemein
	  	else {
	  		overobjekt.style.cursor = 'move';
	  		nResizeTop    = false;
	  		nResizeBottom = false;
	  		nMove         = true;
	  	}
  	}
  }  
  
  if(dragobjekt != null) {
  	
	  dragobjekt.style.width   = '100%';
	  dragobjekt.style.left    = '0%';
	  dragobjekt.style.zIndex  = '999';
	  dragobjekt.className     = 'transparent';  	
  	
  	if (nResizeTop==true) {
  		objBody.style.cursor = 's-resize';  	
	  	nNew = Math.round((objekty - posy) / nZeilenHoehe);
  	
	  	//if (nNew!=nAktuell && (nZeilenHoehe-1) < objektheight + (nZeilenHoehe*nNew) && objekty - (nZeilenHoehe*nNew) >= nTopGrid-2 ) {
	  	if ((nZeilenHoehe-1) < objektheight + (nZeilenHoehe*nNew) && objekty - (nZeilenHoehe*nNew) >= nTopGrid-2 ) {
	  		if (navigator.appName.indexOf("Explorer") > -1) 
	  		  dragobjekt.style.top = objekty - (nZeilenHoehe*nNew) - (nTopGrid-1);
	  		else 
	  		  dragobjekt.style.top = objekty - (nZeilenHoehe*nNew) - (nTopGrid-2);
	  		dragobjekt.style.height = objektheight + (nZeilenHoehe*nNew);
	  		
	  		// Unteren Divs auch verkleinern
	  		$('eventColor_' + dragobjekt.id.substr(6).toString()).style.height = objektheight + (nZeilenHoehe*nNew)-1;
	  		$('eventContent_' + dragobjekt.id.substr(6).toString()).style.height = objektheight + (nZeilenHoehe*nNew)-2;
	  		
	  		nAktuell = 0;
	  	}
	  	
    }
    else if (nResizeBottom==true) {
    	objBody.style.cursor = 's-resize';     	
    	nNew = Math.round((posy-(objektheight+objekty)) / nZeilenHoehe); 
    	//if (nNew!=nAktuell && (nZeilenHoehe-1) < objektheight + (nZeilenHoehe*nNew) && (getOffsetTop($('myTable')) + $('myTable').offsetHeight)+1 >= (objektheight + (nZeilenHoehe*nNew) + objekty)) {
    	if ((nZeilenHoehe-1) < objektheight + (nZeilenHoehe*nNew) && (getOffsetTop($('myTable')) + $('myTable').offsetHeight)+1 >= (objektheight + (nZeilenHoehe*nNew) + objekty)) {
    		dragobjekt.style.height = objektheight + (nZeilenHoehe*nNew);
    		
	  		// Unteren Divs auch verkleinern
	  		$('eventColor_' + dragobjekt.id.substr(6).toString()).style.height = objektheight + (nZeilenHoehe*nNew)-1;
	  		$('eventContent_' + dragobjekt.id.substr(6).toString()).style.height = objektheight + (nZeilenHoehe*nNew)-2;    		

	  		nAktuell = 0;    		
    	}    	
    	//alert('bottom');
    }
    else if (nMove==true) {   	
	  	nNew = Math.round((objekty - (posy-nGreifPos)) / nZeilenHoehe);
     
	  	// Erste schaut unten Zweite oben
	  	if (nNew>=nMaxBottom && objekty - (nZeilenHoehe*nNew) >= nTopGrid-2) {
	  	//if (objekty - (nZeilenHoehe*nNew) >= nTopGrid-2 ) {
	  		if (navigator.appName.indexOf("Explorer") > -1) 
	  		  dragobjekt.style.top = objekty - (nZeilenHoehe*nNew) - (nTopGrid-1);
	  		else 
	  		  dragobjekt.style.top = objekty - (nZeilenHoehe*nNew) - (nTopGrid-2);
	  	}    	
	  	 	
	  	// Unterhalb der Tage verschieben 
	  	nEventTag = Math.ceil(((posx - nGridPos1)/nGridLaenge));	  	
	  	if ((nMode==1 && nEventTag <= 7 && nEventTag >= 1) || (nMode==2 && nEventTag <= 5 && nEventTag >= 1)) {
	  		$('eventTag'+nEventTag).appendChild(dragobjekt);
	  	}
    }    
    else {
    	//
    }
  }
  else {
  	//
  }
}

String.prototype.lPad = function (n,c) {var i; var a = this.split(''); for (i = 0; i < n - this.length; i++) {a.unshift (c)}; return a.join('')}

function getLayer(nMode) {
  $('layer').style.height = $('CalendarTableBody').style.height;
  $('layer').style.width = $('CalendarTableBody').style.width;
  if (nMode==1) {
    $('layer').style.display = 'block';
  } else {
    $('layer').style.display = 'none';
  }

  
  

}

function newEvent(obj) {
	nDivAktuellPos = Math.round((getOffsetTop(obj)-nTopGrid)/nZeilenHoehe);
	
	nMaxBottom = (((nDisplayStundenBis+1) - nDisplayStundenVon) * nAnzZeilenProStunde) - nDivAktuellPos;
	
	nTag = obj.id.substr(0,4).toString().replace( /^(0+)/g, '' ); 
	
	var objDiv = document.createElement("div");
	
	objDiv.id              = 'newevent_'+nTag;
	objDiv.className       = 'newevent';
	objDiv.style.height    = nZeilenHoehe+'px';
	objDiv.style.top       = (getOffsetTop(obj)-nTopGrid)+2+'px';

	objNewEvent = objDiv ;
	
	$('eventTag'+nTag).appendChild(objDiv);
}

// Ajax-Funktionen
function refreshCalendarBody() {
	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
	ajaxUrl = ajaxUrl + '&aktion=refreshBody';
	new Ajax.Request(ajaxUrl, {
	  method: 'get',
	  onSuccess: function(transport) {
	  	$('eventContainer').remove();
	  	sInhalt = $('myTableBody').innerHTML;
	    $('myTableBody').update(transport.responseText + sInhalt);
	    getLayer(0);
	  }
	});
}

function refreshCalendarHeader() {
	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
	ajaxUrl = ajaxUrl + '&aktion=refreshHeader';
	new Ajax.Request(ajaxUrl, {
	  method: 'get',
	  onSuccess: function(transport) {
	    $('myTableHeader').update(transport.responseText);
	    setSize();
	  }
	});
}

function refreshCalender() {
	refreshCalendarHeader();
	refreshCalendarBody();
}

function resizeEvent(nId, nTop, nHeight) {
  getLayer(1);
	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
	ajaxUrl = ajaxUrl + '&aktion=resize&nId=' + nId + '&nTop=' + nTop + '&nHeight=' + nHeight;
	new Ajax.Request(ajaxUrl, {
	  method: 'get',
	  onSuccess: function(transport) {
	  	refreshCalendarBody();
	  }
	});	
}

function moveEvent(nId, nTop, nHeight, nTag) {
  getLayer(1);
	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
	ajaxUrl = ajaxUrl + '&aktion=move&nId=' + nId + '&nTop=' + nTop + '&nHeight=' + nHeight+ '&nTag=' + nTag;
	new Ajax.Request(ajaxUrl, {
	  method: 'get',
	  onSuccess: function(transport) {
	  	refreshCalendarBody();
	  }
	});	
}

function addEvent(sBez, dtVon, dtBis, sColor, sBesch) {
  getLayer(1);
	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
	ajaxUrl = ajaxUrl + '&aktion=add&sBez=' + sBez + '&dtVon=' + dtVon + '&dtBis=' + dtBis + '&sColor=' + sColor + '&sBesch=' + sBesch;
	new Ajax.Request(ajaxUrl, {
	  method: 'get',
	  onSuccess: function(transport) {
	    if (transport.responseText==0) {
	      alert("Anlage nicht erfolgreich")
	      refreshCalendarBody();
	    } else {
	      refreshCalendarBody();
	    }
	  }
	});		
}

function addEventDD(nTag, nTop, nHeight, sBez, sColor, sBesch) {
  getLayer(1);
	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
	ajaxUrl = ajaxUrl + '&aktion=addDD&sBez=' + sBez + '&nTag=' + nTag + '&nTop=' + nTop + '&nHeight=' + nHeight + '&sColor=' + sColor + '&sBesch=' + sBesch;
	new Ajax.Request(ajaxUrl, {
	  method: 'get',
	  onSuccess: function(transport) {
	    if (transport.responseText==0) {
	      alert("Anlage nicht erfolgreich")
	    } else {
	      refreshCalendarBody();
	    }
	  }
	});		
}

function removeEvent(nId) {
  getLayer(1);
	ajaxUrl = 'calendar.ajax.php?nAnzZeilenProStunde=' + nAnzZeilenProStunde + '&nZeilenHoehe=' + nZeilenHoehe + '&nMode=' + nMode + '&nTage=' + nTage + '&nKW=' + nKW + '&nJahr=' + nJahr + '&nDisplayStundenVon=' + nDisplayStundenVon + '&nDisplayStundenBis=' + nDisplayStundenBis;
	ajaxUrl = ajaxUrl + '&aktion=remove&nId=' + nId;
	new Ajax.Request(ajaxUrl, {
	  method: 'get',
	  onSuccess: function(transport) {
	  	refreshCalendarBody();
	  }
	});		
}

function hideMe() {
  $("GB_window").style.display='none';
  $("GB_overlay").style.display='none';
  refreshCalendarBody();
}