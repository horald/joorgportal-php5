<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - iframe';
$this->breadcrumbs=array(
	'iframe',
);

$page = Yii::app()->getRequest()->getQuery('page');
//echo $page . "<br>";
echo "<iframe width=1200 height=800 src='".$page."'>";
echo "</iframe>";

?>
