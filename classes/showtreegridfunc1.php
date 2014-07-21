<?php

function showzeile($treeMenu,$vaterid) {
  $query = "SELECT * FROM tbldocman_brfverkehr WHERE fldparent='".$vaterid."'";
  $result = mysql_query($query) or die(mysql_error());

  while ($line = mysql_fetch_array($result)) {

    $page=$line['fldindex'];
    $qrymod = "SELECT * FROM tbldocman_brfverkehr WHERE fldindex='".$page."'";
    $resmod = mysql_query($qrymod) or die(mysql_error());
    $linmod = mysql_fetch_array($resmod);
    $addr=$linmod['fldbez'];

    $newnode = $treeMenu->AddNode($line['fldbez'],$addr);
    showzeile($newnode,$line['fldindex']);

  }
}

function showtreegrid() {
  include("../config.php");
  include("bootstrapfunc.php");
  include("treeview.php");
  bootstraphead();
  $bez="Tree";
  bootstrapbegin($bez);

  $treeMenu = new TreeMenu();
  $treeMenu->SetPath("../");
  $treeMenu->SetStyle("joomtree");

  showzeile($treeMenu,0);
  //$newnode = $treeMenu->AddNode("Test1","Link");
  //$newnode = $treeMenu->AddNode("Test2","Link");

   
  $treeMenu->Debug(false);
  ## *** set form submission type: "get" or "post"
  $treeMenu->SetSubmissionType("post");

  $treeMenu->Display();
  bootstrapend();
}
?>