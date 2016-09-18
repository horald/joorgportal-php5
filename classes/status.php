<?php
include("bootstrapfunc.php");
include("statusfunc.php");
$menu=$_GET['menu'];
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin("Status");
echo "<a href='showtab.php?menu=".$menu."'  class='btn btn-primary btn-sm active' role='button'>Liste</a><br><br>";
$status = $_GET['status'];
if ($status==2) {
  $vondatum = $_POST['vondatum'];	
  $bisdatum = $_POST['bisdatum'];	
  $vonstatus = $_POST['vonstatus'];	
  $nchstatus = $_POST['nchstatus'];	
  $vonort = $_POST['vonort'];	
  $nchort = $_POST['nchort'];	
  $vonkonto = $_POST['vonkonto'];	
  $nchkonto = $_POST['nchkonto'];	
  $auswahltyp = $_POST['auswahltyp'];
  $rechdat=$_POST['rechdat'];
  $dbtable=$pararray['dbtable'];
  statusfunc($vondatum,$bisdatum,$vonstatus,$nchstatus,$auswahltyp,$rechdat,$vonort,$nchort,$vonkonto,$nchkonto,$dbtable);
} else {
  if ($status==1) {
  	 $auswahltyp=$_POST['auswahltyp'];
  	 echo $auswahltyp."#<br>";
    statusauswahl($menu,$auswahltyp);
  } else {
    statusvorauswahl($menu,$filterarray);
  }  
}  
bootstrapend();
?>