<?php
$nombre = $_POST['nombre'];
//$password = $_POST['password'];
$password = 'pass';
$pass = '/home/alfonso/passwordfile';

$case = 'sudo -u root -S bash /home/alfonso/scripts/altaLdap.sh '.$nombre.' '.$password.' < '.$pass;
echo shell_exec($case); 
echo shell_exec('sudo -u root -S bash /home/alfonso/scripts/mostrarTodosLdap.sh  < '.$pass); 

//header( 'Location: http://fundagram.fundateam.org/AltaUsuario.php?bandera=1' ) ;
?>
