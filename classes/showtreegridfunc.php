<?php
header("content-type: text/html; charset=utf-8");

echo "<script type='text/javascript'>";

echo "function checkexpand(vnode) {";
echo "    var items = document.getElementsByTagName('input');";
echo "    for(var i = 0; i < items.length; i+=1) {";
echo "      if(items[i].getAttribute('id')=='node'+vnode) {";
//echo "        alert('check:'+vnode+'='+items[i].getAttribute('value'));";
echo "        strexp = items[i].getAttribute('value'); ";
echo "      }";
echo "    }";
echo "    return strexp;";
echo "}";

echo "function toggle(vnode,vdisplay,vexp) {";
echo "    var items = document.getElementsByTagName('tr');";
echo "    for(var i = 0; i < items.length; i+=1) {";
echo "      if(items[i].getAttribute('id')=='showzeile'+vnode) {";
echo "        strindex = items[i].getAttribute('name');";
echo "        strindex = strindex.substr(5,strindex.length-5);";
echo "        strexp = checkexpand(vnode);";
//echo "  if (showimg=='true') { alert(strexp); showimg='false';}";
//echo "        if (vexp==strexp) {";
echo "          items[i].style.display = vdisplay;";
//echo "        }";
echo "        toggle(strindex,vdisplay);";
echo "      }";
echo "    }";
echo "}";

echo "function myswitch(vnode,vparent) {";
echo "  mycheck = document.getElementById('node'+vnode).value;";
echo "  if (mycheck=='expand') {";
echo "    document.getElementById('node'+vnode).value='collapse';";
echo "    toggle(vnode,'none','collapse');";
echo "    document.getElementById('treepic'+vnode).src='../includes/styles/joomportal/images/plus.jpg';";
echo "  } else {";
echo "    document.getElementById('node'+vnode).value='expand';";
echo "    toggle(vnode,'table-row','expand');";
echo "    document.getElementById('treepic'+vnode).src='../includes/styles/joomportal/images/minus.jpg';";
echo "  }";
echo "}";

echo "</script>";

function showtreegrid($menu,$idwert) {
  include("../config.php");
  include("bootstrapfunc.php");
  bootstraphead();
  include("../sites/views/wp_".$menu."/showtab.inc.php");
  if ($drucken=="J") {
    echo "<br>";
  }
  $bez=$pararray['headline'];
  $name=$pararray['name'];
  $order=$pararray['strorder'];
  $bez=translate($name,$bez,$langshort);
  bootstrapbegin($bez);
  if (isset($pararray['dbtable'])) {
    $dbtable=$pararray['dbtable'];
    $filter="";
    if ($_GET[filter]==1) {
      $filter=1;
    }
    if ($strwhere!="") {
      $pararray['strwhere']=$strwhere;
    }
    showtreelist($listarray,$dbtable,$order);
  }  
  bootstrapend();
}

function showtreelist($listarray,$dbtable,$order) {

  echo "<form>";
  echo "<table class='table table-hover'>";
  echo "<thead>";
  $maxtiefe=2;
  echo "<th width='1'><img src='../includes/styles/joomportal/images/minus.jpg'></img></th>";
  for ( $x = 1; $x < $maxtiefe; $x++ ) {
    echo "<th width='1'></th>";
  }	
  echo "<th width='5'></th>";
  foreach ( $listarray as $arrelement )
  {
    if ($arrelement['fieldhide']!="true") {
       switch ( $arrelement['type'] )
       {
         case 'checkbox':
           echo "<th wdith='5'><input type='checkbox' value='0'></th>";
         break;
         default: 
           $bez=$arrelement['label'];
           $name=$arrelement['name'];
           //echo $name.",".$bez."<br>";
           //$bez=translate($name,$bez,$langshort);
           echo "<th width='".$arrelement['width']."'>".$bez."</th>";
       }
    }  
  }
  echo "</thead>";  
  zeileausgeben($listarray,$dbtable,0,0,$maxtiefe,$order);
  echo "</table>";
  echo "</form>";

}

function zeileausgeben($listarray,$dbtable,$fldparent,$tiefe,$maxtiefe,$order) {
  if ($order!="") {
    $query = "SELECT * FROM ".$dbtable." WHERE fldparent=".$fldparent." ORDER BY ".$order;
  } else {	
    $query = "SELECT * FROM ".$dbtable." WHERE fldparent=".$fldparent;
  }  
  //echo $query."=query<br>";
  $result = mysql_query($query) or die(mysql_error()." sql010:".$query);  
  while ($line = mysql_fetch_array($result)) {   
//      echo "<input type='hidden' id='node".$line['fldindex']."' name='node".$line['fldindex']."' value='expand'>";
      echo "<input type='hidden' id='node".$line['fldindex']."' name='node".$line['fldindex']."' value='collapse'>";
//      echo "<tr id='showzeile".$fldparent."' name='index".$line['fldindex']."' style='display:table-row'>";
      if ($tiefe==0) {
        echo "<tr id='showzeile".$fldparent."' name='index".$line['fldindex']."' style='display:table-row'>";
      } else {
        echo "<tr id='showzeile".$fldparent."' name='index".$line['fldindex']."' style='display:none'>";
      }  
      for ( $x = 0; $x <= $maxtiefe; $x++ )
      {
	    if ($x<$tiefe) {
	      echo "<td><img src='../includes/styles/joomportal/images/line.jpg'></img></td>";
	    } else {
	      if ($x>$tiefe) {
	        echo "<td></td>";
		  } else {
//	        echo "<td><a href='#' onClick='myswitch(".$line['fldindex'].",".$fldparent.")'><img src='../includes/styles/joomportal/images/node.jpg'></img></a></td>";
	        echo "<td><a href='#' onClick='myswitch(".$line['fldindex'].",".$fldparent.")'><img id='treepic".$line['fldindex']."' src='../includes/styles/joomportal/images/minus.jpg'></img></a></td>";
          }		
        }	  
	  }   
//      echo "<td>".$tiefe."</td>";
      foreach ( $listarray as $arrelement ) {
        $wert=$line[$arrelement['dbfield']];  
        echo "<td>".$wert."</td>";
      }
      echo "</tr>";
      zeileausgeben($listarray,$dbtable,$line['fldindex'],$tiefe+1,$maxtiefe,$order);
  }
}

?>