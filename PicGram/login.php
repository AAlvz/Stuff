<?php
$nombre = $_POST['nombre'];
$password = $_POST['password'];
$pass = '/home/alfonso/passwordfile';

$case = 'sudo -u root -S bash /home/alfonso/scripts/buscarLdap.sh '.$nombre.' '.$password.' < '.$pass;
echo shell_exec($case); 

?>
