<?php
/**
 * Joomla! component sexypolling
 *
 * @version $Id: vote.php 2012-04-05 14:30:25 svn $
 * @author 2GLux.com
 * @package Sexy Polling
 * @subpackage com_sexypolling
 * @license GNU/GPL
 *
 */

// no direct access
define('_JEXEC',true);
defined('_JEXEC') or die('Restircted access');
/*
 * This is external PHP file and used on AJAX calls, so it has not "defined('_JEXEC') or die;" part.
 */

error_reporting(0);
header('Content-type: application/json');
include '../../configuration.php';

$date_now = strtotime("now");
$datenow = date("Y-m-d H:i:s", $date_now);

$config = new JConfig;

//conects to datababse
mysql_connect($config->host, $config->user, $config->password);
mysql_select_db($config->db);
mysql_query("SET NAMES utf8");

//date format -> must get from component parameters
$date_format = $_POST['dateformat'];

//get ip address
$REMOTE_ADDR = null;
if(isset($_SERVER['REMOTE_ADDR'])) { $REMOTE_ADDR = $_SERVER['REMOTE_ADDR']; }
elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR'])) { $REMOTE_ADDR = $_SERVER['HTTP_X_FORWARDED_FOR']; }
elseif(isset($_SERVER['HTTP_CLIENT_IP'])) { $REMOTE_ADDR = $_SERVER['HTTP_CLIENT_IP']; }
elseif(isset($_SERVER['HTTP_VIA'])) { $REMOTE_ADDR = $_SERVER['HTTP_VIA']; }
else { $REMOTE_ADDR = 'Unknown'; }
$ip = $REMOTE_ADDR;

$countryname = (!isset($_POST['country_name']) || $_POST['country_name'] == '' || $_POST['country_name'] == '-' ) ? 'Unknown' : mysql_real_escape_string($_POST['country_name']);
$cityname = (!isset($_POST['city_name']) || $_POST['city_name'] == '' || $_POST['city_name'] == '-' ) ? 'Unknown' : mysql_real_escape_string($_POST['city_name']);
$regionname = (!isset($_POST['region_name']) || $_POST['region_name'] == '' || $_POST['region_name'] == '-' ) ? 'Unknown' : mysql_real_escape_string($_POST['region_name']);
$countrycode = (!isset($_POST['country_code']) || $_POST['country_code'] == '' || $_POST['country_code'] == '-' ) ? 'Unknown' : mysql_real_escape_string($_POST['country_code']);

$answer_id_array = isset($_POST['answer_id']) ? $_POST['answer_id'] : 0;
$adittional_answers = isset($_POST['answers']) ? $_POST['answers'] : 0;
$polling_id = isset($_POST['polling_id']) ? (int)$_POST['polling_id'] : 0;
$module_id = isset($_POST['module_id']) ? (int)$_POST['module_id'] : 0;
$mode = isset($_POST['mode']) ? $_POST['mode'] : '';
$min_date_sended = isset($_POST['min_date']) ? $_POST['min_date'].' 00:00:00' : '';
$max_date_sended = isset($_POST['max_date']) ? $_POST['max_date'].' 23:59:59' : '';

$use_current = isset($_POST['curr_date']) ? $_POST['curr_date'] : '';
if($use_current == 'yes') {
	$max_date_sended = date('Y-m-d',strtotime("now")).' 23:59:59';
}

$voting_period = $_POST['voting_period'];

$add_answers = array();
if(is_array($adittional_answers)) {
	foreach ($adittional_answers as $answer) {
		$answer = mysql_real_escape_string(strip_tags($answer));
		$answer = preg_replace('/sexydoublequestionmark/','??',$answer);
		
		$published = 1;
		mysql_query("INSERT INTO `".$config->dbprefix."sexy_answers` (`id_poll`,`name`,`published`,`created`) VALUES ('$polling_id','$answer','$published',NOW())");
		$insert_id = mysql_insert_id();
		
		$add_answers[] = $insert_id;
		
		mysql_query("INSERT INTO `".$config->dbprefix."sexy_votes` (`id_answer`,`ip`,`date`,`country`,`city`,`region`,`countrycode`) VALUES ('$insert_id','$ip','$datenow','$countryname','$cityname','$regionname','$countrycode')");
		
		//set the cookie
		if($voting_period == 0) {
			$expire = time()+(60*60*24*365*2);//2 years
			setcookie("sexy_poll_$polling_id", $date_now, $expire, '/');
		}
		else {
			$expire_time = (float)$voting_period*60*60;
			$expire = (int)(time()+$expire_time);
			setcookie("sexy_poll_$polling_id", $date_now, $expire, '/');
		}
	}
}


