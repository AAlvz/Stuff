<?php
	$nombre = $_GET['nombre'];
	$con = mysql_connect("ldap.fundateam.org","poncho","ponchopass");
	if (!$con)
	{	
		echo 'reatotota';
		die('Could not connect: ' . mysql_error());
	}
	mysql_select_db("fundagram", $con);
	//mysql_query("INSERT INTO funda (`Nombre`, `Impresiones`) VALUES ('".$nombre."', '10')");
	mysql_query("UPDATE funda SET Impresiones = Impresiones - 1  WHERE Nombre = ".$nombre);
	mysql_close($con);
?>
