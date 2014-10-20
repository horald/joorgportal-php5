<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;


//echo "<h1>Willkommen bei <i>".CHtml::encode(Yii::app()->name)."</i></h1>";
echo "<legend>Willkommen bei <i>".CHtml::encode(Yii::app()->name)."</i></legend>";

echo "<div class='row-fluid'>";
echo "<pre>";
echo "<table>";
$version = file_get_contents("/var/www/html".Yii::app()->request->baseUrl."/version.txt");
//$version="unbekannt=".Yii::app()->request->baseUrl;
echo "<tr><td width=150>Version</td><td>: ".$version."</td></tr>";
//echo "<tr><td>Datenbanktyp</td><td>: ".$gdbtyp."</td></tr>";
echo "<tr><td>erstellt f&uumlr</td><td>: <a href='http://codefor.de/koeln/index.html' target='_blank'>codeforgermany</a></td></tr>";
echo "<tr><td>Sourcecode unter</td><td>: <a href='https://github.com/horald/opendataapp' target='_blank'>github:opendataapp</a></td></tr>";
echo "</table>";
echo "</pre>";
echo "</div>";

echo "<div class='row-fluid'>";
echo "<pre>";
echo "Die Listen können nach verschiedenen Kriterien gefiltert werden.<br>";
echo "In der Map werden die gefilterten Listen angezeigt.<br>";
echo "</pre>";
echo "</div>";


?>

