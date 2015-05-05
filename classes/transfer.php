<?php
include("../config.php");
//$sql=$_GET['sql'];
$sql=unserialize(base64_decode($_GET['sql']));
echo $sql."=sql<br>";
$result = mysql_query($sql) or die(mysql_error()." ".$sql);
?>