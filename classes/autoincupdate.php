<?php
include("../config.php");
include("autoincupdatefunc.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin('autoincupdate');
$parupdate = $_GET['parupdate'];
if ($parupdate==1) {
  autoincupdate();
} else {
  getparam();
}
bootstrapend();
?>