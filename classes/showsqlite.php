<?php
echo "sqlite<br>";

//$db = new SQLite3('dbjoorgportal312.db');
$db = new SQLite3('/var/www/html/daten/sqlite/dbjoorgportal312');

$results = $db->query('SELECT * FROM tblfahrtenbuch');
echo "<table>";
while ($row = $results->fetchArray()) {
    //var_dump($row);
    echo "<tr>";
    echo "<td>".$row['flddatum']."</td>";
    echo "<td>".$row['fldvonkm']."</td>";
    echo "<td>".$row['fldbiskm']."</td>";
    echo "<td>".$row['fldfahrzeug']."</td>";
    echo "<td>".$row['fldzeitpreis']."</td>";
    echo "<td>".$row['fldflddauer']."</td>";
    echo "<tr>";
}
echo "</table>";

?>