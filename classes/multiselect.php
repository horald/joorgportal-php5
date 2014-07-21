<?php
include("../config.php");

// <!-- Include Twitter Bootstrap and jQuery: -->
echo "<link rel='stylesheet' href='../includes/bootstrap-multiselect/css/bootstrap-3.1.1.min.css' type='text/css'/>";
echo "<script type='text/javascript' src='../includes/bootstrap-multiselect/js/jquery-2.1.0.min.js'></script>";
echo "<script type='text/javascript' src='../includes/bootstrap-multiselect/js/bootstrap-3.1.1.min.js'></script>";
 
// <!-- Include the plugin's CSS and JS: -->
echo "<script type='text/javascript' src='../includes/bootstrap-multiselect/js/bootstrap-multiselect.js'></script>";
echo "<link rel='stylesheet' href='../includes/bootstrap-multiselect/css/bootstrap-multiselect.css' type='text/css'/>";
echo "<script type='text/javascript' src='../includes/bootstrap-multiselect/js/bootstrap-modal.js'></script>";

echo "<legend>multiselect</legend>";
//<!-- Build your select: -->
echo "<select class='multiselect' multiple='multiple'>";
$fquery = "SELECT * FROM tblktobanken";
$fresult = mysql_query($fquery) or die(mysql_error()." sql004:".$fquery);
while ($fline = mysql_fetch_array($fresult)) {
  $strvalue=$fline['fldBez'];
  echo "<option style='background-color:#c0c0c0;' value='".$strvalue."' >".$strvalue."</option>";
}
echo "</select>";


include("testmodal.php");
//<!-- Button trigger modal -->
echo " <button class='btn btn-primary' data-toggle='modal' data-target='#myModal'>";
echo "  Launch demo modal";
echo "</button>";

?> 
 
<!-- Initialize the plugin: -->
<script type="text/javascript">
$(document).ready(function() {
$('.multiselect').multiselect();
});
</script>
<?php
//end
?>