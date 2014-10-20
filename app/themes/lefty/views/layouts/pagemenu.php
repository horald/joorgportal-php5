<?php

function pagemenu($vaterid) {
  $id = Yii::app()->getRequest()->getQuery('idwert');
  $subid = Yii::app()->getRequest()->getQuery('subid');
//  $id = $this->paramid;
//  echo $id."=id<br>";
  $connection=Yii::app()->db;   // Vorausgesetzt, Sie haben eine "db"-Komponente konfiguriert
  $sql = "SELECT tblmenu_liste.fldindex AS fldmlindex, fldmenu, fldparent, fldart FROM tblmenu_liste, tblmenu_projekt AS mp WHERE fldid_menuprojekt=mp.fldindex AND mp.fldaktiv='J' AND fldview='J' AND fldparent='".$vaterid."' AND fldversion>='0303' ORDER BY fldsort";
  //echo $sql."<br>";
  $command=$connection->createCommand($sql);	
  $dataReader=$command->query();
  $count=0;
  if ($vaterid=='0') {
    echo "<ul class='nav nav-pills nav-stacked'>";
  }
  while(($row=$dataReader->read())!==false) {
    $count=$count+1;
    //echo $row['fldmenu']."#<br>";
    //echo $row['fldart']."<br>";
    $show=true;
    if ($row['fldart']=='USERMENU') {
      $show=!Yii::app()->user->isGuest;
    }
    if ($show) {
      $page=$row['fldmlindex'];
      $parent=$row['fldparent'];
      //echo $parent."=parent<br>"; 
      $qrymod = "SELECT * FROM tblmenu_liste, tblmenu_modul WHERE tblmenu_liste.fldid_modul=tblmenu_modul.fldindex and tblmenu_liste.fldindex=".$page;
      $cmdmod=$connection->createCommand($qrymod);	
      $dataMod=$cmdmod->query();
      $rowmod=$dataMod->read();
      $addr=$rowmod['fldwebadr'];
      //echo $addr."=addr<br>";
      //echo $id.",".$parent.",".$subid."<br>"; 

      if (($id==$parent) or ($vaterid=='0') or ($parent==$subid)) {
      //if ($vaterid==$parent) {
        if ($id == $page) {
          echo "<li class='active'>";
        } else {
          echo "<li>";
        }
        $strich=""; 
        $submenu="no";
        if ($vaterid<>'0') {
          $strich="- ";
          $submenu="yes";
        }
        //echo "pfad=".Yii::app()->request->baseUrl."<br>";
        //echo "pfad=".$_SERVER[1]."<br>";
        echo CHtml::link($strich.$row['fldmenu'], array('site/page', 'view'=>'iframe', 'page'=>'http://localhost/own/joorgportal/'.$addr, 'idwert'=>$page, 'subid'=>$vaterid)); 
        echo "</li>";
      }
      //$step=$step+1;
      pagemenu($page);

    }

  }
  if ($vaterid=='0') {
    echo "</ul>";
  }

}

?>