<?php 
	session_start();
	if($_SESSION['rol'] != 1)
	{
		header("location: ./");
	}
	
	include "../conexion.php";	

 ?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php include "includes/scripts.php"; ?>
	<title>Lista de usuarios</title>
</head>
<body>
	<?php include "includes/header.php"; ?>
	<section id="container">
		
		<h1>Lista de usuarios</h1>
		<a href="registro_usuario.php" class="btn_new">Crear usuario</a>
		
		<form action="buscar_usuario.php" method="get" class="form_search">
			<input type="text" name="busqueda" id="busqueda" placeholder="Buscar">
			<input type="submit" value="Buscar" class="btn_search">
		</form>

		<table>
			<tr>
				<th>ID</th>
				<th>Nombres</th>
				<th>DNI</th>
				<th>Correo</th>
				<th>Cargo</th>
				<th>Grado Académico</th>
				<th>Título Profesional</th>
				<th>Exp. Profesional</th>
				<th>Exp. en Gestion</th>
				<th>Exp. Inv. y Des.</th>
				<th>Horas de Capacitacion</th>
				<th>Acciones</th>
				
			</tr>
		<?php 
			//Paginador
			$sql_registe = mysqli_query($conection,"SELECT COUNT(*) as total_registro FROM personal WHERE estado = 'Activo' ");
			$result_register = mysqli_fetch_array($sql_registe);
			$total_registro = $result_register['total_registro'];

			$por_pagina = 5;

			if(empty($_GET['pagina']))
			{
				$pagina = 1;
			}else{
				$pagina = $_GET['pagina'];
			}

			$desde = ($pagina-1) * $por_pagina;
			$total_paginas = ceil($total_registro / $por_pagina);

			$query = mysqli_query($conection,"SELECT id_personal, pe.nombres,pe.dni,pe.correo, ca.nombre_cargo,pe.grados_academicos,pe.titulo_profesional,pe.exp_profesional,pe.exp_gestion,pe.exp_ldi,pe.horas_cap  FROM personal pe INNER JOIN cargo ca ON pe.id_cargo=ca.id_cargo WHERE estado='Activo' ORDER BY pe.id_personal ASC LIMIT $desde,$por_pagina 
				");

			mysqli_close($conection);

			$result = mysqli_num_rows($query);
			if($result > 0){

				while ($data = mysqli_fetch_array($query)) {
					
			?>


				<tr>
					<td><?php echo $data["id_personal"]; ?></td>
					<td><?php echo $data["nombres"]; ?></td>
					<td><?php echo $data["dni"]; ?></td>
					<td><?php echo $data["correo"]; ?></td>
					<td><?php echo $data['nombre_cargo'] ?></td>
					<td><?php echo $data['grados_academicos'] ?></td>
					<td><?php echo $data['titulo_profesional'] ?></td>
					<td><?php echo $data['exp_profesional'] ?></td>
					<td><?php echo $data['exp_gestion'] ?></td>
					<td><?php echo $data['exp_ldi'] ?></td>
					<td><?php echo $data['horas_cap'] ?></td>
					<td>
						<a class="link_edit" href="editar_usuario.php?id=<?php echo $data["id_personal"]; ?>">Editar</a>

					|
						
						<a class="link_delete" href="eliminar_confirmar_usuario.php?id=<?php echo $data["id_personal"]; ?>">Eliminar</a>
					
						
					</td>
				</tr>
			
		<?php 
				}

			}
		 ?>


		</table>
		<div class="paginador">
			<ul>
			<?php 
				if($pagina != 1)
				{
			 ?>
				<li><a href="?pagina=<?php echo 1; ?>">|<</a></li>
				<li><a href="?pagina=<?php echo $pagina-1; ?>"><<</a></li>
			<?php 
				}
				for ($i=1; $i <= $total_paginas; $i++) { 
					# code...
					if($i == $pagina)
					{
						echo '<li class="pageSelected">'.$i.'</li>';
					}else{
						echo '<li><a href="?pagina='.$i.'">'.$i.'</a></li>';
					}
				}

				if($pagina != $total_paginas)
				{
			 ?>
				<li><a href="?pagina=<?php echo $pagina + 1; ?>">>></a></li>
				<li><a href="?pagina=<?php echo $total_paginas; ?> ">>|</a></li>
			<?php } ?>
			</ul>
		</div>


	</section>
	<?php include "includes/footer.php"; ?>
</body>
</html>