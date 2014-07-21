<?php
header("content-type: text/html; charset=utf-8");
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
include("syncfunc.php");
include("mysqlcopyremotefunc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

$query="SELECT * FROM tblcomputer WHERE fldaktiv='J' AND fldlocal<>'J' AND fldcloud<>'J'";
$result=mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
$count=0;
while ($line = mysql_fetch_array($result)) {
  $count=$count+1;	
  //echo $line['fldHost']."<br>";
  $qrysync="INSERT INTO tbldbsync (flddbname, fldtblname, fldtblindex, fldcompid, fldstatus, flddbsync) VALUES ('".$gdbname."','".$pararray['dbtable']."','".$idwert."',".$line['fldIndex'].",'INS','NEW')";
  //echo $qrysync."<br>";
  mysql_query($qrysync) or die("Error using mysql_query($sql): ".mysql_error());
}	 
echo "<div class='alert alert-info'>";
echo "Resync f&uumlr ".$count." Computer eingef&uumlgt.";
echo "</div>";

$query="SELECT * FROM tblcomputer WHERE fldaktiv='J' AND fldlocal<>'J' AND fldcloud='J'";
$result=mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
$line = mysql_fetch_array($result);
$dbremotehost=$line['fldIPAddr'];
$dbremoteuser=$line['fldusername'];
$dbremotepass=$line['fldpassword'];
$dbremotedb=$line['flddbname'];

//$query="SELECT * FROM tblcomputer WHERE fldaktiv='J' AND fldlocal<>'J' AND fldcloud<>'J'";
$query="SELECT * FROM tblcomputer WHERE fldaktiv='J' AND fldcloud='J'";
$result=mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
$count=0;
$qryarr=array();
while ($line = mysql_fetch_array($result)) {
  $count=$count+1;	
  $qrysync="INSERT INTO tbldbsync (flddbname, fldtblname, fldtblindex, fldcompid, fldstatus, flddbsync) VALUES ('".$line['flddbname']."','".$pararray['dbtable']."','".$idwert."',".$line['fldIndex'].",'INS','NEW')";
  //echo $qrysync."=qrysync<br>";
  $menge = array_push ( $qryarr, $qrysync );
}	 
if ($count>0) {
  changetoremote($dbremotehost,$dbremoteuser,$dbremotepass,$dbremotedb);
  for ( $x = 0; $x < sizeof($qryarr); $x++ )
  {
  	 $qrysync=$qryarr[$x];
  	 //echo $qrysync."=qrysync<br>"; 
    $result=mysql_query($qrysync) or die("Error using mysql_query($qrysync): ".mysql_error());
  }
  changetolocal();
  mysqlcopyremote($pararray['dbtable'],$pararray['fldindex'],$idwert);
  echo "<div class='alert alert-info'>";
  echo "Resync f&uumlr ".$count." Cloud-Computer eingef&uumlgt.";
  echo "</div>";
}


//echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  

bootstrapend();
?>