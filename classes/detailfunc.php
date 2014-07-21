<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../sites/views/wp_".$menu."/showtab.inc.php");
if ($pararray['strwhere']!="") {
  //$pararray['strwhere']=$pararray['strwhere']." AND ".$pararray['flddetail']."=".$idwert;
  $pararray['strwhere']=$pararray['flddetail']."=".$idwert;
} else {
  $pararray['strwhere']=$pararray['flddetail']."=".$idwert;
}
$strwhere=$pararray['strwhere'];
//echo $strwhere."<br>";
echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."'>zurueck</a><br>";
include("showtabfunc.php");
callshowtab($menu,$strwhere,$idwert);
?>