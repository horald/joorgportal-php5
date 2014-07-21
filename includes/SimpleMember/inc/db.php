<?php
/*
 * Simple Member
 * 
 * Created by: Doni Ronquillo                            
 * Modified by: CodeMunkyX
 * 
 * Copyright (c) 2011 http://www.free-php.net
 *
 * GPLv3 - (see LICENSE-GPLv3 included in folder)               
 *                                                                        
 * GalleryGenerator is free software you can redistribute it and/or modify      
 * it under the terms of the GNU General Public License as published by   
 * the Free Software Foundation, either version 3 of the License, or      
 * (at your option) any later version.                                    
 *                                                                        
 * This program is distributed in the hope that it will be useful,        
 * but WITHOUT ANY WARRANTY; without even the implied warranty of         
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          
 * GNU General Public License for more details.                                                                                               
 * 
 */

	function db_connect()
	{
		global $db;

		if ($db)
			return;

		$db = mysql_connect("localhost", MYSQLUSER, MYSQLPASS);

		mysql_select_db(MYSQLDB, $db);

		if (!$db)
		{
			echo "Couldn't open database!\n";
			exit;
		}
	}

	function db_disconnect()
	{
		global $db;

		if ($db)
		{
			mysql_close($db);
			$db = NULL;
		}
	}

	function db_query($q)
	{
		global $db;

		$result = mysql_query($q, $db);
		return $result;
	}

	function db_fetch_array($result)
	{
		global $db;

		$r = mysql_fetch_array($result);
		return $r;
	}

	function db_query_row($q)
	{
		$result = db_query($q);

		if (!$result)
			return NULL;

		$row = mysql_fetch_array($result);
		return $row;
	}

	function db_query_value($q)
	{
		$row = db_query_row($q);
		return $row[0];
	}

	function db_array_update($table, $a, $where)
	{
		$q = "update $table set ";
		$b = NULL;

		foreach($a as $key => $value)
		{
			if (is_int($key))
				continue;

//			if (isset($value) && $value != "")
				$b[] = "$key='$value'";
		}

		$q .= implode(",", $b);
		$q .= " where ".$where;

		db_query($q);
	}

	function db_array_insert($table, $a)
	{
		$q = "insert into $table set ";
		$b = NULL;

		foreach($a as $key => $value)
		{
			if (is_int($key))
				continue;
			if ($value && $value != "")
				$b[] = "$key='$value'";
		}

		$q .= implode(",", $b);

		db_query($q);

	}

	function db_insert_id()
	{
		return mysql_insert_id();
	}

	function gen_id($table, $column, $size, $characters_allow)
	{
		for(;;)
		{
			$id = random_string($size, TRUE, $characters_allow);
			$q = sprintf("select count(*) from $table where %s='%s'",$column,$id);
			$count = db_query_value($q);
			if ($count == 0)
				break;
		}
		return $id;
	}

	function db_num_rows($result)
	{
		return mysql_num_rows($result);
	}
?>