var maxMenu = 1000  
window.onload=init;

function init() {
  for(var i=0; i<maxMenu; i++) {
    if(!document.getElementById(i).style.display)
      document.getElementById(i).style.display = "none";
  }
}

function showMenu(vaterid,menu) {
	alert(menu);
	if(document.getElementById(vaterid).style.display == "none" && menu=903)
	  document.getElementById(vaterid).style.display = "block";
//  for(var i=0; i<maxMenu; i++) {
//    if(document.getElementById(i).style.display == "none" && i == menu)
//      document.getElementById(i).style.display = "block";
//    else if(document.getElementById(i).style.display != "none")
//      document.getElementById(i).style.display = "none";
//  }
}
