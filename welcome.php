<?php
session_start();
header("content-type: text/html; charset=utf-8");

function readini($filename, $section, $var) {
	$array = parse_ini_file($filename, true);
	return $array[$section][$var];
}

include("config.php");

if (isset($_POST['langshort'])) {
  $_SESSION['LANGSHORT']=$_POST['langshort'];
  $locallangshort=$_SESSION['LANGSHORT'];
} else {
  $locallangshort=$langshort;
}

include("language/lang_welcome.".$locallangshort.".php");
include("classes/translatefunc.php");
include("classes/tools.php");
echo "<html lang='de'>";
echo "<head>";
echo "<meta charset='utf-8'>";
echo "<title>".$txtwelcome_title."</title>";
echo "<link href='includes/bootstrap/css/bootstrap.css' rel='stylesheet'>";
echo "<script type='text/javascript' src='includes/bootstrap/js/bootstrap-datepicker.js' charset='UTF-8'></script>";
echo "</head>";
echo "<body>";
echo "<div class='row-fluid'>";
$bez=translate("WELCOME","Willkommen",$locallangshort);
echo "<legend>".$bez."!</legend>";
echo "<form method='post' action='welcome.php'>";
echo "<pre>";
echo "<table>";
$query = "SELECT * FROM tblversion WHERE fldkurz='".$gupdvers."'";
$result = mysql_query($query) or die(mysql_error());
$line = mysql_fetch_array($result);
$localuptodate=$line['flddatum'];

if (($timestamp = strtotime($localuptodate)) === false) {
    echo "Die Zeichenkette ($localuptodate) ist nicht parsebar.";
} else {
    $localuptodate = date('d.m.Y', $timestamp);
}

$localversion=$line['fldbez'];
echo "<tr><td>Stand</td><td>: ".$localuptodate."</td></tr>";
echo "<tr><td>Version</td><td>: ".$localversion."</td></tr>";
$browser = new checkBrowser ;
echo "<tr><td>Browser</td><td>: ".$browser->Name." ".$browser->Version."</td></tr>";
$bez=translate("DATABASE","Datenbank",$locallangshort);
echo "<tr><td>".$bez."</td><td>: ".$gdbname."</td></tr>";
$host=gethostname();
echo "<tr><td>hostname</td><td>: ".$host."</td></tr>";
$ip=gethostbyname($host);
echo "<tr><td>IP-Addr</td><td>: ".$ip."</td></tr>";
$detect_mysql=mysql_query('select @@basedir as mysql_home, @@auto_increment_increment as auto_incr, @@auto_increment_offset as auto_offset');         
$path=mysql_fetch_assoc($detect_mysql); 
$pfad = $path['mysql_home'];
$pfad = "/etc/mysql";
//echo "<tr><td>pfad</td><td>: ".$pfad."</td></tr>";
//$autovar = readini($pfad."/my.cnf","mysqld","auto-increment-increment");
//$autovar = 10;
$curruser=get_current_user();
//$curruser=getenv('USERNAME');
echo "<tr><td>User</td><td>: ".$curruser."</td></tr>";
$autovar = $path['auto_incr'];
echo "<tr><td>auto-incr</td><td>: ".$autovar."</td></tr>";
//$autooffset = readini($pfad."/my.cnf","mysqld","auto-increment-offset");
//$autooffset = 3;
$autooffset = $path['auto_offset'];
echo "<tr><td>auto-offset</td><td>: ".$autooffset."</td></tr>";

echo "<tr><td>Language</td><td>: ";
//echo "<form method='post' action='welcome.php'>";
echo "<select name='langshort' size='1'>";
if ($locallangshort=="de") {
  echo "<option style='background-color:#c0c0c0;' value='de' selected>de</option>";
} else {  
  echo "<option style='background-color:#c0c0c0;' value='de' >de</option>";
}  
if ($locallangshort=="en") {
  echo "<option style='background-color:#c0c0c0;' value='en' selected>en</option>";
} else {
  echo "<option style='background-color:#c0c0c0;' value='en' >en</option>";
}  
echo "</select>";
echo "<td> <button type='submit' name='submit' class='btn btn-primary'> Aktualisieren </button></td>";
echo "</td></tr>";

//echo "<tr><td>Language</td><td>: ".$langshort."</td></tr>";
$href=substr($PHP_SELF,-11)."index.php";
echo "<tr><td>Aufruf</td><td>: <a href='".$href."' target='_blank'>Joorgportal</a></td></tr>";
echo "</table>";
echo "</pre>";
echo "</form>";
echo "<p>Joorgportal ist eine Groupware f&uumlr Familien und Privatpersonen.</p>";
echo "<a class='btn btn-primary' href='classes/changes.php'>logfile</a> <a class='btn btn-primary' href='classes/prgupdate.php'>Programmupdate</a> ";
if ($mediawikimain<>"") {
  echo "<a class='btn btn-primary' href='http://localhost/tools/mediawiki/index.php/".$mediawikimain."'>Hilfe</a><br>";
}  
echo "</div>";

$config="config.php";
$fp = fopen ( $config, 'r' );
$zeile = fread ( $fp, filesize ( $config ) );
//while ( $zeile = fgets ( $fp ) )
//{
//    echo $zeile."=test";
//}
fclose ( $fp );
//echo $zeile;

echo "<br>";
echo "<div class='alert alert-info'><h1>Open-Source-Programmierung zur Projektunterst&uumltzung gesucht. Kontakt </span><a href='http://sourceforge.net/p/joorgportal/discussion/german/thread/dd6c74a6/' target='_blank'>hier</a>.</h1></div>";
echo "</body>";
echo "</html>";
?>