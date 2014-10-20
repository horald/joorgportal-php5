<?php
include("../config.php");
include("bootstrapfunc.php");
include("translatefunc.php");
bootstraphead();
$idwert=$_GET['idwert'];
if ($mediawikimain<>"") {
  $bez=translate("HELP","Hilfe",$langshort);
  $qrymen="SELECT * FROM tblmenu_liste WHERE fldIndex=".$idwert;
  $resmen = mysql_query($qrymen) or die(mysql_error());
  $linmen = mysql_fetch_array($resmen); 
  bootstrapbegin($linmen['fldMenu']);
  if ($linmen['fldhelplink']<>"") {
    echo "<a class='btn btn-primary' href='".$mediawikipath.$linmen['fldhelplink']."'>".$bez."</a><br><br>";
  } else {
    echo "<a class='btn btn-primary' href='".$mediawikipath.$mediawikimain."'>".$bez."</a><br><br>";
  }
} else {  
  bootstrapbegin("Submenü");
}
if (isset($idwert)) {
  $query="SELECT * FROM tblmenu_liste WHERE fldparent='".$idwert."' ORDER BY fldSort";
  $result = mysql_query($query) or die(mysql_error()." ".$query);
  echo "<ul>";
  while ($line = mysql_fetch_array($result)) {
  	 echo "<li>".$line['fldMenu']."</li>";
  }	 
  echo "</ul>";
}  
bootstrapend();
?>