<?phpif(isset($_GET['id'])) {    $id=$_GET['id'];     $dbname="dbWebportal";    $dbhost="127.0.0.1";    $dbpass="mysql";    $dbuser="root";    mysql_connect($dbhost,$dbuser,$dbpass);    mysql_select_db($dbname);    $query = "select fldb01bild,fldb01filetype from tblbilder WHERE fldb01index=$id";    $result = MYSQL_QUERY($query);    $data = @MYSQL_RESULT($result,0,"fldb01bild");    $type = @MYSQL_RESULT($result,0,"fldb01filetype");    Header( "Content-type: $type");    echo $data;}	?>	