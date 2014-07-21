<?php
include("../../config.php");
include("changesfunc.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin('Changes');
//$lines = file("changes.".$langshort.".log");
//foreach ($lines as $line_num => $query) {
//  echo $query."<br>";
//}
$changes = $_GET['changes'];
if ($changes==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='../welcome.php'>zurueck</a><br>";
    changesausfuehren();
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  changesinput();
}  
bootstrapend();
?>