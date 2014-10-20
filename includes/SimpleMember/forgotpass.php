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

    $email = $_REQUEST['email'];

	if (isset($email)) {

	$sql=sprintf("select * from users where email='%s'",$email);
	$result=mysql_query($sql);
	$num_row=mysql_num_rows($result);

		if($num_row!=0) {
			$result = mysql_query(sprintf("select pwd from users where email='%s'",$email));
			$password = mysql_result($result, 0);

			$result = mysql_query(sprintf("select uid from users where email='%s'",$email));
			$username = mysql_result($result, 0);



			$msg = "

			Below is the password to your account.
			Keep this in a safe place.

			Your username is:   $username
			Your password is:   $password

			- Thank You

			";


			mail("$email", "Your Password for ".SITENAME, "$msg", "From:".FROMEMAIL." \nReply-To: ".FROMEMAIL."");
            echo "<br>Your password has been emailed to you!";

		} else {

			echo "<BR><CENTER><B>This email cannot be found in our database</B></cENTER>";

		}

	} else {

     echo "<br><b>To retrieve your username and password</b>, please supply your email address below and the username and password for that account will be emailed.<br><br>\n";
     echo "<form action=\"forgotpass.php\" method=\"post\"><b>Email: </b><input type=\"text\" name=\"email\" value=\"\"> ";
     echo "<input type=submit name=submit value=Submit></form><br>";

	}


	include(INC_DIR."footer.php");
	db_disconnect();
?>