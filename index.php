<?php
include("config.php");
include("menu.php");

function startmenu() {
    require_once("treemenu.class.php");

    // create TreeMenu object
    $treeMenu = new TreeMenu();
    $treeMenu->SetStyle("joomportal");
    $treeMenu->SetCaption("Navigation");

    page_menu($treeMenu,'0');
    mysql_close();

    $treeMenu->Debug(false);
    ## *** set form submission type: "get" or "post"
    $treeMenu->SetSubmissionType("post");

    $treeMenu->Display();
}

function startinstall() {
  echo "<form name='eingabe' method='post' action='install.php'>";
  echo "<table>";
  echo "<tr><td><h2>Installation</h2></td></tr>";
  echo "<tr>";
  echo "<td>Select language: </td>";
  echo "<td>";
  echo "<select size='1' name='sprache'>";
  echo "<option style='background-color:#c0c0c0;' Value='english' selected>english</option>";
  echo "<option style='background-color:#c0c0c0;' Value='german' selected>german</option>";
  echo "</select>";
  echo "</td>";
  echo "</tr>";
  echo "</table>";
  echo "<input type='submit' name='button' value=' OK '>";
  echo "</form>";
}

function showhead() {
    echo "    <!DOCTYPE html>";
    echo "    <html>";
    echo "    <head>";
    echo "    <title>Joorgportal</title>";
    echo "    <!-- Bootstrap -->";
    echo "    <link href='includes/bootstrap/css/bootstrap.min.css' rel='stylesheet' media='screen'>";
    echo "    <link href='includes/bootstrap/css/bootstrap.datepicker.css' rel='stylesheet' media='screen'>";
    echo "    </head>";
    echo "    <body>";
    echo "    <script src='includes/bootstrap/js/jquery-latest.js'></script>";
    echo "    <script src='includes/bootstrap/js/bootstrap.min.js'></script>";
    echo "    <script src='includes/bootstrap/js/bootstrap-datepicker.js'>";
    echo "	  </script>";
}

function showfoot() {
    echo "    </body>";
    echo "    </html>";
}

function startseite() {

  $dbFile="config.php";
  if (filesize($dbFile) == 0 ) {
    startinstall(); 
  } else {
    $dbFile="update".$updvers.".sql";
    if (filesize($dbFile) != 0 ) {
      echo "Update gefunden!<br>";
      include("updatewp.php");
    } else {
      showhead();
      startmenu();
      showfoot();
    }  
  }  

}

startseite();

?>
