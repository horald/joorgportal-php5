<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("exportfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead($pfad);
bootstrapbegin($pararray['headline']);

//echo "Export<br>";
echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br>";
$export = $_GET['export'];
if ($export==1) {
  if (isset($_REQUEST['submit'])) {
  	 $auswahl=$_POST['auswahl'];
  	 
    switch ( $auswahl )
    {
      case 1:
        exportfunc($exportpfad);
      break;  	 
      case 2:
        exportfunc($exportpfad,$pararray,$menu);
      break;  	 
      case 3:
        echo "<div class='alert alert-success'>";
        echo 'RSS-File noch nicht fertig.';
        echo "</div>";
      break;  	 
      case 4:
        xmlexportfunc($exportpfad,$pararray);
      break;
      case 5:
        htmlexportfunc($exportpfad,$pararray);
      break;
      case 6:
        sqlexportfunc($exportpfad,$pararray,$menu);
      break;  	 
    }  	 
  } else {
    echo "Der Vorgang wurde abgebrochen.<br>"; 
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";
  }  
} else {
  exportabfrage($menu,$menuid);
}  

bootstrapend();

?>