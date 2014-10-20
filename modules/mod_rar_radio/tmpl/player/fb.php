<?php 
/**
 * Element: player
 * Crea el Player con adsense, windowsmedia, flash, silverligth
 *
 * @package    rar_radio
 * @version    v0.4
 *
 * @author     Roberto Arias <info@rarcompucion.com>
 * @link       http://www.rarcomputacion.com
 * @copyright  Copyright (C) 2013 RARComputacion.com All Rights Reserved
 * @license    http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
*/
if(isset($_GET['d'])){

require_once('../codifica.php');

	$Datos=base64_url_decode($_GET['d']);
	$Datos = explode(",", $Datos);
	$ancho=$Datos[0];
	$url=$Datos[1];
}	
?>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="facebook" style="z-index:1999" width="100%">	
	<div class="fb-comments" data-href="<?php echo $url; ?>" data-width="<?php echo $ancho -25; ?>" data-num-posts="10"></div>
</div>
</body>
</html>
