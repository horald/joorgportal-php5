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
 * @copyright  Copyright (C) 2011-2013 RARComputacion.com All Rights Reserved
 * @license    http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
*/
if(isset($_GET['d'])){

require_once('../codifica.php');


$Datos=base64_url_decode($_GET['d']);
//echo $Datos.'<p />';
//$Datos = parse_str('$Datos');
$Datos = explode(",", $Datos);
//print_r($Datos);
$radio = $Datos[0];
$url = $Datos[1];
$logo = $Datos[2];
$alt = $Datos[4];
$ancho=$Datos[5];
$stream=$Datos[6];
$titulos=$Datos[7];
$titulosURL=$Datos[8];
$text1=$Datos[9];
$text2=$Datos[10];
$text3=$Datos[11];
$d = base64_url_encode($titulos.','.$titulosURL.','.$radio.','.$text1.','.$text2.','.$text3);
$fcactive = $Datos[13];
/*
$radio=base64_url_decode($_GET['radio']);
$url=base64_url_decode($_GET['url']);
$logo=base64_url_decode($_GET['logo']);
$alt=base64_url_decode($_GET['alt']);
$ancho=$_GET['ancho'];
$stream=$_GET['stream'];
*/
?>
<!DOCTYPE HTML>
<html>
<head>
<?php // Scripts?>

<?php if($titulos <> "3"){ ?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script type="text/javascript"> 
function updateNowPlaying(){ 
 $.ajax({ 
  url: "audio.php?d=<?php echo $d; ?>", 
  cache: false, 
  success: function(html){ 
   $("#nowPlaying").html(html); 
  } 
 }); 
} 
updateNowPlaying(); 
setInterval( "updateNowPlaying()", 5000 ); 
</script> 
<?php } ?>

<?php 
	if ($fcactive == "1"){
	//	$ancho -= 10;
// le quitamos &appId=377746422325041
	}
?>	


<?php // CSS ?>
<style type="text/css">
<!--

html,body{height: 100%;}
*{
	/*padding:0;*/
	margin: 0;
	
}

body {

}

#wrap{
	width: <?php echo $ancho; ?>px;
}
.logo, .reproductor, .publicidad, .nowPlaying{
	width: <?php echo $ancho; ?>px;
	float: left;
}

