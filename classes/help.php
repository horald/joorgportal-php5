<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
$menuid=$_GET[menuid];
$pagename=$_GET['pagename'];
$pageno=$_GET['pageno'];
$action=$_GET['action'];
include("../config.php");
include("helpfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

if ($action=="back") {
  if ($pageno>0) {
  	 $pageno=$pageno-1;
  	 $pagename="";
  }
}	
if ($action=="forward") {
  $pageno=$pageno+1;
  $pagename="";
}	


hilfefunc($menu,$idwert,$menuid,$pagename,$pageno);

bootstrapend();
?>