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

    session_start();

    if (!isset($_SESSION['uid'])) {
       $_SESSION['uid'] = $_REQUEST['uid'];
       $_SESSION['pwd'] = $_REQUEST['pwd'];
    }

    $uid = $_SESSION['uid'];
    $pwd = $_SESSION['pwd'];

	db_connect();

	$res = mysql_query(sprintf("SELECT * FROM users WHERE uid='%s' AND pwd='%s' and status='%s'",$uid,$pwd,'active'));
	$re  = mysql_fetch_array($res);

    if(mysql_num_rows($res) != 0) {

	  include(INC_DIR."header.php");      
		?>
		
      <!-- // MEMBER CONTENT GOES HERE //-->
		<br><b>What? Did you actually think you might get something for becoming a member? Anyways, this is where you would put your member content.</b>
		
		<?php

	} else {

	include(INC_DIR."header.php");
    unset($_SESSION['uid']);
    unset($_SESSION['pwd']);

    echo "<p><b><span>Cannot Access Member Area</span></b> Please login / register and try again!</p><hr /><br />";
			echo '<h2>Members Log In</h2>';

    			include(INC_DIR."login.php");

			echo '<h2>Not a Member? Join Now!</h2>';

    			include(INC_DIR."signup.php");

	}


	include(INC_DIR."footer.php");
	db_disconnect();




?>
























