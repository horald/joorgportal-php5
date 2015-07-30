<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("schedulecopyfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline'].' kopieren','true');

$schedulecopy = $_GET['schedulecopy'];
if ($schedulecopy==1) {
  if (isset($_REQUEST['submit'])) { 
    $vondatum=$_POST['vondatum'];	
    $bisdatum=$_POST['bisdatum'];	
    $neudatum=$_POST['neudatum'];	
    //echo "von datum:".$_POST['vondatum']."<br>";	
    //echo "bis datum:".$_POST['bisdatum']."<br>";	
    //echo "neu datum:".$_POST['neudatum']."<br>";
    $dbtable=$_POST['dbtable'];
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br><br>";    schedulecopyausfuehren($vondatum,$bisdatum,$neudatum,$dbtable);	
  } else {
    echo "Der Vorgang wurde abgebrochen.<br>"; 
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";
  }  
} else {
  $dbtable=$pararray['dbtable'];
  schedulecopyauswahl($dbtable,$menu,$menuid);
}  

bootstrapend();
?>