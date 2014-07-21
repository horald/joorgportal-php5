<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title>Demo: PHP Kalender - PHP / Ajax Kalender</title>
    <script src="js/calendar.js"></script>
  </head>
  <body>
<?PHP
if (!isset($_POST['nMode'])) $nMode = 1; else $nMode = $_POST['nMode'];
if (!isset($_POST['nKW'])) $nKW = date('W'); else $nKW = $_POST['nKW'];
if (!isset($_POST['nJahr'])) $nJahr = date('Y'); else $nJahr = $_POST['nJahr'];
if (!isset($_POST['nBreite'])) $nBreite = '800'; else $nBreite = $_POST['nBreite'];
if (!isset($_POST['nHoehe'])) $nHoehe = '450'; else $nHoehe = $_POST['nHoehe'];
if (!isset($_POST['nAnzZeilenProStunde'])) $nAnzZeilenProStunde = 2; else $nAnzZeilenProStunde = $_POST['nAnzZeilenProStunde'];
if (!isset($_POST['nZeilenHoehe'])) $nZeilenHoehe = 20; else $nZeilenHoehe = $_POST['nZeilenHoehe'];
if (!isset($_POST['bDisplayArbeitszeit'])) $bDisplayArbeitszeit = true; else $bDisplayArbeitszeit = $_POST['bDisplayArbeitszeit'];
if (!isset($_POST['nDisplayStundenVon'])) $nDisplayStundenVon = 6; else $nDisplayStundenVon = $_POST['nDisplayStundenVon'];
if (!isset($_POST['nDisplayStundenBis'])) $nDisplayStundenBis = 22; else $nDisplayStundenBis = $_POST['nDisplayStundenBis'];
if (!isset($_POST['nArbeitszeitVon'])) $nArbeitszeitVon = 8; else $nArbeitszeitVon = $_POST['nArbeitszeitVon'];
if (!isset($_POST['nArbeitszeitBis'])) $nArbeitszeitBis = 17; else $nArbeitszeitBis = $_POST['nArbeitszeitBis'];


include('connection.php');
include('calendar.php');


$objCalendar = new calendar();

$objCalendar->setMode($nMode);
$objCalendar->setKW($nKW, $nJahr);
$objCalendar->setCalenderBreite($nBreite);
$objCalendar->setCalenderHoehe($nHoehe);
$objCalendar->setAnzZeilenProStunde($nAnzZeilenProStunde);
$objCalendar->setZeilenHoehe($nZeilenHoehe);
$objCalendar->showArbeitszeit($bDisplayArbeitszeit);
$objCalendar->setStunden($nDisplayStundenVon,$nDisplayStundenBis);
$objCalendar->setArbeitszeit($nArbeitszeitVon, $nArbeitszeitBis);


echo "<div style='margin-bottom:10px;'>";
  // echo "<a href='http://www.php-kalender.de'><img src='http://www.php-kalender.de/fileadmin/template/images/logo.gif' alt='PHP-Kalender' style='margin-bottom:15px;' border='0'></a>";
  echo "<br />";
  echo "<input type='button' name='zurueck' value='<<' onclick='nKW = nKW - 1;  refreshCalender(); '> &nbsp;"; 
  echo "<input type='button' name='weiter' value='>>' onclick='nKW = nKW + 1; refreshCalender()'> &nbsp;  &nbsp;"; 
  echo "<input type='button' name='newTermin' value='neuen Termin anlegen' onclick='alert('Markiere dafür den gewünschten Zeitraum mit Drag und Drop in dem Kalender!')'> &nbsp;"; 
  //echo "<input type='button' name='newTermin' onclick='$('kalenderSettings').show(); return false;' value='Kalender-Einstellungen anzeigen / &auml;ndern' onclick=''>";
echo "</div>";
?>
<style>
  #kalenderSettings td {
    text-align:right;
    font-size:12px;
    font-weight:bold;
  }
</style>

<div id="kalenderSettings" style="display:none; border:1px solid #A0A0A0; background-color:#ECE9D8; padding:4px; margin-top:20px; margin-bottom:20px; width:530px; font-size:12px;">
  <div style="margin-bottom:5px;">
    Hier kannst du die Einstellungen der Kalender´s &auml;ndern:
  </div>
  <table style="font-size:12px;">
    <form method="POST" action="<?PHP echo $_SERVER['PHP_SELF']; ?>">
    <tr>
      <td valign="top">
        <table>         
           <tr>
             <td>Mode:</td>
             <td><input type="text" name="nMode" value="<?PHP echo $nMode; ?>"></td>
           </tr>
          <tr>
             <td>KW:</td>
             <td><input type="text" name="nKW" value="<?PHP echo $nKW; ?>"></td>
           </tr>     
          <tr>
             <td>Jahr:</td>
             <td><input type="text" name="nJahr" value="<?PHP echo $nJahr; ?>"></td>
           </tr>      
           <tr>
             <td>Breite:</td>
             <td><input type="text" name="nBreite" value="<?PHP echo $nBreite; ?>"></td>
           </tr>  
           <tr>
             <td>Hoehe:</td>
             <td><input type="text" name="nHoehe" value="<?PHP echo $nHoehe; ?>"></td>
           </tr>       
           <tr>
             <td>Zeilen pro Stunde:</td>
             <td><input type="text" name="nAnzZeilenProStunde" value="<?PHP echo $nAnzZeilenProStunde; ?>"></td>
           </tr>      
         </table> 
      </td>
      
      <td valign="top">
        <table>
          <tr>
             <td>Zeilenhoehe:</td>
             <td><input type="text" name="nZeilenHoehe" value="<?PHP echo $nZeilenHoehe; ?>"></td>
           </tr>       
          <tr>
             <td>Zeige Arbeitszeit:</td>
             <td><input type="text" name="bDisplayArbeitszeit" value="<?PHP echo $bDisplayArbeitszeit; ?>"></td>
           </tr>      
           <tr>
             <td>Stunden von:</td>
             <td><input type="text" name="nDisplayStundenVon" value="<?PHP echo $nDisplayStundenVon; ?>"></td>
           </tr>  
           <tr>
             <td>Stunden bis:</td>
             <td><input type="text" name="nDisplayStundenBis" value="<?PHP echo $nDisplayStundenBis; ?>"></td>
           </tr>   
           <tr>
             <td>Arbeitszeit von:</td>
             <td><input type="text" name="nArbeitszeitVon" value="<?PHP echo $nArbeitszeitVon; ?>"></td>
           </tr>  
           <tr>
             <td>Arbeitszeit bis:</td>
             <td><input type="text" name="nArbeitszeitBis" value="<?PHP echo $nArbeitszeitBis; ?>"></td>
           </tr>    
        </table>  
      </td>    
    </tr>
    <tr>
      <td colspan="2" style="text-align:right"><button onclick="$('kalenderSettings').hide(); return false;">Abbrechen</button> &nbsp; <input type="submit" value="Einstellungen &auml;ndern"></td>
    </tr>
    </form>    
  </table> 
</div>

<?PHP

$objCalendar->init();

?>
</div>
  </body>
</html>
<?PHP


//mysql_query("delete from event where nlfdevent = 345");
mysql_close($con);
?>