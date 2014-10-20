<?php
  $menu=$_GET[menu];
  $idwert=$_GET[idwert];
  include("../config.php");
  include("mysqlcopyremotefunc.php");
  include("bootstrapfunc.php");
  include("syncfunc.php");
  include("../sites/views/wp_".$menu."/showtab.inc.php");
  bootstraphead();
  bootstrapbegin($pararray['headline']);
  
  $dbtable=$pararray['dbtable'];
  $fldindex=$pararray['fldindex'];
  mysqlcopyremote($dbtable,$fldindex,$idwert);
  
  bootstrapend();
?>