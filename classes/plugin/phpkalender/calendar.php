<?PHP
class calendar {
	private $sIdentNumber;
	
	private $nCalendarBreite;
	private $nCalendarHoehe;
	
	private $nAnzZeilenProStunde;
	private $nZeilenHoehe;
	private $nMode;
	private $nTage;
	
	private $nKW;
	private $nJahr;
	
	private $aTage = array();
	
	private $aEvent = array();
	
	private $nDisplayStundenVon;
	private $nDisplayStundenBis;
	
	private $bDisplayArbeitszeit;
	private $nArbeitszeitVon;
	private $nArbeitszeitBis;
	private $aArbeitsTage = array();
	
	private $aGeprueft = array();
	private $aZusammen = array();

	public function setCalenderBreite($nBreite) {
		$this->nCalendarBreite = $nBreite;
	}
	
	public function setCalenderHoehe($nHoehe) {
		$this->nCalendarHoehe = $nHoehe;
	}		
	
	public function setAnzZeilenProStunde($nZeilen) {
		$this->nAnzZeilenProStunde = intval($nZeilen);
	}	
	
	private function setAnzTage($nTage) {
		$this->nTage =  intval($nTage);
	}		
	
	public function getDays() {
		return $this->aTage;
	}
	
	public function setKW($nKW, $nJahr) {
		$this->nJahr =  intval($nJahr);
		$this->nKW   =  intval($nKW);
		$this->setDays();
	}
	
	public function setZeilenHoehe($nZeilenHoehe) {
		$this->nZeilenHoehe = $nZeilenHoehe;
	}	
	
	public function showArbeitszeit($bShow) {
		$this->bDisplayArbeitszeit = (bool) $bShow;
	}		
	
	public function setArbeitszeit($nVon, $nBis) {
		$this->nArbeitszeitVon =  intval($nVon);
		$this->nArbeitszeitBis =  intval($nBis);
	}			
	
	public function setArbeitstage($aArbeitstage) {
		$this->aArbeitsTage = $aArbeitstage;
	}		
	
	/**
	 * 1 = ganze Woche (Mo-So); 2 = Arbeitswoche (Mo-Fr);
	 *
	 * @param int $nMode
	 * @param date $dtVon (DD.MM.YYYY)
	 * @param date $dtBis (DD.MM.YYYY)
	 */
	public function setMode($nMode) {
		$this->nMode =  intval($nMode);
		if ($nMode==1) {
			$this->nTage = 7;
		}
		elseif ($nMode==2) {
			$this->nTage = 5;
		}
	}		
	
	public function setStunden($nVon, $nBis) {
		$this->nDisplayStundenVon =  intval($nVon);
		$this->nDisplayStundenBis =  intval($nBis);
	}		
	
	private function setDefaultSettings() {
		$this->setCalenderBreite('100%');
		$this->setCalenderHoehe(false);
		$this->setAnzZeilenProStunde(2);
		$this->setZeilenHoehe(20);
		$this->setMode(1);
		$this->setKW(date('W', mktime()), date('Y', mktime()));
		$this->setStunden(0, 23);
		$this->setArbeitszeit(8, 17);
		$this->showArbeitszeit(false);
		$this->setArbeitstage(array('Mon', 'Tue', 'Wed', 'Thu', 'Fri'));
	}
	
	public function __construct() {
		$this->setDefaultSettings();
		if ($_COOKIE['phpkalender_identid']) {
			$this->sIdentNumber = $_COOKIE['phpkalender_identid'];
		}
		else {
			$this->sIdentNumber = time();
			//setcookie("phpkalender_identid", $this->sIdentNumber);
		}
	}
	
	private function getFirstDayOfWeek($year, $weeknr) {
		$offset = date('w', mktime(0,0,0,1,1,$year));
		$offset = ($offset < 5) ? 1-$offset : 8-$offset;
		$monday = mktime(0,0,0,1,1+$offset,$year);
		return strtotime('+' . ($weeknr - 1) . 'weeks', $monday);
	}	
	
