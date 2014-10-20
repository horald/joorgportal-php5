<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("pruefvorratfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead($pfad);
bootstrapbegin($pararray['headline']);

$pruefvorrat = $_GET['pruefvorrat'];
if ($pruefvorrat==1) {
  $rezeptid=$_GET[rezeptid];	
  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zur&uumlck</a><br><br>";
  aufeinkaufsliste($pararray,$idwert,$rezeptid);} else {

  $query="SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$_SESSION['DBSELARR'][0];
  //echo $query."=query<br>";  
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $idrezept=$line['fldid_rezepte'];

  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zur&uumlck</a> ";  echo "<a class='btn btn-primary' href='pruefvorrat.php?pruefvorrat=1&rezeptid=".$idrezept."&menu=".$menu."&idwert=".$idwert."'>Auf Einkaufsliste</a><br><br>";  pruefvorrat($pararray,$idrezept);
}  

bootstrapend();
?>