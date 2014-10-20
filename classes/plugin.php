<?php
include("bootstrapfunc.php");
bootstraphead($pfad);
bootstrapbegin('Terminkalender');
$winwidth=1000;
$winheight=800;
$pluginlink="plugin/phpkalender/index.php";
  echo "            <iframe src='".$pluginlink."' name='Fensterlein' width='".$winwidth."' height='".$winheight."'";
  echo "               align='center' frameborder='0'>";
  echo "               <p>Ihr Browser kann leider keine eingebetteten Frames anzeigen</p>";
  echo "            </iframe>";

bootstrapend();
?>