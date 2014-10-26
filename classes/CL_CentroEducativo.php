<?php
	function getEstablecimiento($id){
			include('includes/connect.php');
			$cursor = oci_new_cursor($connect);
			$sql = "BEGIN OBTENER_ESTABLECIMIENTO_ID(:id, :cursor); END;";
			$procedure = oci_parse($connect,$sql);
			oci_bind_by_name($procedure, ":id", $id);
			oci_bind_by_name($procedure, ":cursor", $cursor, -1, OCI_B_CURSOR);
			oci_execute($procedure);
			oci_execute($cursor);
			if(($row = oci_fetch_array($cursor, OCI_ASSOC+OCI_RETURN_NULLS)) != false){
				echo $row['NOMBRE'];
			}
			oci_free_statement($procedure);
			oci_free_statement($cursor);
			oci_close($connect);
		}
	class CL_CentroEducativo{
		public function FiltroMunicipio($nombre){
			include('includes/connect.php');
			$cursor = oci_new_cursor($connect);
			$sql = "BEGIN FILTRO_POR_MUNICIPIO(:nombre, :cursor); END;";
			$procedure = oci_parse($connect,$sql);
			oci_bind_by_name($procedure, ":nombre", $nombre);
			oci_bind_by_name($procedure, ":cursor", $cursor, -1, OCI_B_CURSOR);
			oci_execute($procedure);
			oci_execute($cursor);
			while (($row = oci_fetch_array($cursor, OCI_ASSOC+OCI_RETURN_NULLS)) != false) {
				?>
					<span>
						<input type="checkbox" name="centros[]" value="<?php echo $row['ID']; ?>"/>
						<h5>
							<?php echo $row['NOMBRE_E']; ?>
						</h5>
						<p>
							<?php echo $row['DIRECCION_E']; ?>
						</p>
						<p>
							<a id="click" onclick="info(<?php echo $row['ID']; ?>);" href="#">Ver m&aacute;s...</a>
						</p>
					</span>
				<?php
			}
			oci_free_statement($procedure);
			oci_free_statement($cursor);
			oci_close($connect);
		}
		
		public function ObtenerEstablecimiento($id){
			include('includes/connect.php');
			$cursor = oci_new_cursor($connect);
			$sql = "BEGIN OBTENER_ESTABLECIMIENTO(:id, :cursor); END;";
			$procedure = oci_parse($connect,$sql);
			oci_bind_by_name($procedure, ":id", $id);
			oci_bind_by_name($procedure, ":cursor", $cursor, -1, OCI_B_CURSOR);
			oci_execute($procedure);
			oci_execute($cursor);
			if(($row = oci_fetch_array($cursor, OCI_ASSOC+OCI_RETURN_NULLS)) != false){
				?>
					<p class="codEst"><?php echo $row['COD']; ?></p>
					<p class="nomEst"><?php echo $row['NOMBRE_E']; ?></p>
					<p class="dirEst"><?php echo $row['DIRECCION_E']; ?></p>
					<p class="telEst"><?php echo $row['TELEFONO_E']; ?></p>
					<p class="secEst"><?php echo $row['SECTOR']; ?></p>
					<p class="plaEst"><?php echo $row['PLAN']; ?></p>
					<p class="jorEst"><?php echo $row['JORNADA']; ?></p>
					<p class="modEst"><?php echo $row['MODALIDAD']; ?></p>
				<?php
			}
			oci_free_statement($procedure);
			oci_free_statement($cursor);
			oci_close($connect);
		}
		
		// Comparación
		public function Comparar($id){
			$size = count($id);
			?>
			<table>
				<tr>
					<td>Establecimiento</td>
					<td class="vertical_text">Cancha</td>
					<td class="vertical_text">Piscina</td>
					<td class="vertical_text">Laboratorio de F&iacute;sica</td>
					<td class="vertical_text">Laboratorio de Computaci&oacute;n</td>
					<td class="vertical_text">Laboratorio de Qu&iacute;mica</td>
				</tr>
				<tr>
				<?php
			for($x = 0; $x < $size; $x++){
				include('includes/connect.php');
				$cursor = oci_new_cursor($connect);
				$sql = "BEGIN COMPARAR(:id, :cursor); END;";
				$procedure = oci_parse($connect,$sql);
				oci_bind_by_name($procedure, ":id", $id[$x]);
				oci_bind_by_name($procedure, ":cursor", $cursor, -1, OCI_B_CURSOR);
				oci_execute($procedure);
				oci_execute($cursor);
						if(($row = oci_fetch_array($cursor, OCI_ASSOC+OCI_RETURN_NULLS)) != false){
						?>
							<td><?php echo $row['NOMBRE_E']; ?></td>
							<td>
								<img src="<?php
									if($row['CANCHA']==1){
										echo "images/tick_64.png";
									} else {
										echo "images/delete_64.png";
									}
								?>" class="check_image">
							</td>
							<td>
								<img src="<?php
									if($row['PISCINA']==1){
										echo "images/tick_64.png";
									} else {
										echo "images/delete_64.png";
									}
								?>" class="check_image">
							</td>
							<td>
								<img src="<?php
									if($row['PISCINA']==1){
										echo "images/tick_64.png";
									} else {
										echo "images/delete_64.png";
									}
								?>" class="check_image">
							</td>
							<td>
								<img src="<?php
									if($row['PISCINA']==1){
										echo "images/tick_64.png";
									} else {
										echo "images/delete_64.png";
									}
								?>" class="check_image">
							</td>
							<td>
								<img src="<?php
									if($row['PISCINA']==1){
										echo "images/tick_64.png";
									} else {
										echo "/images/delete_64.png";
									}
								?>" class="check_image"></td>
						<?php
						} else {
						
						
						?>
							<tr>
								<td>
									<?php getEstablecimiento($id[$x]); ?></td>
								<td>
									<img src="images/delete_64.png" class="check_image">
								</td>
								<td>
									<img src="images/delete_64.png" class="check_image">
								</td>
								<td>
									<img src="images/delete_64.png" class="check_image">
								</td>
								<td>
									<img src="images/delete_64.png" class="check_image">
								</td>
								<td>
									<img src="images/delete_64.png" class="check_image">
								</td>
							</tr>
						<?php
						}
				oci_free_statement($procedure);
				oci_free_statement($cursor);
				oci_close($connect);
			}
			?>
				</tr>
			</table>
			<?php
		}
	}
?>