<?php
header("content-type: text/html; charset=utf-8");
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$pdf=$pararray['funcpar'];

echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br>";
$query="SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$idwert;
$result = mysql_query($query) or die(mysql_error()." ".$query);
$line = mysql_fetch_array($result);
//$pdfname=$basepfad."sites/pdf/".$line[fldfilename];
if ($pdf<>"") {
  $pdfname=$line[$pdf];
} else {
  $pdfname=$line[fldfilename];
}  
echo "<div class='alert alert-success'>";
echo "Datei:".$pdfname."<br>";
echo "</div>";

require("ophir.php");

$OPHIR_CONF["footnote"] = 0; //Do not import footnotes
$OPHIR_CONF["annotation"] = 0; //Do not import annotations

$OPHIR_CONF["list"] = 1; //Import lists, but prints them as simple text (no ul or li tags will be generated)
$OPHIR_CONF["link"] = 1; //Import links, but prints them as simple text (only extract text from the links)

/*Available parameters are:
"header", "quote", "list", "table", "footnote", "link", "image", "note", and "annotation"
*/

//echo odt2html($pdfname);

echo '<embed src="'. $pdfname .'#pagemode=none&toolbar=0&scrollbar=0&statusbar=0&navpanes=0" type="application/pdf" width="1024" height="768" />';

bootstrapend();
?>