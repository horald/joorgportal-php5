<?php
include("../config.php");
include("bootstrapfunc.php");
include("translatefunc.php");
bootstraphead();
bootstrapbegin("Kalender");
$idwert=$_GET['idwert'];
if ($mediawikimain<>"" AND $idwert<>"") {
  $bez=translate("HELP","Hilfe",$langshort);
  $qrymen="SELECT * FROM tblmenu_liste WHERE fldIndex=".$idwert;
  $resmen = mysql_query($qrymen) or die(mysql_error());
  $linmen = mysql_fetch_array($resmen); 
  if ($linmen['fldhelplink']<>"") {
//    echo "<a class='btn btn-primary' href='".$mediawikipath.$linmen['fldhelplink']."'>".$bez."</a> ";
  } else {
//    echo "<a class='btn btn-primary' href='".$mediawikipath.$mediawikimain."'>".$bez."</a> ";
  }
}  
// echo "<a class='btn btn-primary' href='#'>Einf&uumlgen</a><br><br>";
//echo "Kalender";
echo "<div id='calendar'></div>";
bootstrapend();
?>
