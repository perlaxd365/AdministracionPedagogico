<?php 
	
	session_start();
	if($_SESSION['rol'] != 1)
	{
		header("location: ./");
	}

	include "../conexion.php";

	if(!empty($_POST))
	{
		$alert='';
		if(empty($_POST['nombre']) || empty($_POST['correo']) || empty($_POST['usuario'])  || empty($_POST['rol']))
		{
			$alert='<p class="msg_error">Todos los campos son obligatorios.</p>';
		}else{

			$idUsuario = $_POST['idUsuario'];
			$nombre = $_POST['nombre'];
			$email  = $_POST['correo'];
			$user   = $_POST['usuario'];
			$clave  = md5($_POST['clave']);
			$rol    = $_POST['rol'];


			$query = mysqli_query($conection,"SELECT * FROM usuario 
													   WHERE (usuario = '$user' AND idusuario != $idUsuario)
													   OR (correo = '$email' AND idusuario != $idUsuario) ");

			$result = mysqli_fetch_array($query);

			if($result > 0){
				$alert='<p class="msg_error">El correo o el usuario ya existe.</p>';
			}else{

				if(empty($_POST['clave']))
				{

					$sql_update = mysqli_query($conection,"UPDATE usuario
															SET nombre = '$nombre', correo='$email',usuario='$user',rol='$rol'
															WHERE idusuario= $idUsuario ");
				}else{
					$sql_update = mysqli_query($conection,"UPDATE usuario
															SET nombre = '$nombre', correo='$email',usuario='$user',clave='$clave', rol='$rol'
															WHERE idusuario= $idUsuario ");

				}

				if($sql_update){
					$alert='<p class="msg_save">Usuario actualizado correctamente.</p>';
				}else{
					$alert='<p class="msg_error">Error al actualizar el usuario.</p>';
				}

			}


		}

	}

	//Mostrar Datos
	if(empty($_REQUEST['id']))
	{
		header('Location: lista_usuarios.php');
		mysqli_close($conection);
	}
	$iduser = $_REQUEST['id'];

	$sql= mysqli_query($conection,"SELECT pe.id_cargo, id_personal, pe.nombres,pe.dni,pe.correo, ca.nombre_cargo,pe.grados_academicos,pe.titulo_profesional,pe.exp_profesional,pe.exp_gestion,pe.exp_ldi,pe.horas_cap
								  FROM personal pe INNER JOIN cargo ca ON pe.id_cargo=ca.id_cargo
									WHERE id_personal= $iduser ");
	mysqli_close($conection);
	$result_sql = mysqli_num_rows($sql);

	if($result_sql == 0){
		header('Location: lista_usuarios.php');
	}else{
		$option = '';
		while ($data = mysqli_fetch_array($sql)) {
			# code...
			$iduser  = $data['id_personal'];
			$nombre  = $data['nombres'];
			$correo  = $data['correo'];
			$dni = $data['dni'];
			$id_cargo   = $data['id_cargo'];
			$grados_academicos= $data['grados_academicos'];
			$titulo_profesional = $data['titulo_profesional'];
			$exp_profesional = $data['exp_profesional'];
			$exp_gestion = $data['exp_gestion'];
			$exp_ldi = $data['exp_ldi'];
			$horas_cap = $data['horas_cap'];
			



		}
	}

 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php include "includes/scripts.php"; ?>
	<title>Actualizar Usuario</title>
</head>
<body>
	<?php include "includes/header.php"; ?>
	<section id="container">
		
		<div class="form_register">
			<h1>Actualizar usuario</h1>
			<hr>
			<div class="alert"><?php echo isset($alert) ? $alert : ''; ?></div>

			<form action="" method="post">
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" id="nombre" placeholder="Nombres completos" value="<?php echo $nombre ?>">
				
				<label for="correo">Correo electrónico</label>
				<input type="email" name="correo" id="correo" placeholder="Correo electrónico" value="<?php echo $correo ?>">
				
				<label for="DNI">Usuario</label>
				<input type="text" name="DNI" id="DNI" placeholder="DNI" value="<?php echo $dni ?>">

				<label for="grado-academico">Grado Académico</label>
				<input type="text" name="grado-academico" id="grado-academico" placeholder="Grados Academicos" value="<?php echo $grados_academicos ?>">
				
				<label for="titulo-profesional">Título Profesional</label>
				<input type="text" name="titulo-profesional" id="titulo-profesional" placeholder="Título Profesional" value="<?php echo $titulo_profesional ?>">
				
				<label for="exp-profesional">Experiencia Profesional</label>
				<input type="text" name="exp-profesional" id="exp-profesional" placeholder="Experiencia Profesional" value="<?php echo $exp_profesional ?>">

				<label for="exp-gestion">Experiencia Gestión</label>
				<input type="text" name="exp-gestion" id="exp-gestion" placeholder="Experiencia Gestión" value="<?php echo $exp_gestion ?>">

				<label for="exp-inv-desa">Experiencia Investigacion y Desarrollo</label>
				<input type="text" name="exp-inv-desa" id="exp-inv-desa" placeholder="Experiencia Investigacion y Desarrollo" value="<?php echo $exp_ldi ?>">

				<label for="horas-cap">Horas de capacitación</label>
				<input type="text" name="horas-cap" id="horas-cap" placeholder="Horas de los ultimos 3 años" value="<?php echo $horas_cap ?>">

				<label for="id_cargo">Cargo</label>

				<?php 
					include "../conexion.php";
					$query_rol = mysqli_query($conection,"SELECT * FROM Cargo");
					mysqli_close($conection);
					$result_rol = mysqli_num_rows($query_rol);

				 ?>

				<select name="id_cargo" id="id_cargo">
					<?php 
						if($result_rol > 0)
						{
							while ($rol = mysqli_fetch_array($query_rol)) {
					?>
							<option <?php if($id_cargo==$rol['id_cargo']){echo "selected";} ?> value="<?php echo $rol["id_cargo"]; ?>"><?php echo $rol["nombre_cargo"] ?></option>
					<?php 
								# code...
							}
							
						}
					 ?>
				</select>


				

			
				<input type="submit" value="Actualizar usuario" class="btn_save">

			</form>


		</div>


	</section>
	<?php include "includes/footer.php"; ?>
</body>
</html>