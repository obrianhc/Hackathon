<?php
	include('classes/CL_CentroEducativo.php');
	if(isset($_POST['municipio'])){
		$nombre = $_POST['municipio'];
		$est = new CL_CentroEducativo;
		$est->FiltroMunicipio($nombre);
	}
	if(isset($_POST['id'])){
		$id = $_POST['id'];
		$est = new CL_CentroEducativo;
		$est->ObtenerEstablecimiento($id);
	}
	if(isset($_POST['idArray'])){
		$id = array();
		$id = $_POST['idArray'];
		$est = new CL_CentroEducativo;
		$est->Comparar($id);
	}
?>