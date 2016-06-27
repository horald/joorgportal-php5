<?php
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin("Verbrauch");
$id=$_GET['id'];
echo "<a href='../index.php?id=".$id."'  class='btn btn-primary btn-sm active' role='button'>Menü</a> ";
echo "<a href='http://datapass.de' target='_blank'  class='btn btn-primary btn-sm active' role='button'>Datapass</a><br><br> ";

$holverbrauch=$_GET['holverbrauch'];
if ($holverbrauch==1) {
  echo "<img src='verbrauchfunc.php?verbrauch=".$_POST['verbrauch']."&vondatum=".$_POST['vondatum']."' usemap='#verbrauch' />"; 
} else {
  echo "<form class='form-horizontal' method='post' action='verbrauch.php?holverbrauch=1&id=".$id."'>";
//  $defquery="SELECT * FROM tblfilter WHERE fldmaske='".strtoupper($menu)."_DEFAULT' AND fldName='".$arrelement['name']."'";

  $date = time();
//  $day = date('d', $date)-2;
  $mon = date('m', $date)+1;
  $year = date('Y', $date);
  if ($mon>12) {
    $mon="01";
    $year=$year+1;
  }
//  $day="0".$day;
  $day="02";
  $vondatum=$year."-".$mon."-".$day;
?>
        <dd><input type="Text" id="vondatum" name="vondatum" value="<?php echo $vondatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('vondatum','yyyyMMdd','ARROW')" style="cursor:pointer"/></dd>
<?php 
  echo "<dd><input type='text' name='verbrauch' value=''/></dd>";
  echo "<dd><input type='submit' value='Verbrauch senden' /></dd>";
  echo "</form>";
}

bootstrapend();
?>