<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("importfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead($pfad);
bootstrapbegin($pararray['headline']);

echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br>";
$import = $_GET['import'];
if ($import==2) {
  importdelete();
} else {
  if ($import==1) {
    if (isset($_REQUEST['submit'])) { 
      importfunc($importpfad);
    } else {
      echo "Der Vorgang wurde abgebrochen.<br>"; 
      echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";
    }  
  } else {
    //importfilename($menu);
    importabfrage($menu,$importpfad,$menuid);
  }  
}

bootstrapend();

?>