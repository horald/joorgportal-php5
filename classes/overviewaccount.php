<?php
  include("../config.php");
  include("bootstrapfunc.php");
  bootstraphead();
  bootstrapbegin('Konten&uumlbersicht');

  $overviewaccount = $_GET['overviewaccount'];
  if ($overviewaccount==1) {
  	 $vondatum=$_POST['vondatum'];
  	 $bisdatum=$_POST['bisdatum'];
  } else {	
    $vondatum="2014-01-01";
    $bisdatum="2014-01-31";
  }  

  echo "<form class='form-horizontal' method='post' action='overviewaccount.php?overviewaccount=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  echo "<div>";
  echo "Von Datum: ";
?>
        <input type="Text" id="vondatum" name="vondatum" value="<?php echo $vondatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('vondatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";

  echo "<div>";
  echo "Bis Datum: ";
?>
        <input type="Text" id="bisdatum" name="bisdatum" value="<?php echo $bisdatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('bisdatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";


  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";

  echo "</div>";
  echo "</fieldset>";
  echo "</form>";

  $where=" AND fldDatum>='".$vondatum."' AND fldDatum<='".$bisdatum."'";
  $query="SELECT * FROM tblktobanken WHERE fldcalc='JA'";
  $result = mysql_query($query) or die(mysql_error());  echo "<table class='table table-hover'>";
  echo "<thead>";
  echo "<th width='20px'>Bezeichnung</th>";
  echo "<th width='20px'>Konto</th>";
  echo "</thead>";
  while ($line = mysql_fetch_array($result)) { 
    $qrysum="SELECT sum(fldBetrag) AS summe FROM tblktosal WHERE fldInhaber='".$line['fldBez']."' AND fldDetailind=0".$where;
    $ressum = mysql_query($qrysum) or die(mysql_error());
    $linsum = mysql_fetch_array($ressum);    echo "<tr>";
    echo "<td width='20px'>".$line['fldBez']."</td>";
    echo "<td width='20px' style='text-align:right'>".$linsum['summe']."</td>";
    echo "</tr>";
  }  
  echo "</table>";
  bootstrapend();
?>