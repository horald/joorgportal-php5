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

    session_start();
	
    unset($_SESSION['uid']);
	
    unset($_SESSION['pwd']);

	require('main.php');

//	db_connect();

//	include(INC_DIR."header.php");
	
	echo '<br /><strong>User Logged Out</strong> - Thanks for visiting!';
	
//   include(INC_DIR."login.php");
	
//	include(INC_DIR."footer.php");

//	db_disconnect();

?>