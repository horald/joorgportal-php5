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

$allePC = array(
                    array('Horst-Handy','.','192.168.43.117'),
                    array('Horst-Notebook','horald-Easynote','192.168.0.154'),
                    array('Raspberry pi','raspberrypi','192.168.0.144'),
                    array('Horst-Laptop','.','192.168.0.133'),
                    array('Horst-Desktop','horst-desktop','192.168.0.104'),
                    array('Horst-Rechner','Horst2000','192.168.0.200'),
                    array('Christiane-Handy','.','192.168.43.2')
               );
echo "<table border=1>";
echo "<tr>";
echo "<td>Rechner</td>";
echo "<td>Hostname</td>";
echo "<td>ip</td>";
echo "<td>Status</td>";
echo "</tr>";
foreach($allePC AS $ip) {
  if (fsockopen($ip[2],80, $errno, $errstr, 2)) {
     echo "<tr style='color:green'>";
     echo "<td>".$ip[0]."</td><td>".$ip[1]."</td><td>".$ip[2] . '</td><td>online</td>';
     echo "</tr>";
  } else {
     echo "<tr style='color:red'>";
     echo "<td>".$ip[0]."</td><td>".$ip[1]."</td><td>".$ip[2] . '</td><td>offline</td>';
     echo "</tr>";
  }
}  
echo "</table>"; 


?>