//check if not voted, save the voting

if ($mode != 'view' && $mode != 'view_by_date' && is_array($answer_id_array)) {
		foreach ($answer_id_array as $answer_id) {
			mysql_query("INSERT INTO `".$config->dbprefix."sexy_votes` (`id_answer`,`ip`,`date`,`country`,`city`,`region`,`countrycode`) VALUES ('$answer_id','$ip','$datenow','$countryname','$cityname','$regionname','$countrycode')");
		}
		
		//set the cookie
		if($voting_period == 0) {
			$expire = time()+(60*60*24*365*2);//2 years
			setcookie("sexy_poll_$polling_id", $date_now, $expire, '/');
		}
		else {
			$expire_time = (float)$voting_period*60*60;
			$expire = (int)(time()+$expire_time);
			setcookie("sexy_poll_$polling_id", $date_now, $expire, '/');
		}
}

//get count of total votes, min and max dates of voting
$query_toal = "SELECT 
				COUNT(sv.`id_answer`) total_count,
				MAX(sv.`date`) max_date,
				MIN(sv.`date`) min_date 
			FROM 
				`".$config->dbprefix."sexy_votes` sv
			JOIN
				`".$config->dbprefix."sexy_answers` sa ON sa.id_poll =  '$polling_id' 
			AND
				sa.published = '1'
			WHERE
				sv.`id_answer` = sa.id";

//if dates are sended, add them to query
if ($mode == 'view_by_date')
	$query_toal .= " AND sv.`date` >= '$min_date_sended' AND sv.`date` <= '$max_date_sended' ";

$res_toal = mysql_query($query_toal);
$row_total = mysql_fetch_assoc($res_toal);
$count_total_votes = $row_total['total_count'];
if ($count_total_votes > 0) {
	$min_date = $date_format == 'str' ? date('F j, Y', strtotime($row_total['min_date'])) : date('d / m / Y',strtotime($row_total['min_date']));
	$max_date = $date_format == 'str' ? date('F j, Y', strtotime($row_total['max_date'])) : date('d / m / Y',strtotime($row_total['max_date']));
}
elseif($min_date_sended != ''){
	$min_date = $date_format == 'str' ? date('F j, Y', strtotime($min_date_sended)) : date('d / m / Y',strtotime($min_date_sended));
	$max_date = $date_format == 'str' ? date('F j, Y', strtotime($max_date_sended)) : date('d / m / Y',strtotime($max_date_sended));
}
else {
	$max_date = "";
	$min_date = "";
}

//get all answers
$answer_ids = array();
$voted_ids = array();
$ans_names = array();
$ans_orders_start = array();
$res_all = mysql_query("SELECT `id`,`name` FROM `".$config->dbprefix."sexy_answers` WHERE `id_poll` = '$polling_id' AND  published = '1' ORDER BY `ordering` DESC,name");
$a = 1;
while ($row_all = mysql_fetch_assoc($res_all)) {
	$answer_ids[] = $row_all['id'];
	$ans_names[$row_all['id']] = $row_all['name'];
	$ans_orders_start[$row_all['id']] = $a;
	$a ++;
}

//get answers votes data
$query_poll = 
				"
					SELECT
						sv.id_answer,
						sa.name,
						COUNT(sv.`id_answer`) count_votes
					FROM
						`".$config->dbprefix."sexy_votes` sv
					JOIN
						`".$config->dbprefix."sexy_answers` sa ON sa.id_poll =  '$polling_id' 
					AND
						sa.published = '1'
					WHERE
						sv.`id_answer` = sa.id";
if ($mode == 'view_by_date')
	$query_poll .= " AND sv.`date` >= '$min_date_sended' AND sv.`date` <= '$max_date_sended' ";				
