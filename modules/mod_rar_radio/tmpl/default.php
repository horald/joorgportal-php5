<?php
/**
 * Element: default
 * Muestra la imagen en el front-end
 *
 * @package    rar_radio
 * @version    v0.4
 *
 * @author     Roberto Arias <info@rarcompucion.com>
 * @link       http://www.rarcomputacion.com
 * @copyright  Copyright (C) 2011-2013 RARComputacion.com All Rights Reserved
 * @license    http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 */
defined('_JEXEC') or die('Restricted access');
//echo $this->params->get('adcliente');
?>
<dl class="mensaje-module<?php echo $moduleclass_sfx ?>">
<?php
//echo $list ;
/******* Obtener variales de Joomla *********/

$radio = $params->get('ronline');    			// URL del stream
$imagen = $params->get('imagen');				// Imagen Principal
$imagen_alt = $params->get('alt-imagen');		// Alt de la Imagen
$logo = $params->get('logo');						// Logo de la Radio
$logo_alt = $params->get('logo-alt');			// Alt del logo
$ancho =  $params->get('ancho');					// Ancho de la ventana
$alto =  $params->get('alto');					// alto de la ventana
$resize = $params->get('resize');				// se pued redimencionar la ventana
$stream = $params->get('stream'); 				// tipo de streaming 0=mp3, 1=silverligth, 2=windows media, 3=html5
$adsense = $params->get('adsense');				// Si adsense esta activo o no
$adcliente = $params->get('adcliente');			// la cuenta adsense
$titulos = $params->get('Stitulos');			// El tipo de servidor de titulos
$titulosURL = $params->get('StituloTexto');			// URL de donde debe tomar el titulo de cancion
// Comentarios facebook
$fcactive = $params->get('fcactive'); 			// activar comentarios facebook
$fcappid = $params->get('fcappid'); 			// ID de app facebook
$fcweburl = $params->get('fcweburl');			// URl sitio web
$modo=$params->get('modo');				// si es pop up o emdebido.
$autostar=$params->get('autostar');			// iniciar automaticamente reproductor emdebido
if($autostar != "0"){
	$autostart = "true";
}else{
	$autostart = "false";
}
//echo 'dice'.$adcliente;

if ($fcactive == 1){
	$alto+=320;
	//$ancho +=10;
}
if ($adsense == 1) {
	$alto += 80;
} 
if ($stream == 2){
	$alto += 35;
}
if ($stream == 3){
	$alto += 35;
}
if($adsense == ""){
	$adsense=1;
}
if($stream == ""){
	$stream=0;
}

if($titulos != 3){
	$alto += 30;
}
/******* Obtener URL de Joomla *********/

$url= JURI::Base(); // URL de la base del sitio Joomla
$urli = JURI::Base(); // URL de la base del sitio Joomla

/******* Codificacion de variables ********/

require_once('codifica.php');
$text1=JText::_('MOD_RAR_RADIO_OFFAIR');
$text2=JText::_('MOD_RAR_RADIO_NOAVAIBLE');
$text3=JText::_('MOD_RAR_RADIO_LISTEN');
$Datos = $radio.','.$url.','.$logo.','.$adcliente.','.$logo_alt.','.$ancho.','.$stream.','.$titulos.','.$titulosURL.','.$text1.','.$text2.','.$text3.','.$adsense.','.$fcactive;
$Datos = base64_url_encode($Datos);
//echo JText::_('MOD_RAR_RADIO_UPDATE_SUCCESS');
/******* Crear Pop-up *********/ 

if($modo != "0"){
?>

<a href="<?php echo $urli?>/modules/mod_rar_radio/tmpl/player/player.php?d=<?php echo $Datos ?>"  target="popup" onClick="window.open(this.href, this.target, 'width=<?php echo $ancho?>,height=<?php echo $alto?><?php if ($resize == 1) { ?>,resizable=yes,scrollbars=yes<?php }?>'); return false;"><img src="<?php echo $urli.$imagen ?>" alt="<?php echo $imagen_alt?>" border=\"0\" /></a>
<?php
}else{
?>
<div class="logo"><img src="<?php echo $url.$logo ?>" alt="<?php echo $alt ?>" /></div>
<script type="text/javascript" src="<?php echo $url ?>/modules/mod_rar_radio/tmpl/player/swfobject.js"></script> 
<div name="mediaspace" id="mediaspace">Su servidor no soporta flash players o javascripts, use por favor cualquiera de los siguientes links</div> 
<script type="text/javascript">
var so = new SWFObject('<?php echo $url ?>/modules/mod_rar_radio/tmpl/player/player.swf','mpl','100%','20','9');
so.addParam('allowscriptaccess','always');
so.addParam('allowfullscreen','false');
so.addParam('allownetworking','all');
so.addParam('flashvars','file=<?php echo $radio; ?>?type=flash&type=mp3&showdigits=true&autostart=<?php echo $autostar; ?>');
so.write('mediaspace');
</script>
<?php
}
?>

