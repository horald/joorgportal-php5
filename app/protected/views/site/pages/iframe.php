<?php
/* @var $this SiteController */

//$this->pageTitle=Yii::app()->name . ' - iframe';
$this->pageTitle=Yii::app()->name;
$this->breadcrumbs=array(
	'iframe',
);
//include("../../../../../config.php");
$winheight=330;
echo "iframe<br>";

$page = Yii::app()->getRequest()->getQuery('page');
//echo Yii::app()->getRequest()->getAction() . "<br>";
//echo "<legend>Titel</legend>";
echo "<iframe width=1200 height=".$winheight." src='".$page."'>";
echo "</iframe>";

?>