	/**
	 * Der Typ bestimmt, ob Start oder EndZeile gemeint ist 
	 *
	 * @param unknown_type $nTime
	 * @param unknown_type $nTyp
	 */
	private function getZeile($nTime, $nTyp) {
		$nMinute = substr($nTime, 2, 2);
		$nStunde = substr($nTime, 0, 2);
		
		$nReturn  = NULL;
		$nDivisor = 60/$this->nAnzZeilenProStunde;
		
		$nErgebnisGenau = $nMinute/floor($nDivisor);
		
		if(strpos($nErgebnisGenau, '.')) {
			$nZeile = ceil($nErgebnisGenau);
		}
		else {
			if ($nTyp==0) {
				$nStunde = (int) $nStunde;
			  $nZeile  = (int) $nErgebnisGenau + 1;
			} else{
				$nZeile = (int) $nErgebnisGenau;
				if ($nZeile==0) {
					$nStunde = (int) ($nStunde - 1);
					$nZeile  = $this->nAnzZeilenProStunde;
				}
				else {
					$nStunde = (int) $nStunde;
				}
			}
		}				
		return (int) $nStunde.'.'. (int) $nZeile;
	}
  
	private function getTopPositionFromEvent($nStart) {
		$aPos = explode('.', (string) $nStart);
		$nTop = $aPos[0]*$this->nZeilenHoehe*$this->nAnzZeilenProStunde;
		$nTop = $nTop + (($aPos[1]*$this->nZeilenHoehe)-$this->nZeilenHoehe);
		$nTop = $nTop - ($this->nDisplayStundenVon*$this->nZeilenHoehe*$this->nAnzZeilenProStunde);
		return $nTop;
	}
	
	private function getIndexFromDay($dtDatum) {
		for ($i=1; $i<=$this->nTage; $i++) {
			if ($this->aTage[$i]['datum']==$dtDatum) {
				return $i;
			}
		}
	}
	
	private function replaceDayDesc($sDesc) {
		$sReturn = str_replace('Sun', 'Sonntag', str_replace('Sat', 'Samstag', str_replace('Fri', 'Freitag', str_replace('Thu', 'Donnerstag', str_replace('Wed', 'Mittwoch', str_replace('Tue', 'Dienstag', str_replace('Mon', 'Montag', $sDesc)))))));
	  return $sReturn;
	}
	
	private function setDays() {
		$nKW    = $this->nKW;
		$nJahr  = $this->nJahr;
		$nStart = $this->getFirstDayOfWeek($nJahr, $nKW);
		
		for ($i=1; $i<=$this->nTage; $i++) {
			$nAktuell = $nStart + (60*60*24*($i-1));
			$this->aTage[$i]['timestamp']  = $nAktuell;
			$this->aTage[$i]['datum']      = date('Ymd', $nAktuell);
			$this->aTage[$i]['formatiert'] = date('d.m.Y', $nAktuell);
			$this->aTage[$i]['mysql']      = date('Y-d-m', $nAktuell).' 00:00:00';
			$this->aTage[$i]['kuerzel']    = date('D', $nAktuell);
			$this->aTage[$i]['bez']        = $this->replaceDayDesc(date('D', $nAktuell));
		}
	}
	
