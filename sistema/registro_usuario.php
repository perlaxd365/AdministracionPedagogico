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
		if(empty($_POST['nombre']) || empty($_POST['correo']) || empty($_POST['DNI']) || empty($_POST['grado-academico']) || empty($_POST['titulo-profesional']) || empty($_POST['exp-profesional']) || empty($_POST['exp-gestion']) || empty($_POST['exp-inv-desa']) || empty($_POST['horas-cap'])|| empty($_POST['id_cargo']))
		{
			$alert='<p class="msg_error">Todos los campos son obligatorios.</p>';
		}else{

			$nombre = $_POST['nombre'];
			$email  = $_POST['correo'];
			$dni = $_POST['DNI'];
			$grado_academico = $_POST['grado-academico'];
			$titulo_profesional = $_POST['titulo-profesional'];
			$exp_profesional = $_POST['exp-profesional'];
			$exp_gestion = $_POST['exp-gestion'];
			$exp_inv_desa = $_POST['exp-inv-desa'];
			$horas_cap = $_POST['horas-cap'];
			$id_cargo = $_POST['id_cargo'];


			$query = mysqli_query($conection,"SELECT * FROM personal WHERE dni = '$dni' OR correo = '$email' ");
			$result = mysqli_fetch_array($query);

			if($result > 0){
				$alert='<p class="msg_error">El correo o el usuario ya existe.</p>';
			}else{

$query_insert = mysqli_query($conection,"INSERT INTO personal(nombres,dni,correo,id_cargo,grados_academicos,titulo_profesional,exp_profesional,exp_gestion,exp_ldi,horas_cap,estado)
													VALUES('$nombre','$dni','$email','$id_cargo','$grado_academico','$titulo_profesional','$exp_profesional','$exp_gestion','$exp_inv_desa','$horas_cap','Activo')");
				if($query_insert){
					$alert='<p class="msg_save">Usuario creado correctamente.</p>';
				}else{
					$alert='<p class="msg_error">Error al crear el usuario.</p>';
				}

			}


		}

	}



 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php include "includes/scripts.php"; ?>
	<title>Registro Usuario</title>
</head>
<body>
	<?php include "includes/header.php"; ?>
	<section id="container">
		
		<div class="form_register">
			<h1>Registro usuario</h1>
			<hr>
			<div class="alert"><?php echo isset($alert) ? $alert : ''; ?></div>

			<form action="" method="post">
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" id="nombre" placeholder="Nombres completos">
				<label for="correo">Correo electrónico</label>
				<input type="email" name="correo" id="correo" placeholder="Correo electrónico">
				<label for="DNI">Usuario</label>
				<input type="text" name="DNI" id="DNI" placeholder="DNI">
				<label for="grado-academico">Grado Académico</label>
				<input type="text" name="grado-academico" id="grado-academico" placeholder="Grados Academicos">
				
				<label for="titulo-profesional">Título Profesional</label>
				<input type="text" name="titulo-profesional" id="titulo-profesional" placeholder="Título Profesional">
				
				<label for="exp-profesional">Experiencia Profesional</label>
				<input type="text" name="exp-profesional" id="exp-profesional" placeholder="Experiencia Profesional">

				<label for="exp-gestion">Experiencia Gestión</label>
				<input type="text" name="exp-gestion" id="exp-gestion" placeholder="Experiencia Gestión">

				<label for="exp-inv-desa">Experiencia Investigacion y Desarrollo</label>
				<input type="text" name="exp-inv-desa" id="exp-inv-desa" placeholder="Experiencia Investigacion y Desarrollo">

				<label for="horas-cap">Horas de capacitación</label>
				<input type="text" name="horas-cap" id="horas-cap" placeholder="Horas de los ultimos 3 años">

				<label for="id_cargo">Cargo</label>

				<?php 

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
							<option value="<?php echo $rol["id_cargo"]; ?>"><?php echo $rol["nombre_cargo"] ?></option>
					<?php 
								# code...
							}
							
						}
					 ?>
				</select>
				<input type="submit" value="Crear usuario" class="btn_save">

			</form>


		</div>


	</section>
	<?php include "includes/footer.php"; ?>
</body>
</html>