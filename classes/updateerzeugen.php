<?php
//$menu=$_GET[menu];
//$idwert=$_GET[idwert];
//echo $menu."=menu<br>";
//echo $idwert."=idwert<br>";
include("../config.php");
include("updateerzeugenfunc.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin('Update erzeugen');

$update = $_GET['update'];
if ($update==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='updateerzeugen.php'>zurück</a><br><br>";
    $query = "SELECT * FROM tblversion WHERE fldindex=".$_POST['updateversion'];
    $result = mysql_query($query) or die(mysql_error());
    $line = mysql_fetch_array($result);
    $localvers=$line['fldkurz'];    
    $vonvers=intval($localvers)-1;
    $nchvers=intval($localvers);
    //echo $localvers."=localvers<br>";
    echo $vonvers."=von<br>";
    echo $nchvers."=nch<br>";
    updateverzabgleich("",$vonvers,$nchvers);
    //updateverzvergleich("",$vonvers,$nchvers);
    //updateinserterzeugen($localvers);
    //$output = shell_exec("find joorgportal309 -name '*.*~' > dirlist.txt");
    //echo "<pre>$output</pre>";
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=updateerzeugen.php'>";  
  }  
} else {
  updateauswahl();
}  

bootstrapend();
?>