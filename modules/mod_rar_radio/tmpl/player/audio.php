<?php 

/**
 * Element: audio
 * Crea el titulo de la cancion, basado en el script de 
 * Now Playing PHP script for SHOUTcast, This script is (C) MixStream.net 2008 
 *
 * @package    rar_radio
 * @version    v0.4
 *
 * @author     Roberto Arias <info@rarcompucion.com>
 * @link       http://www.rarcomputacion.com
 * @copyright  Copyright (C) 2011-2013 RARComputacion.com All Rights Reserved
 * @license    http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 */

/* ----------- Server configuration ---------- */ 

include('../codifica.php');
$Datos=base64_url_decode($_GET['d']);
//$Datos = parse_str('$Datos');
//echo parse_str('$Datos');
$Datos = explode(",",$Datos);
//echo $Datos;
$url=parse_url($Datos[2]);
$ip = $url['host']; 
$port = $url['port'];
$server = $Datos[0]; // 0 = icecast, 1 = shoutcast, 2 = zaraftp / currengsong
/*
Array ( [scheme] => http [host] => radios.rarserver.net [port] => 8076 )
 print_r(parse_url("http://radios.rarserver.net:8076"));

*/
/* ----- No need to edit below this line ----- */ 
/* ------------------------------------------- */ 

if ($server == 0){
	$posicion = 5;
	$archivo = "GET /status2.xsl HTTP/1.0\r\nUser-Agent: Mozilla-rarcomputacion\r\n\r\n";
}else if ($server == 1){
	$posicion = 6;
	$archivo = "GET /7.html HTTP/1.0\r\nUser-Agent: Mozilla-rarcomputacion\r\n\r\n";
}else{
	
	$posicion = 0;
	$url=parse_url($Datos[1]);
	$ip = $url['host']; 
	if(isset($url['port'])){
		$port = $url['port'];
	}else{
		$port = 80;
	}
	$archivo = "GET ".$url['path']." HTTP/1.0\r\nUser-Agent: Mozilla-rarcomputacion\r\n\r\n";
}

$fp = @fsockopen($ip,$port,$errno,$errstr,3); 
if (!$fp) 
 { 
 echo $Datos[3]; // Diaplays when sever is offline 
 } 
 else 
 { 
 //fputs($fp, "GET /status2.xsl HTTP/1.0\r\nUser-Agent: Mozilla-rarcomputacion\r\n\r\n"); 
 fputs($fp, $archivo); 
 while (!feof($fp)) 
  { 
  $info = fgets($fp); 
  }
 if($server == 0){
 	$info = str_replace('<pre>', "", $info); 
 	$info = str_replace('</pre>', "", $info); 
 }else{
 	$info = str_replace('</body></html>', "", $info); 
 }
 $split = explode(',', $info); 
 
 if (empty($split[$posicion]) ) 
  { 
  echo $Datos[4]; // Diaplays when sever is online but no song title 
  } 
 else 
  { 
  $title = str_replace('\'', '`', $split[$posicion]); 
  $title = str_replace(',', ' ', $title); 
  echo htmlentities(substr($Datos[5]." $title", 0, 36), ENT_QUOTES, "UTF-8"); // Diaplays song 
  } 
 }
?> 
