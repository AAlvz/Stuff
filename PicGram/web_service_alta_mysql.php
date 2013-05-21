<?php
	$nombre = $_POST['nombre'];
	$con = mysql_connect("ldap.fundateam.org","poncho","ponchopass");
	if (!$con)
	{	
		echo 'reatotota';
		die('Could not connect: ' . mysql_error());
	}
	mysql_select_db("fundagram", $con);
	mysql_query("INSERT INTO funda (`Nombre`, `Impresiones`) VALUES ('".$nombre."', '10')");
	mysql_close($con);
?>
