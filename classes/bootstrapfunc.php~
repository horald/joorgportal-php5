<?php

function bootstraphead($loadbootstrap) {
include("../config.php");
echo "<!DOCTYPE html>";
echo "<html lang='de'>";
echo "<head>";
echo "<meta charset='utf-8'>";
if ($loadbootstrap<>"NO") {
  if ($bootstrapver==3) {
    echo "<link href='../templates/joorgportal30template/css/bootstrap.css' rel='stylesheet'>";

    echo "<link rel='stylesheet' href='../templates/joorgportal30template/bootstrap/css/bootstrap-multiselect.css' type='text/css'/>";
    echo "<link rel='stylesheet' href='../templates/joorgportal30template/bootstrap/css/prettify.css' type='text/css'/>";

    echo "<script type='text/javascript' src='../templates/joorgportal30template/bootstrap/js/bootstrap-multiselect.js'></script>";
    echo "<script type='text/javascript' src='../templates/joorgportal30template/bootstrap/js/prettify.js'></script>";

  } else {	
    echo "<link href='../includes/bootstrap/css/bootstrap.css' rel='stylesheet'>";
  }
  echo "<script src='../includes/bootstrap/js/jquery-latest.js'></script>";
  //echo "<link rel='stylesheet' href='../includes/bootstrap/css/bootstrap.min.css' type='text/css'/>";
}  
echo "<link href='css/jstyle.css' rel='stylesheet'>";

//echo "<script type='text/javascript' src='../includes/bootstrap/js/jquery.min.js'></script>";
//echo "<script type='text/javascript' src='../includes/bootstrap/js/bootstrap.min.js'></script>";
//multiselect
//echo "<script type='text/javascript' src='../includes/bootstrap/js/bootstrap-multiselect.js'></script>";
//echo "<link rel='stylesheet' href='../includes/bootstrap/css/bootstrap-multiselect.css' type='text/css'/>";


echo "<script type='text/javascript' src='../includes/bootstrap/js/bootstrap-datepicker.js' charset='UTF-8'></script>";
echo "<script src='datetimepicker_css.js'></script>";


//fullcalendar
echo "<link href='../includes/fullcalendar/fullcalendar/fullcalendar.css' rel='stylesheet' />";
echo "<link href='../includes/fullcalendar/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />";
echo "<script src='../includes/fullcalendar/lib/jquery.min.js'></script>";
echo "<script src='../includes/fullcalendar/lib/jquery-ui.custom.min.js'></script>";
echo "<script src='../includes/fullcalendar/fullcalendar/fullcalendar.min.js'></script>";
echo "<script src='../includes/fullcalendar/js/jsoncalendar.js'></script>";

echo "<script type='text/javascript' src='../includes/jplayer/jquery.jplayer.min.js'></script>";

echo "<script src='../includes/joorgportal/js/rezept.js'></script>";

echo "<script type='text/javascript'>";
echo "function auswahlkrit(krit) {";
// echo "alert('Auswahl erkannt:' + krit);";

echo "var clickurl = 'update.php?krit='+krit+'&menu=ktogrpzuord&menuid=1243&idwert=23';";
echo "window.location.href = clickurl;";

echo "}";
echo "</script>";


echo "<script type='text/javascript'>";
echo "//<![CDATA[";
echo "$(document).ready(function(){";
echo "    $('#jquery_jplayer_1').jPlayer({";
echo "        ready: function (event) {";
echo "            $(this).jPlayer('setMedia', {";
echo "                mp3:'http://www.wdr.de/wdrlive/media/kiraka.m3u;stream/1'";
echo "            }).jPlayer('play');";
echo "        },";
echo "        swfPath: 'js',";
echo "        supplied: 'mp3',"; 
echo "        wmode: 'window'";
echo "    });";
echo "});";
echo "//]]>";
echo "</script>";

?> 
 
<!-- Initialize the plugin: -->
<script type="text/javascript">
$(document).ready(function() {
$('.multiselect').multiselect();
});
</script>
<?php


echo "</head>";
}

function bootstrapbegin($headline,$showheadline) {
echo "<body>";
echo "<div class='row-fluid'>";
echo "<div class='span12'>";
//if ($showheadline=="true") {
  echo "<legend>".$headline."</legend>";
//}
//echo "<div style='width:1500px; height: 3px; background-color: #eee'; padding-bottom: 3px;></div><br>";
//echo "<div styke='border-bottom: 1px solid #eee;'></div>";
}

function bootstrapend() {
echo "</div>";
echo "</div>";
echo "</body>";
echo "</html>";
}

?>