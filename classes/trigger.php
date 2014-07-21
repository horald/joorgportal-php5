<?php
$menu = $_GET[menu];
include("../config.php");
include("triggerfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin("Trigger");

$idwert = $_GET[idwert];
$trigger = $_GET['trigger'];
//echo $trigger."=trigger,".$menu."=menu<br>";
  switch ( $trigger )
  {
    case 1:
      echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zur&uumlck</a><br><br>";      triggerinsert($gdbname);
    break;
    case 2:
      cleardbsync();
    break;
    case 3:
      createdbtrigger();
    break;
    case 4:
      $computerid=$_POST['selcomputer'];
      $computerid=3;
      //echo $computerid."=selcomputer<br>";
      dbfilltrigger($menu,$computerid);
    break;
    case 5:
      echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zur&uumlck</a><br><br>";      deletetrigger($idwert);
      //$computerid=3;
      //dbfilltrigger($menu,$computerid);
    break;
    default:
      triggerauswahl($idwert,$menu);
    break;
  }

bootstrapend();

?>