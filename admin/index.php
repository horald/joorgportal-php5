<?php
echo "<html>";
echo "<head>";
echo "  <meta charset='utf-8'>";
echo "  <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=no'>";
echo "  <title>Joorgsqlite</title>";

//      <!-- Bootstrap -->
echo "  <link href='../includes/bootstrap/css/bootstrap.min.css' rel='stylesheet'>";

echo "</head>";
echo "<body>";
echo "<div>";
echo "<h1 align='center'>Joorgportal (Admin)</h1>";
echo "<a href='../index.php' class='btn btn-default btn-lg btn-block' role='button'>Home</a>"; 
echo "<a href='../classes/showtab.php?menu=menu' class='btn btn-default btn-lg btn-block' role='button'>Menü</a>"; 
echo "<a href='../classes/mksqlstruc.php' class='btn btn-default btn-lg btn-block' role='button'>Make SQL-Struc</a>"; 
echo "<a href='../classes/showtab.php?menu=version' class='btn btn-default btn-lg btn-block' role='button'>Version</a>"; 
echo "</div>";
echo "</body>";
echo "</html>";
?>