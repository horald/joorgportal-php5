<?php
session_start();
$user="";
if (isset($_SESSION['uid'])) {
	$user=$_SESSION['uid'];
	//echo $_SESSION['uid']."=user<br>";
}
$menu=$_GET[menu];
$idwert=$_GET[idwert];
$drucken="N";
if (isset($_GET[drucken])) {
  $drucken=$_GET[drucken];
}
include("showtabfunc.php");
include("showtreegridfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
//echo $menu."=menu<br>";
if (isset($_GET[addfunc])) {
  if ($_GET[addfunc]==1) {
    addfunc($menu);
  }
}
if ($pararray['treegrid']) {
  showtreegrid($menu,$idwert);
} else {
  $showtab = $_GET['showtab'];
  $computerid=0;
  if ($showtab==1) {
  	 $computerid=$_POST['selcomputer'];
  }	
  //echo $computerid."=compid<br>";
  callshowtab($menu,"","",$idwert,$drucken,$computerid,$user);
}  
?>