<?php
header("content-type: text/html; charset=utf-8");
session_start();

function delselask($pararray,$remotehost) {
  if ($remotehost<>"") {
    include("syncfunc.php");
    $qrycomp="SELECT * FROM tblcomputer WHERE fldHost='".$remotehost."'";
    $rescomp = mysql_query($qrycomp) or die("qrycomp:".mysql_error());
    $lincomp = mysql_fetch_array($rescomp);
    $dbremotehost=$lincomp['fldIPAddr'];
    $dbremoteuser=$lincomp['fldusername'];
    $dbremotepass=$lincomp['fldpassword'];
    $dbremotedb=$lincomp['flddbname'];
    changetoremote($dbremotehost,$dbremoteuser,$dbremotepass,$dbremotedb);
  }		
  $dbselarr = $_SESSION['DBSELARR'];
  $dbselchk = $_SESSION['DBSELCHK'];
  $count=sizeof($dbselarr);
  for ( $x = 0; $x < $count; $x++ )
  {
    //$idcheck = $dbselchk[$x];
  	 //echo "cbutton".$x.":".$idcheck."<br>";
  	 $query="DELETE FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$_SESSION['DBSELARR'][$x];
  	 //echo $query."<br>";
    $result = mysql_query($query) or die(mysql_error()." ".$query);
  }
  echo "<div class='alert alert-success'>";
  echo $count." Daten gel&oumlscht.";
  echo "</div>";
}
?>