.nowPlaying{
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.fb_iframe_widget iframe {
    left: 0;
}

-->
</style>
</head>
<body>



<div id="wrap" style="z-index:-1999">
		<div class="logo"><img src="<?php echo $url.$logo ?>" alt="<?php echo $alt ?>" /></div>
		<div class="publicidad">
		<?php
			if($Datos[12] == 1){
			//$adcliente = base64_url_decode($_GET['adcliente']);
			$adcliente = $Datos[3];
		?>
		<script type="text/javascript"><!--
			google_ad_client = "<?php echo $adcliente ?>";
			/* 234x60, creado 18/05/09 */
			<?php 
				if ($adcliente == 'pub-6824494942704691'){
					echo 'google_ad_slot ="0976386252";';
				}
			?>
			google_ad_width = 234;
			google_ad_height = 60;
			//-->
		</script>
<center><script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</center>
</div> <!--publicidad -->

<?php


}



}else{
echo 'Error: visite el sitio web de la radio para recargar esta ventana'; 

}
?>
<?php if($titulos != 3){ ?>
	<div id="nowPlaying"></div>
<?php } ?>
<div class="reproductor">
<?php
switch($stream){

case "0":{
?>

<script type="text/javascript" src="<?php echo $url ?>/modules/mod_rar_radio/tmpl/player/swfobject.js"></script> 
<div name="mediaspace" id="mediaspace">Su servidor no soporta flash players o javascripts, use por favor cualquiera de los siguientes links</div> 
<script type="text/javascript">
var so = new SWFObject('<?php echo $url ?>/modules/mod_rar_radio/tmpl/player/player.swf','mpl','<?php echo $ancho ?>','20','9');
so.addParam('allowscriptaccess','always');
so.addParam('allowfullscreen','false');
so.addParam('allownetworking','all');
so.addParam('flashvars','file=<?php echo $radio; ?>?type=flash&type=mp3&showdigits=true&autostart=true');
so.write('mediaspace');
</script>
<?php 
}break;
case "1":{
?>
<!--- Silverligth -->
<script type='text/javascript' src='silverlight.js'></script>
<script type='text/javascript' src='wmvplayer.js'></script>
<div id='container'></div>
<script type='text/javascript'>
 var cnt = document.getElementById('container');
 var src = 'wmvplayer.xaml';
 var cfg = {height:'20',width:'<?php echo $ancho ?>',file:'<?php echo $radio; ?>',autostart:'true',usefullscreen:'false'};
 var ply = new jeroenwijering.Player(cnt,src,cfg);
</script>
<?php 
}break;
case "2":{
?>
<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95"
        id="MediaPlayer" width="<?php echo $ancho ?>" height="50">
      <param name="AudioStream" 			value="1">
      <param name="AutoSize" 			value="0">
      <param name="AutoStart" 			value="1">
      <param name="AnimationAtStart" 		value="0">
      <param name="AllowScan" 			value="1">
      <param name="AllowChangeDisplaySize"          value="0">
      <param name="AutoRewind" 			value="0">
      <param name="Balance" 			value="0">
      <param name="BufferingTime"                   value="5">
      <param name="ClickToPlay" 			value="1">
      <param name="CursorType" 			value="0">
      <param name="CurrentPosition" 		value="1">
      <param name="CurrentMarker"                   value="0">
      <param name="DisplayBackColor" 		value="0">
      <param name="DisplayForeColor" 	 value="16777215">
      <param name="DisplayMode" 			value="0">
      <param name="DisplaySize" 			value="4">
      <param name="Enabled" 			value="1">
      <param name="EnableContextMenu" 		value="1">
      <param name="EnablePositionControls"          value="1">
      <param name="EnableFullScreenControls" 	value="0">
      <param name="EnableTracker"                   value="1">
      <param name="Filename"
         value="<?php echo $radio; ?>">
      <param name="InvokeURLs" 			value="1">
      <param name="Language" 			value="1">
      <param name="Mute"                            value="0">
      <param name="PlayCount" 			value="1">
      <param name="PreviewMode" 			value="0">
      <param name="Rate"                            value="1">
      <param name="SelectionStart"                  value="1">
      <param name="SelectionEnd"                    value="1">
      <param name="SendOpenStateChangeEvents"       value="1">
      <param name="SendWarningEvents" 		value="1">
      <param name="SendErrorEvents" 	        value="1">
      <param name="SendKeyboardEvents" 		value="1">
      <param name="SendMouseClickEvents"            value="1">
      <param name="SendMouseMoveEvents" 		value="1">
      <param name="SendPlayStateChangeEvents" 	value="1">
      <param name="ShowCaptioning"                  value="0">
      <param name="ShowControls"                    value="1">
      <param name="ShowAudioControls" 		value="1">
      <param name="ShowDisplay" 			value="0">
      <param name="ShowGotoBar" 			value="0">
      <param name="ShowPositionControls"            value="0">
      <param name="ShowStatusBar"                   value="1">
      <param name="ShowTracker" 			value="0">
      <param name="TransparentAtStart" 		value="0">
      <param name="VideoBorderWidth" 		value="0">
      <param name="VideoBorderColor" 		value="0">
      <param name="VideoBorder3D"                   value="0">
      <param name="Volume"                       value="-250">
      <param name="WindowlessVideo" 	        value="1">
      <embed width=<?php echo $ancho ?> height=50 autostart="1" type="video/x-ms-asf-plugin"
filename="<?php echo $radio; ?>"
pluginspage="http://www.microsoft.com/windows/mediaplayer/download/default.asp"
controltype=-1 invokeurls=1 animationatstart=0
transparentatstart=0 showstatusbar=1 showpositioncontrol=-1 showtracker=0 audiostream="1" autosize="0" allowscan="1" allowchangedisplaysize="0" autorewind="0" balance="0" bufferingtime="5" clicktoplay="1" cursortype="0" currentposition="1" currentmarker="0" displaybackcolor="0" displayforecolor="16777215" displaymode="0" displaysize="4" enabled="1" enablecontextmenu="1" enablepositioncontrols="1" enablefullscreencontrols="0" enabletracker="1" language="1" mute="0" playcount="1" previewmode="0" rate="1" selectionstart="1" selectionend="1" sendopenstatechangeevents="1" sendwarningevents="1" senderrorevents="1" sendkeyboardevents="1" sendmouseclickevents="1" sendmousemoveevents="1" sendplaystatechangeevents="1" showcaptioning="0" showcontrols="1" showaudiocontrols="1" showdisplay="0" showgotobar="0" showpositioncontrols="0" videoborderwidth="0" videobordercolor="0" videoborder3d="0" volume="-250" windowlessvideo="1"> </embed>
  </object>
<?php 
}break; // end case 2 

case "3":{
?>
<audio src="<?php echo $radio; ?>" autoplay controls="controls" >
<source src="<?php echo $radio; ?>" type="audio/mpeg">
Your browser does not support the audio element. / Su navegador no soporte este elemento de audio
</audio>
<?php 
}break;
} // end swithc 
?>
</div> <!--Reproductor -->
<?php 

if ($fcactive == "1"){
$anchofb = $ancho - 5;
$d = $anchofb.",".$url; 
$d = base64_url_encode($d);
?>
<iframe src="<?php echo $url ?>/modules/mod_rar_radio/tmpl/player/fb.php?d=<?php echo $d ?>" width="<?php echo $anchofb ?>" height="300"></iframe>
<?php
}
?>	
</div><!-- fin de wrap -->
</body>
</html>
