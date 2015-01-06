<?php

function page_menu($treeMenu,$vaterid) {
  $connection=Yii::app()->db;   // Vorausgesetzt, Sie haben eine "db"-Komponente konfiguriert
  $query = "SELECT * FROM tblmenu_liste WHERE fldview='J' AND fldparent='".$vaterid."' AND fldversion='0303' ORDER BY fldSort";
//  $result = mysql_query($query) or die(mysql_error());
  $command=$connection->createCommand($query);	
  $dataReader=$command->query();

//  while ($line = mysql_fetch_array($result)) {
  while(($line=$dataReader->read())!==false) {

    $page=$line['fldIndex'];
    $qrymod = "SELECT * FROM tblmenu_liste, tblmenu_modul WHERE tblmenu_liste.fldid_modul=tblmenu_modul.fldindex and tblmenu_liste.fldIndex='".$page."'";
    //$resmod = mysql_query($qrymod) or die(mysql_error());
    //$linmod = mysql_fetch_array($resmod);
    //$conn2=Yii::app()->db;   // Vorausgesetzt, Sie haben eine "db"-Komponente konfiguriert
    $resmod=$connection->createCommand($qrymod);	
    $datmod=$resmod->query();
    $linmod=$datmod->read();
    $addr=$linmod['fldwebadr'];
    //$addr="#";
    $inpos=strpos($addr,'?');
    if ($inpos>0) {
      $addr=$addr."&idwert=".$page;
    }

    $newnode = $treeMenu->AddNode($line['fldMenu'],$addr);
    page_menu($newnode,$line['fldIndex']);

  }
}

?>