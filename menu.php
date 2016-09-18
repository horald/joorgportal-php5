<?php

echo "<script type='text/javascript'>";

echo "function checkexpand(vnode) {";
echo "    var items = document.getElementsByTagName('li');";
echo "    for(var i = 0; i < items.length; i+=1) {";
echo "      if(items[i].getAttribute('id')=='node'+vnode) {";
echo "        alert('check:'+vnode+'='+items[i].getAttribute('value'));";
echo "        strexp = items[i].getAttribute('value'); ";
echo "      }";
echo "    }";
echo "    return strexp;";
echo "}";

echo "function toggle(vnode,vdisplay,vexp) {";
echo "    var items = document.getElementsByTagName('li');";
echo "    for(var i = 0; i < items.length; i+=1) {";
echo "      if(items[i].getAttribute('id')=='node'+vnode) {";
echo "        strindex = items[i].getAttribute('name');";
echo "        strindex = strindex.substr(5,strindex.length-5);";
echo "        strexp = checkexpand(vnode);";
//echo "        if (vexp==strexp) {";
echo "          items[i].style.display = vdisplay;";
//echo "        }";
echo "        toggle(strindex,vdisplay);";
echo "      }";
echo "    }";
echo "}";

echo "function myswitch(vnode,vparent) {";
echo "  mycheck = document.getElementById('node'+vnode).value;";
//echo "        alert('mycheck:'+mycheck+','+vnode);";
echo "  if (mycheck=='expand') {";
echo "    document.getElementById('node'+vnode).value='collapse';";
echo "    toggle(vnode,'none','collapse')";
echo "  } else {";
echo "    document.getElementById('node'+vnode).value='expand';";
echo "    toggle(vnode,'normal','expand')";
echo "  }";
echo "}";

echo "</script>";

function showmenuitem($bez,$addr,$id,$vaterid) {
//  echo "<li onclick='showMenu(".$vaterid.")'><a href='".$addr."' target='MyFensterlein'>".$bez.",".$vaterid.",".$childid.",".$addr."</a></li>";
//  echo "<li onclick='showMenu(".$vaterid.",".$id.")'><a href='".$addr."' target='MyFensterlein'>".$bez."</a></li>";
//echo $id.",".$vaterid;
//  if ($vaterid==0) {
    echo "<li id='node".$id."' value='normal' style='display:normal'>";
//    echo "<a href='#' onClick='myswitch(".$line['fldindex'].",".$fldparent.")'><img src='../includes/styles/joomportal/images/minus.jpg'></img></a>";
//    echo "<a href='#' onClick='myswitch(".$id.",".$vaterid.")' ><img src='includes/styles/joomportal/images/minus.jpg'></img></a>";
    echo "<a href='".$addr."' target='MyFensterlein'>".$bez."</a></li>";
//  } else {
//    echo "<li id='node".$id."' value='none' style='display:none'>";
//    echo "<a href='#' onClick='myswitch(".$line['fldindex'].",".$fldparent.")'><img src='../includes/styles/joomportal/images/minus.jpg'></img></a>";
//    echo "<a href='".$addr."' target='MyFensterlein'>".$bez."</a></li>";
//  }
}	

function page_menu($treeMenu,$vaterid,$brver,$childid,$menuuser) {
  if ($menuuser=="J") {
    $query = "SELECT * FROM tblmenu_liste WHERE fldview='J' AND fldparent='".$vaterid."' AND fldversion>='0303' AND fldusername='".get_current_user()."' ORDER BY fldSort";
  } else {
    $query = "SELECT * FROM tblmenu_liste WHERE fldview='J' AND fldparent='".$vaterid."' AND fldversion>='0303' AND fldusermenu<>'J' ORDER BY fldSort";
  }
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());

  if ($brver==="mobil") {
  	 //echo "<ul id='".$vaterid."'>"; 
  	 echo "<ul>"; 
  }	
  while ($line = mysql_fetch_array($result)) {

    //echo $line['fldTyp'].",".$line['fldMenu']."=menümodul<br>"; 
    $page=$line['fldIndex'];
    $target="";
    switch ($line['fldTyp']) {
    	case "WEBLINK":
      	$addr=$line['fldtblwebadr'];
      	//echo $addr."=addr<br>";
      	$target=$line['fldtarget'];
      break;
      default:	
        $qrymod = "SELECT * FROM tblmenu_liste, tblmenu_modul WHERE tblmenu_liste.fldid_modul=tblmenu_modul.fldindex and tblmenu_liste.fldIndex='".$page."'";
        $resmod = mysql_query($qrymod) or die(mysql_error());
        $linmod = mysql_fetch_array($resmod);
        $addr=$linmod['fldwebadr'];
        //echo $addr."=addr<br>";
      break;
    }	 
    $inpos=strpos($addr,'?');
    if ($inpos>0) {
      $addr=$addr."&idwert=".$page;
    }

    if ($brver==="mobil") {
    	showmenuitem($line['fldMenu'],$addr,$line['fldIndex'],$vaterid);
    } else {	
      $newnode = $treeMenu->AddNode($line['fldMenu'],$addr,$target);
    }  
    page_menu($newnode,$line['fldIndex'],$brver,$vaterid);

  }
  if ($brver==="mobil") {
  	 echo "</ul>"; 
  }	
}

?>