<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');

echo "<h1>".$this->item->bemvindo.(($this->item->category and $this->item->params->get('show_category')) ? (' ('.$this->item->category.')') : '')."</h1>";

$winwidth=1035;
$winheight=680;
$link=$this->item->fldlink;
echo "            <iframe src='".$link."' name='Fensterlein' width='".$winwidth."' height='".$winheight."'";
echo "               align='center' frameborder='0'>";
echo "               <p>Ihr Browser kann leider keine eingebetteten Frames anzeigen</p>";
echo "            </iframe>";

?>
