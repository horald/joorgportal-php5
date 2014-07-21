<?php
session_start();
$basehref="";
   if (isset($_SESSION['uid'])) {
     echo "angemeldet als ".$_SESSION['uid']."<br>";
   }
	echo "<form action='../member.php' method='post' id='loginForm' >";
	
	echo "	<p>";
	echo "		<label for='uid'>Username</label>";
	echo "		<input id='uid' type='text' name='uid' title='Username' class='inputText' />";
	echo "	</p>";
		
	echo "	<p>";
	echo "		<label for='pwd'>Password</label>";
	echo "		<input id='pwd' type='password' name='pwd' title='Password' class='inputText' />";
	echo "	</p>";
		
//	echo "	<p><a href='".$BASEHREF."/forgotpass.ph"' title='forgot my password'>forgot my password!</a></p>";

   echo "<p>";
   echo "<a href='signup.php'>Register</a>";
   echo "</p>";

	echo "	<p>";
	echo "		<input type='submit' value='login' class='inputSubmi' />";
	echo "	</p>";
		
	echo "</form>";
?>	