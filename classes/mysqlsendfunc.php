<?php
session_start();

function mysqlsend($remotepfad,$host,$user,$pwd,$dbname,$tblname,$typ,$query,$showconnect) {
  echo $host.",".$user.",".$pwd.",".$dbname.",".$tblname.",".$typ.",".$showconnect."=in mysqlsendfund<br>";  
  echo "setcokie<br>";
  setcookie("query", $query);  
  echo "<meta http-equiv='refresh' content='0; URL=".$remotepfad."mysqlsend.php?showconnect=".$showconnect."&dbhost=".$host."&dbuser=".$user."'>";
}  

?>
