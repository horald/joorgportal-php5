<?php
include("../config.php");
include("drucketikettenfunc.php");
echo "<html>";
etikettenkopf();
echo "<body>";
etikettendrucken();	
echo "</body></html>";
?>