$query_poll .= " GROUP BY sv.`id_answer` ORDER BY count_votes DESC,sa.name";
$res_poll = mysql_query($query_poll);
$poll_array = Array();
while ($row_poll = mysql_fetch_assoc($res_poll)) {

	$float_percent = (100 * $row_poll['count_votes'] / $count_total_votes);
	$item_percent = number_format($float_percent, 1, '.', ''); 
	
	$poll_array[$row_poll['id_answer']]['percent'] = $float_percent;
	$poll_array[$row_poll['id_answer']]['percent_formated'] = $item_percent;
	$poll_array[$row_poll['id_answer']]['answer_id'] = $row_poll['id_answer'];
	$poll_array[$row_poll['id_answer']]['votes'] = $row_poll['count_votes'];
	$poll_array[$row_poll['id_answer']]['total_votes'] = $count_total_votes;
	$poll_array[$row_poll['id_answer']]['min_date'] = $min_date;
	$poll_array[$row_poll['id_answer']]['max_date'] = $max_date;
	$poll_array[$row_poll['id_answer']]['name'] = $row_poll['name'];
	
	$voted_ids[] = $row_poll['id_answer'];
}

//chech if there are answers with no votes
foreach ($answer_ids as $ans_id) {
	if(!in_array($ans_id,$voted_ids)) {
		$poll_array["$ans_id"]['percent'] = '0';
		$poll_array["$ans_id"]['percent_formated'] = '0';
		$poll_array["$ans_id"]['answer_id'] = $ans_id;
		$poll_array["$ans_id"]['votes'] = '0';
		$poll_array["$ans_id"]['total_votes'] = $count_total_votes;
		$poll_array["$ans_id"]['min_date'] = $min_date;
		$poll_array["$ans_id"]['max_date'] = $max_date;
		$poll_array["$ans_id"]['name'] = $ans_names[$ans_id];
	}
}

//genertes order list
$order_list = array();
foreach ($poll_array as $data) {
	$order_list[$data['answer_id']] = array($data['votes'],$data['name'],$data['answer_id']);
}
usort($order_list, "cmp");
$r = 1;
$ord_final_list = array();
foreach ($order_list as $k => $val) {
	$ord_final_list[$k] = $r;
	$r++;
}

$order_list = array_reverse($order_list,true);

//print_r($order_list);

$r = 1;
$ord_final_list = array();
foreach ($order_list as $k => $val) {
	$ord_final_list[$val[2]] = $r;
	$r++;
}

//print_r($ord_final_list);

function cmp($a, $b)
{
	if ($a[0] == $b[0]) {
		$strcmp = strcasecmp($a[1], $b[1]);
		if ($strcmp > 0)
			return -1;
		elseif($strcmp < 0)
			return 1;
		else
			return 0;
	}
	return ($a[0] < $b[0]) ? -1 : 1;
}

function cmp1($a, $b)
{
	if ($a["votes"] == $b["votes"]) {
		return $strcmp = strcasecmp($a["name"], $b["name"]);
	}
	return ($a["votes"] < $b["votes"]) ? 1 : -1;
}

//generates json output
usort($poll_array, "cmp1");
//print_r($poll_array);
$a = 0;
echo '[';
foreach ($poll_array as $data)
{
	echo '{';
	echo '"answer_id": "'.$data["answer_id"].'", ';
	echo '"poll_id": "'.$polling_id.'", ';
	echo '"module_id": "'.$module_id.'", ';
	echo '"percent_formated": "'.$data["percent_formated"].'", ';
	echo '"percent": "'.$data["percent"].'", ';
	echo '"votes": "'.$data["votes"].'", ';
	echo '"total_votes": "'.$data["total_votes"].'", ';
	echo '"min_date": "'.$data["min_date"].'", ';
	echo '"order": "'.$ord_final_list[$data["answer_id"]].'", ';
	echo '"order_start": "'.$ans_orders_start[$data["answer_id"]].'", ';
	echo '"name": "'.str_replace('\\','', htmlspecialchars (stripslashes($data["name"]),ENT_QUOTES)).'", ';
	echo '"max_date": "'.$data["max_date"].'"';
	
	if(sizeof($add_answers) > 0 && $a == 0) {
		echo ', "addedanswers": ';
		echo '[';
		foreach ($add_answers as $k => $ans_id) {
			echo '"'.$ans_id.'"';
			if ($k != sizeof($add_answers) - 1)
				echo ',';
		}
		echo ']';
	}
	
	echo '}';
	if ($a != sizeof($poll_array) - 1)
		echo ', ';
	$a++;
}
echo ']';
?>