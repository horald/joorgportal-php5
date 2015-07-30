<?php
session_start();
require_once("configuration.php");
//upgedatet auf sourceforge
//general
$gupdvers="0315";
$updvers=$gupdvers;
$version="0.3.0.15 (alpha)";
$bootstrapver=2;
$layout="joorgportal";

//specific
$language="german";
$langshort="de";
$_SESSION['LANGSHORT']="de";
$dbscript="dbdemo.php";
$dbarray = array ( 'dbdemo.php', 'db.php' );
$importpfad = "/var/www/html/daten/import/";
$exportpfad = "/var/www/html/daten/export/";
$imagepath = "/daten/image/";
$downloadpath = "/home/horald/daten/Downloads/";
$proxy="192.168.0.104:3128";
//$proxy="";
$brver="normal";

//help / mediawiki
$mediawikiactive=true;
$mediawikipath="http://localhost/tools/mediawiki/index.php/";
$mediawikimain="Hauptseite";

//frame
//$winwidth=1035;
$winwidth=1135;
//$winheight=580;
$winheight=300;

//audioframe
$audiowidth=1200;
$audioheight=300;

//Database
$config=new JConfig();
$gdbname="dbjoorgportal";
$gdbhost="localhost";
$gdbuser="root";
$gdbpass="mysql";
//$gdbname=$config->db;
//$gdbhost=$config->host;
//$gdbuser=$config->user;
//$gdbpass=$config->password;

$gdbcon = mysql_connect($gdbhost,$gdbuser,$gdbpass) or die(mysql_error());
$gdbres = mysql_select_db($gdbname) or die(mysql_error());

?>