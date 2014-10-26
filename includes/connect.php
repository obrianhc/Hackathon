<?php
	$user = "hackathon";
	$password = "asdf";
	$db = "xe";
	$connect = OCILogon($user,$password,$db);
	if(!$connect){
		echo "Error al iniciar la conexi&oacute;n<br>";
	}
?>