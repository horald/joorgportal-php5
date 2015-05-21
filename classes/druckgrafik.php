<?PHP
$menu=$_GET[menu];
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h2>Liste vom ".$datum." - ".$uhrzeit." Uhr</h2>";

echo "<img src='druckgrafikfunc.php?menu=".$menu."' usemap='#druckgrafik' />"; 

echo "</body>";
echo "</html>";
?>