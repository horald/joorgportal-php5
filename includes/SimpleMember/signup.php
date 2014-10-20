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

	require('main.php');

	db_connect();

	include(INC_DIR."header.php");

	if ($_SERVER['REQUEST_METHOD'] == "POST") {

        $uid     = $_POST['uid'];
        $pwd     = $_POST['pwd'];
        $pwd2    = $_POST['pwd2'];
        $email   = $_POST['email'];
        $fname   = $_POST['fname'];
        $lname   = $_POST['lname'];
        $addr    = $_POST['addr'];
        $city    = $_POST['city'];
        $state   = $_POST['state'];
        $country = $_POST['country'];
        $zipcode = $_POST['zipcode'];
        $phone   = $_POST['phone'];

      $u     = strtolower($uid);
		$pw    = strtolower($pwd);
		$pw2   = strtolower($pwd2);
		date_default_timezone_set('America/Chicago');
		$today = date("mdY");


		if (!ctype_alnum($u) || strlen($u) < 4 || strlen($u) > 16) {
			echo "<font color=red>Username must be between 4-16 characters (letters and numbers).</font><br>";
			$err = "yes";

        }

		if (!ctype_alnum($pw) || strlen($pw) < 6 || strlen($pw) > 10) {
			echo "<font color=red>Password must be between 6-10 characters (letters and numbers).</font><br>";
            $err = "yes";
		}

		if ($pw != $pw2) {
			echo "<font color=red>Password and password confirmation do not match.</font><br>";
            $err = "yes";
        }

        if ($err == "") {

			$sql=sprintf("select * from users where email='%s' OR uid like '%s'",$email,'%'.$u.'%');
			$result=mysql_query($sql) or die("select  fails");
			$no=mysql_num_rows($result);

			if ($no==0) {


				$sql=sprintf("insert into users(uid,pwd,fname,lname,addr,city,state,country,zipcode,email,phone,status,type,datesignup) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s',%d)",$u,$pw,$fname,$lname,$addr,$city,$state,$country,$zipcode,$email,$phone,'active','sing',time());
				$result = mysql_query($sql) or die("insert fails");

					if (isset($result)) {

					  echo "<br><b>Account Successfully Created!</b> - Login Below";
					  include(INC_DIR."login.php");

					} else {
					  echo "<br>Error Inserting Record. Contact Site Admin<br>";
					}

			} else {

			   echo "<font color=red>User with that Email Address or Username already exists. <a href='".BASEHREF."/forgotpass.php'>Forgot Password?</a></font><br>";

			}
       } else {

         include(INC_DIR."signup.php");

       }

	} else {


	   include(INC_DIR."signup.php");


	}


	include(INC_DIR."footer.php");

	db_disconnect();




?>