	private function setSpaltenanzahl() {
		$this->aZusammen = array();
		$this->aGeprueft = array();
		$sSql = "select nlfdevent 
		         from   event 
		         where  UNIX_TIMESTAMP(dtvon) >= ".$this->aTage[1]['timestamp']."
					   and    UNIX_TIMESTAMP(dtbis) <= ".($this->aTage[$this->nTage]['timestamp']+(24*60*60))."
					   and    date_format(dtvon, '%k') >= ".$this->nDisplayStundenVon."
					   and    date_format(dtbis, '%k') <= ".($this->nDisplayStundenBis+1)." 
					   and    dtvon < dtbis "; 
		         
		$result = mysql_query($sSql);
		while ($row = mysql_fetch_assoc($result)) {
			$this->aZusammen = array();
			if (!in_array($row['nlfdevent'], $this->aGeprueft)) {
			  $this->getEventZusammenhang($row['nlfdevent']);
				$sInString = implode(', ', array_unique($this->aZusammen));	  
				$sSql3 = "select max(nanz) nanz from  (
									                       SELECT count(*) nanz, szelle
									                       FROM            temp
									                       WHERE           szelle IN (
									                                                 SELECT t1.*
									                                                 FROM   (
									                                                        SELECT szelle
									                                                        FROM   temp
									                                                        WHERE  nlfdevent in (".$sInString.")
									                                                        )t1
									                                                 )                     
									                       and             ndatum      = (select date_format(dtvon, '%Y%m%d') from event where nlfdevent = ".$row['nlfdevent'].")
									                       and             nidentid    = ".$this->sIdentNumber."
									                       group by szelle
									                      ) t2";		
				$result3 = mysql_query($sSql3);
				while ($row3 = @mysql_fetch_assoc($result3)) {
					$sSql2 = "update temp set nanzspalten = ".$row3['nanz']." where nlfdevent in (".$sInString.")";
					mysql_query($sSql2);
				}
			}
		}
	}
	
	private function getEventZusammenhang($nLfdEvent) {
		array_push($this->aGeprueft, $nLfdEvent);
		$sSql = " SELECT DISTINCT nlfdevent
							FROM            temp
							WHERE           szelle IN (
										  SELECT t1.*
										  FROM   (
										         SELECT szelle
										         FROM   temp
										         WHERE  nlfdevent = ".$nLfdEvent."
										         )t1
							                          )                    
							and             ndatum      = (select date_format(dtvon, '%Y%m%d') from event where nlfdevent = ".$nLfdEvent.")
							and             nidentid    = ".$this->sIdentNumber." ";
		$result = mysql_query($sSql);
		while ($row = mysql_fetch_assoc($result)) {
			if (!in_array($row['nlfdevent'], $this->aZusammen)) {
				array_push($this->aZusammen, (int) $nLfdEvent);
			}
			if (!in_array($row['nlfdevent'], $this->aGeprueft)) {
				$this->getEventZusammenhang($row['nlfdevent']);
			}
		}
	}
	
	private function getHeightFromEvent($nEnde, $nTop) {
		$aPos    = explode('.', (string) $nEnde);
		$nBottom = $aPos[0]*$this->nZeilenHoehe*$this->nAnzZeilenProStunde;
		$nBottom = $nBottom + $aPos[1]*$this->nZeilenHoehe;
		$nBottom = $nBottom - ($this->nDisplayStundenVon*$this->nZeilenHoehe*$this->nAnzZeilenProStunde);
		$nHeight = $nBottom - $nTop;
		
		return $nHeight;
	}
	
	public function updateEvent($nId, $aColumns) {
		$sSql = " update event set ";
		foreach ($aColumns as $key => $value) {
			$sSql.= $key." = '".strip_tags($value)."', ";
		}
		$sSql.= " nlfdevent = ". intval($nId);
		$sSql.= " where  nlfdevent = ".intval($nId);
		mysql_query($sSql);
	}
	
	public function removeEvent($nId) {
		$sSql = "delete from event
		         where  nlfdevent = ".intval($nId);
		mysql_query($sSql);
	}
	
	public function addEvent($sBez, $sBesch, $dtVon, $dtBis, $sColor) {
	  if ($dtVon<$dtBis && substr($dtVon,0,10) == substr($dtBis,0,10)) {
  		$sSql = "insert into event (
  		           seventbez,
  		           seventbeschreibung,
  		           dtvon,
  		           dtbis,
  		           scolor
  		         ) values (
  		           '".strip_tags($sBez)."',
  		           '".strip_tags($sBesch)."',
  		           '".strip_tags($dtVon)."',
  		           '".strip_tags($dtBis)."',
  		           '".strip_tags($sColor)."'
  		         )";
  		mysql_query($sSql);
	  }
		return mysql_insert_id();
	}
	
	public function getEventDetails($nId) {
		$sSql = " select nlfdevent, 
		                 seventbez,
							       UNIX_TIMESTAMP(dtvon) dtvontimestamp, 
							       date_format( dtvon, '%H:%i' ) dtvon, 
							       date_format( dtvon, '%Y-%m-%d' ) datum, 
							       date_format( dtvon, '%Y%m%d' ) stagvon, 
							       date_format( dtvon, '%H%i' ) suhrzeitvon, 
							       date_format( dtbis, '%H:%i' ) dtbis, 
							       date_format( dtbis, '%Y%m%d' ) stagbis, 
							       date_format( dtbis, '%H%i' ) suhrzeitbis, 
							       date_format( dtvon, '%d' ) tag, 
							       date_format( dtvon, '%m' ) monat, 
							       date_format( dtvon, '%Y' ) jahr, 
							       scolor
							from   event
							where  nlfdevent = ".$nId." ";
		$result = mysql_query($sSql);
		while ($row = mysql_fetch_assoc($result)) {
			$aEvent = array();
			$aEvent['id']      = $row['nlfdevent'];
			$aEvent['datum']   = $row['datum'];
			$aEvent['tag']     = $row['tag'];
			$aEvent['monat']   = $row['monat'];
			$aEvent['jahr']    = $row['jahr'];
			$aEvent['dtDatum'] = $row['stagvon'];
			$aEvent['dtStart'] = $row['suhrzeitvon'];
			$aEvent['dtEnde']  = $row['suhrzeitbis'];			
			$aEvent['sColor']  = $row['scolor'];			
			$aEvent['dtVon']   = $row['dtvon'];			
			$aEvent['dtBis']   = $row['dtbis'];			
			$aEvent['bez']     = $row['seventbez'];			
			$aEvent['timest']  = $row['dtvontimestamp'];			
		}
		mysql_free_result($result);	
		
		return $aEvent;	
	}
	
	private function getEvents() {	
		@mysql_query("delete from temp where nidentid = ".$this->sIdentNumber);
		
		$sSql = " select nlfdevent, 
		                 seventbez,
							       UNIX_TIMESTAMP(dtvon) dtvontimestamp, 
							       date_format( dtvon, '%H:%i' ) dtvon, 
							       date_format( dtvon, '%Y%m%d' ) stagvon, 
							       date_format( dtvon, '%H%i' ) suhrzeitvon, 
							       date_format( dtbis, '%H:%i' ) dtbis, 
							       date_format( dtbis, '%Y%m%d' ) stagbis, 
							       date_format( dtbis, '%H%i' ) suhrzeitbis, 
							       scolor
							from   event
							where  UNIX_TIMESTAMP(dtvon) >= ".$this->aTage[1]['timestamp']."
						  and    UNIX_TIMESTAMP(dtbis) <= ".($this->aTage[$this->nTage]['timestamp']+(24*60*60))."
						  and    date_format(dtvon, '%k') >= ".$this->nDisplayStundenVon."
						  and    date_format(dtbis, '%k') <= ".($this->nDisplayStundenBis+1)." 
						  and    dtvon < dtbis
							order by dtvon asc, (dtbis - dtvon) desc ";

		$result = mysql_query($sSql);
		while ($row = mysql_fetch_assoc($result)) {
			$nIndex    = $this->getIndexFromDay($row['stagvon']);
			if (!is_array($this->aEvent[$nIndex])) {
				$this->aEvent[$nIndex] = array();
			}
			$aEventAkt = array();
			$aEventAkt['id']      = $row['nlfdevent'];
			$aEventAkt['dtDatum'] = $row['stagvon'];
			$aEventAkt['dtStart'] = $row['suhrzeitvon'];
			$aEventAkt['dtEnde']  = $row['suhrzeitbis'];
			$aEventAkt['nStart']  = $this->getZeile($aEventAkt['dtStart'], 0);
			$aEventAkt['nEnde']   = $this->getZeile($aEventAkt['dtEnde'], 1);
			$aEventAkt['nTop']    = $this->getTopPositionFromEvent($aEventAkt['nStart']);
			$aEventAkt['nHeight'] = $this->getHeightFromEvent($aEventAkt['nEnde'], $aEventAkt['nTop']);			
			$aEventAkt['sColor']  = $row['scolor'];			
			$aEventAkt['dtVon']   = $row['dtvon'];			
			$aEventAkt['dtBis']   = $row['dtbis'];			
			$aEventAkt['bez']     = $row['seventbez'];			
			$aEventAkt['timest']  = $row['dtvontimestamp'];			
			array_push($this->aEvent[$nIndex], $aEventAkt);
		}
		mysql_free_result($result);
		
		
		for ($t=1; $t<=$this->nTage; $t++) {
			if (is_array($this->aEvent[$t])) {
				for ($y=0; $y<count($this->aEvent[$t]); $y++) {
					$aStart = explode('.', $this->aEvent[$t][$y]['nStart']);
					$aEnde  = explode('.', $this->aEvent[$t][$y]['nEnde']);
					
					$nStart = $aStart[0].$aStart[1];
					$nEnde  = $aEnde[0].$aemde[1];
					
					for ($i=$aStart[0]; $i<=$aEnde[0]; $i++) {
						for ($x=1; $x<=$this->nAnzZeilenProStunde; $x++) {
							$nPosAkt = $i.$x;
							if (($x>=$aStart[1] && $i==$aStart[0]) || ($i<$aEnde[0] && $i!=$aStart[0]) || ($i==$aEnde[0] && $x<=$aEnde[1])) {
								$nAktuell = ($i.str_pad($x, 5, '0', STR_PAD_LEFT));
								$nMax     = intval($aEnde[0].str_pad($aEnde[1], 5, '0', STR_PAD_LEFT));
								$nMin     = ($aStart[0].str_pad($aStart[1], 5, '0', STR_PAD_LEFT));
								if (intval($nAktuell)>=intval ($nMin) && intval ($nAktuell)<= intval ($nMax)) {
									$sSql = "insert into temp (
									           nidentid,
									           nlfdevent,
									           szelle,
									           nanzbelegt,
									           ndatum
									         ) values (
									           '".$this->sIdentNumber."',
									           '".$this->aEvent[$t][$y]['id']."',
									           '".$i.".".$x."',
									           '0',
									           '".$this->aEvent[$t][$y]['dtDatum']."'
									         )";
									@mysql_query($sSql);								
								}
							}
						}
					}						
					
				}
			}
		}
		
		$this->setSpaltenanzahl();
				
		for ($t=1; $t<=$this->nTage; $t++) {
			if (is_array($this->aEvent[$t])) {
				for ($y=0; $y<count($this->aEvent[$t]); $y++) {
					$sSql = "select distinct nanzspalten from temp where nlfdevent = ".$this->aEvent[$t][$y]['id'];
					$result = mysql_query($sSql);
					while ($row = mysql_fetch_assoc($result)) {
						$nAnzspalten = $row['nanzspalten'];
						$nWidth      = floor(100 / $row['nanzspalten']);
					}
					mysql_free_result($result);
					
					$sSql = NULL;
					// Bau neues SQL für Pos zusammen 
					for ($i=1; $i<=$nAnzspalten; $i++) {
						if ($i!=1) {
							$sSql .= "union all ";					         
						}
						$sSql .= "(select count(*) nbelegt, ".$i." npos from temp where nidentid = ".$this->sIdentNumber." and szelle in (SELECT t1.* from (select szelle from temp where nlfdevent = ".$this->aEvent[$t][$y]['id'].") t1) and nposbelegt = ".$i." and ndatum = ".$this->aEvent[$t][$y]['dtDatum'].") ";
					}
					$sSql .= "order by 1,2 limit 1 ";
					
					$result = mysql_query($sSql);
					while ($row = mysql_fetch_assoc($result)) {
						$nPos   = $row['npos'];
						$nLeft  = ($nPos-1)*$nWidth;
					}
					@mysql_free_result($result);
					
		      $this->aEvent[$t][$y]['nWidth'] = $nWidth.'%';			
		      $this->aEvent[$t][$y]['nLeft'] = $nLeft.'%';	
		      
		      $sSql = "update temp set nposbelegt = ".$nPos." where nlfdevent = ".$this->aEvent[$t][$y]['id'];
		      @mysql_query($sSql);
				}				
			}
		}
		// Nochmal zur sicherheit alles ausm temp raus
    @mysql_query("delete from temp where nidentid = ".$this->sIdentNumber);
		return $this->aEvent;
	}
	
	public function fetchTable() {
    echo "<table border='0' id='myTable' style='width:100%; margin-top:-2px;' style='overflow:hidden'>";
		echo "<tbody id='myTableBody'>";
		$this->fetchEvents();

		// Berechenen der Breite von den Spalten (prozentual)
		$num_prozent = 100 / $this->nTage;
		
		// Schleife für gesamten Stunden
		for ($i=$this->nDisplayStundenVon; $i<=$this->nDisplayStundenBis; $i++) {
			// Schleife für die Zeilen einer Stunde - Standart sind 2, können aber über Funktion verändert werden
			for ($x=1; $x<=$this->nAnzZeilenProStunde; $x++) {
				echo "<tr>";
				if ($x==1) {
					echo "<td unselectable='on' rowspan='".$this->nAnzZeilenProStunde."' ".($i==$this->nDisplayStundenVon?' id=\'CalendarZelle0\'':"")." class='tableDateCell' style=' -moz-user-select: none; ";
					if ($i==$this->nDisplayStundenBis) {
						echo " border-bottom:0px; ";
					}
					echo "'> ";
					echo "<div unselectable='on'>";
					echo $i."<span>00</span>";
					echo "</div>";
					echo "</td>";
				}
				// Schleife für die Zeilen der Tage (Spalten)
				for ($y=1; $y<=$this->nTage; $y++) {
					echo "<td class='";
					
					// Leider wichtig für die Unterschiedlichen Rahmen
					if ($x==1 && $this->nAnzZeilenProStunde==1) {
						echo "tableDataCell_dunkel_dunkel";
					}
					elseif ($x==1 && $this->nAnzZeilenProStunde>1) {
						echo "tableDataCell_dunkel_hell";
					}
					elseif ($x==$this->nAnzZeilenProStunde) {
						echo "tableDataCell_hell_dunkel";
					}	
					else {
						echo "tableDataCell_hell_hell";
					}
					
					echo "' style='padding:0px; width:".$num_prozent."%; height:".$this->nZeilenHoehe."px; vertical-align:top;  -moz-user-select: none; ";
					// Wenn letzter Tag, keinen rechten Rahmen zeigen
					if ($y==$this->nTage) {
						echo "border-right: 0px;";
					} 
					if ($i==$this->nDisplayStundenBis && $x==$this->nAnzZeilenProStunde) {
						echo "border-bottom: 0px;";
					}
					// Wenn Arbeitszeit angezeigt werden soll, dann andere Hintergrundfarbe
					if ($this->bDisplayArbeitszeit==true) {
						if ($i>=$this->nArbeitszeitVon && $i<$this->nArbeitszeitBis && in_array($this->aTage[$y]['kuerzel'], $this->aArbeitsTage)) {
							echo "background-color:#ffffd5";
						}						
					}					
					echo "'";
					// ID´s in erster Zeile setzen, damit später mit Javascript der Header Richtig gesetzt werden kann
					if ($i==$this->nDisplayStundenVon && $x==1) {
						echo " id='CalendarZelle".$y."'";
					}
					$sId = str_pad($y, 4, "0", STR_PAD_LEFT).'.'.str_pad($i, 4, "0", STR_PAD_LEFT).'.'.str_pad($x, 4, "0", STR_PAD_LEFT);
					echo " unselectable='on' ><div id='".$sId."' onmousedown='newEvent(this);' unselectable='on' style='-moz-user-select: none; /*background-color:#3399ff;*/ width:100%; height:".($this->nZeilenHoehe-1)."px; margin:0px; padding:0px; font-size:1px;'></div></td>";			
				}
				echo "</tr>";
			}
		}
		echo "</tbody>";
		echo "</table>";		
	}
	
	public function fetchEvents() {
		echo "<tr style='height:0px;' id='eventContainer'>";
		echo "<td style='padding:0px; height:0px; maring:0px; border: 0px solid #a0a0a0'>";
		echo "</td>";
		
		// Events holen
		$aEvent = $this->getEvents();

		for ($i=1; $i<=$this->nTage; $i++) {
			echo "<td style='padding:0px; height:0px; maring:0px; border: 0px solid #a0a0a0'>";
			echo "<div style='display: block; margin-right: 5px; position: relative; height: 1px; font-size: 0px; line-height: 1.2; margin-top: 0px;' id='eventTag".$i."'>";
			if (is_array($this->aEvent[$i])) {
				for ($y=0; $y<count($aEvent[$i]); $y++) {
					echo "	<div class='termin' ondblclick='alert(\"Jetzt Termin aendern: \"+".$aEvent[$i][$y]['id'].")' id='event_".$aEvent[$i][$y]['id']."' unselectable='on' style='overflow: hidden; -moz-user-select: none; position: absolute; top:".($aEvent[$i][$y]['nTop']+1)."px; font-family: Tahoma; font-size: 8pt; color: rgb(0, 0, 0); left: ".$aEvent[$i][$y]['nLeft']."; width: ".$aEvent[$i][$y]['nWidth']."; height: ".($aEvent[$i][$y]['nHeight']+1)."px; background-color: rgb(0, 0, 0);' onmousedown='dragstart(this)' onmouseover='overstart(this)' onmouseout='overend()'>";
					echo "		<div unselectable='on' style='position: absolute; width: 100%; text-align: right;'><img id='eventRemove_".$aEvent[$i][$y]['id']."' onmouseover='$(\"event_".$aEvent[$i][$y]['id']."\").onmousedown = function() {null;}' onmouseout='$(\"event_".$aEvent[$i][$y]['id']."\").onmousedown = function() {dragstart(this);}' onclick='removeEvent(this.id.substr(12).toString())' src='img/del.gif' style='margin-right: 2px; margin-top: 2px; cursor: pointer;' width='10' height='10'></div>";
					echo "		<div unselectable='on' style='height: 1px; line-height: 1px; font-size: 0px; width: 1px;'><!-- --></div>";
					echo "		<div id='eventContent_".$aEvent[$i][$y]['id']."' class='event' style=' border-right: 1px solid rgb(0, 0, 0); overflow: hidden; margin-top: 0px; height: ".($aEvent[$i][$y]['nHeight']-1)."px; background-color: rgb(255, 255, 255);' unselectable='on'>";
					echo "			<div id='eventColor_".$aEvent[$i][$y]['id']."' style='position: absolute; left: 0px; width: 5px; height: ".($aEvent[$i][$y]['nHeight']-1)."px; background-color: #".$aEvent[$i][$y]['sColor']."; font-size: 1px;' unselectable='on'></div>";
					echo "			<div style='position: absolute; left: 5px; top: 0px; width: 1px; background-color: rgb(0, 0, 0); height: 100%;' unselectable='on'></div>";
					echo "			<div unselectable='on' style='padding-left: 8px;'>".$aEvent[$i][$y]['bez']." (".$aEvent[$i][$y]['dtVon']." - ".$aEvent[$i][$y]['dtBis'].")</div>";
					echo "		</div>";
					echo "	</div>";				
				}
			}			
			echo "</div>";
			echo "</td>";
		}
    echo "</tr>";				
	}
	
	public function fetchTableHeader() {
		echo "<tr>";
		echo "<td id='calendarHeaderZelle0'>&nbsp;</td>";
		
		for ($y=1; $y<=$this->nTage; $y++) {
			echo "<td  unselectable='on' id='calendarHeaderZelle".$y."' style='overflow:hidden; -moz-user-select: none;  '>";
			echo "<div  unselectable='on' style='padding-bottom:3px;padding-top:3px;overflow:hidden; white-space:nowrap; -moz-user-select: none; '>";
			echo $this->aTage[$y]['bez'].", ";
			echo "<br />";
			echo "<span style='font-weight:normal;'>".$this->aTage[$y]['formatiert']."</span>";
			echo "</div>";
			echo "</td>";
		}
		
		echo "<td id='calendarHeaderZelleSpacer' ".($this->nCalendarHoehe==false?'':'style=\'width:16px;\'')."></td>";
		echo "</tr>";
	}
	
	public function getNewEventLayer($nMode, $sBetreff, $sText, $sFarbe, $dtDatum, $dtVon, $dtBis) {
	  echo "<form method='get' action='".$PHP_SELF."'>";	 
	  if ($nMode==1) {
	    echo "<input type='hidden' name='terminAdd' value='true'>";
	    echo "<input type='hidden' name='aktion' value='newTermin'>";
	  } else {
	    echo "<input type='hidden' name='terminUpdate' value='true'>";
	  }
    echo "<table style='width:100%;' id='newEventLayer'>
            <tr>
              <td style='width:1%; white-space: nowrap; vertical-align:top;'>Betreff: </td>
              <td colspan='2'><input type='text' name='sBetreff' style='width:100%' value='".$sBetreff."'></td>
            </tr>
            <tr>
              <td style='width:1%; white-space: nowrap; vertical-align:top;'>Farbe: </td>
              <td><input type='text' name='sFarbe' readonly id='sFarbe' value='".($sFarbe==''?'0000ff':$sFarbe)."' style='width:85px'></td>
              <td>
                <div onclick='document.getElementById(\"sFarbe\").value=\"0000ff\"' style='width:20px; float:left; height:20px; margin-right:8px; cursor:pointer; border:1px solid #A0A0A0; background-color:#0000ff'>&nbsp;</div>
                <div onclick='document.getElementById(\"sFarbe\").value=\"800080\"' style='width:20px; float:left; height:20px; margin-right:8px; cursor:pointer; border:1px solid #A0A0A0; background-color:#800080'>&nbsp;</div>
                <div onclick='document.getElementById(\"sFarbe\").value=\"ffffff\"' style='width:20px; float:left; height:20px; margin-right:8px; cursor:pointer; border:1px solid #A0A0A0; background-color:#ffffff'>&nbsp;</div>
                <div onclick='document.getElementById(\"sFarbe\").value=\"ff0000\"' style='width:20px; float:left; height:20px; margin-right:8px; cursor:pointer; border:1px solid #A0A0A0; background-color:#ff0000'>&nbsp;</div>
              </td
            </tr>            
            <tr>
              <td colspan='3'><hr rules='all'></td>
            </tr>           
            <tr>
              <td style='width:1%; white-space: nowrap; vertical-align:top;'>Beginnt am: </td>
              <td><input type='text' name='dtDatum' value='".$dtDatum."' style='width:85px'></td>
              <td> um: <input type='text' name='dtVon' value='".$dtVon."' style='width:50px'>  Uhr</td>
            </tr>         
            <tr>
              <td style='width:1%; white-space: nowrap; vertical-align:top;'>Endet am: </td>
              <td style='width:1%'>&nbsp;</td>
              <td style='width:98%'> um: <input type='text' name='dtBis' value='".$dtBis."' style='width:50px'> Uhr</td>
            </tr>     
            <tr>
              <td colspan='3'><hr></td>
            </tr>                 
            <tr>
              <td style='width:1%; white-space: nowrap; vertical-align:top;'>Nachricht: </td>
              <td colspan='2'><textarea style='width:100%;' name='sBetreff' rows='5'>".$sText."</textarea></td>
            </tr>    
            <tr>
              <td colspan='3'><hr></td>
            </tr> 
            <tr>
              <td colspan='3' style='text-align:right;'><input type='submit' value='Speichern'/></td>
            </tr>             
          </table>
          </form>";
	}
	
	
	public function init() {
		echo "<table style='width:".($this->nCalendarBreite)."' class='CalendarTableHeader' id='CalendarTableHeader'>";
		echo "<tbody id='myTableHeader'>";
    $this->fetchTableHeader();
		echo "</tbody>";
		echo "</table>";
		echo "<div id='layer'><img src='img/loader.gif'></div>";
		echo "<div id='CalendarTableBody' style='margin:0px; margin-top:-1px; padding:0px; overflow:auto; width:".$this->nCalendarBreite."; border-right: 1px solid #a0a0a0; border-bottom: 1px solid #a0a0a0;  border-top: 1px solid #a0a0a0; ".($this->nCalendarHoehe!=false?'height:'.$this->nCalendarHoehe.'px;':'')."' >";
		$this->fetchTable();
		echo "</div>";	
		echo "<script>";
		echo "
		     var nZelleHeight = ".$this->nZeilenHoehe.";
		     var nZelleWidth = $('CalendarZelle1').offsetWidth;
		     
		     function setSize() {
		       var nSpacer = 0;
			     for (i=0; i<".$this->nTage."; i++) {
			       objHeaderZelle  = $('calendarHeaderZelle'+i);
			       if (i!=0)
			         objDataZelle    = $('CalendarZelle1');
			       else 
			         objDataZelle    = $('CalendarZelle0');
			       nSpacer = nSpacer + objDataZelle.offsetWidth-1;
			       objHeaderZelle.style.width = objDataZelle.offsetWidth-1;
			     }
			     
			     $('CalendarTableHeader').style.width = $('CalendarTableBody').offsetWidth;
		     }
		     
		     addLoadEvent(function() {
		       setSize();
		       nZelleWidth = $('CalendarZelle1').offsetWidth;
		       draginit();
		       objBody = document.getElementsByTagName('body')[0];
		       
					 nAnzZeilenProStunde = ".intval($this->nAnzZeilenProStunde).";
					 nZeilenHoehe        = ".intval($this->nZeilenHoehe).";
					 nMode               = ".intval($this->nMode).";
					 nTage               = ".intval($this->nTage).";
					 nKW                 = ".intval($this->nKW).";
					 nJahr               = ".intval($this->nJahr).";
					 nDisplayStundenVon  = ".intval($this->nDisplayStundenVon).";
					 nDisplayStundenBis  = ".intval($this->nDisplayStundenBis).";		            
	         
					 nTopGrid = getOffsetTop($('CalendarZelle1'));
				 });

		     addResizeEvent(function() {
		       setSize();
		       nZelleWidth = $('CalendarZelle1').offsetWidth;	     
				 });		
   
		     ";
		echo "</script>";
	}
}
?>