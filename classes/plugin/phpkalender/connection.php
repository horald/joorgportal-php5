<?PHP
include("../../../config.php");
echo $dbname."=dbname<br>";
$con = mysql_connect($dbhost, $dbuser, $dbpass);
mysql_select_db($dbname);
?>