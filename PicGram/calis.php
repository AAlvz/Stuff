<?php
	$nombre = $_GET['nombre'];
	$numero = $_GET['numero'];
	$con = mysql_connect("ldap.fundateam.org","poncho","ponchopass");
	if (!$con)
	{	
		echo 'reatotota';
		die('Could not connect: ' . mysql_error());
	}
	mysql_select_db("fundagram", $con);
	//mysql_query("INSERT INTO funda (`Nombre`, `Impresiones`) VALUES ('".$nombre."', '10')");
	mysql_query("UPDATE funda SET `Impresiones` = (`Impresiones` - '".$numero."')  WHERE Nombre = '".$nombre."'");
	mysql_close($con);
	header( 'Location: http://fundagram.fundateam.org/mail.php?nombre='.$nombre.'&id='.$nombre.'"&numero="'.$numero) ;
?>
