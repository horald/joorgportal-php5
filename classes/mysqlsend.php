<?php
session_start();
echo "mysqlsend<br>";
echo "getcookie<br>";
$query=$_COOKIE['query'];
$dbhost=$_GET['dbhost'];
echo "dbhost:".$dbhost."<br>";
echo "query:".$query."<br>";
?>