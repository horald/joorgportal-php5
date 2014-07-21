<?php
include("../config.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin("Programmupdate");
echo "<a class='btn btn-primary' href='../welcome.php'>zur&uumlck</a><br>";
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

$opts = array(
    'http' => array(
    'proxy' => $proxy,
    'request_fulluri'=>true,
    )
);
$context = stream_context_create($opts);
//$http="https://sourceforge.net/projects/joorgportal/files/version.txt";
$http="http://www.horald.de/joorgportal/version.txt";
//var_dump(file_get_contents($http, false, $context));

$neueVersion = file_get_contents($http,false,$context);
if ($neueVersion=="") {
  echo "<div class='alert alert-info'>";
  echo "Verbindungsfehler! Ermittlung der aktuellen Version nicht m&oumlglich.<br>";
  echo "</div>";
} else {
  if ($neueVersion>$gupdvers) {
    echo "<div class='alert alert-info'>";
    echo "Aktuelle Version:".$gupdvers."<br>";
    echo "Neue Version....:".$neueVersion."<br>";
    echo $txtupdatemessage."<br>";
    $nver=substr($neueVersion,3,1);
    $gver=substr($gversion,2,4).$nver;
	 $http="http://sourceforge.net/projects/joorgportal/files/joorgportal30/alpha/joorgportal-alpha-".$gver."-update.zip/download";
    echo "<a class='btn btn-primary' target='_blank' href='".$http."'>Download Update</a><br>";
    echo "</div>";
  } else {
    $query = "SELECT * FROM tblversion WHERE fldkurz='".$gupdvers."'";
    $result = mysql_query($query) or die(mysql_error());
    $line = mysql_fetch_array($result);
    echo "<div class='alert alert-success'>";
    echo "Sie haben die aktuelle Programmversion. (".$line['fldbez'].")";
    echo "</div>";
  }
}    
bootstrapend();
?>  