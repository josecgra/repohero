<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Comfortaa">
<link rel="stylesheet" type="text/css" href="css/estilos.css">
<title>Editar Usuario</title>
</head>
<body>

	<%
		Usuario u = (Usuario) request.getAttribute("usuario");		
	%>
	<form action="Control" method="POST" enctype="multipart/form-data" style="margin: 100px auto">
		<img src="img/eoi.png">
		<hr>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputNombre4">Nombre</label> <input type="text"
					class="form-control" id="inputNombre4" name="nombre" value="<%=u.getNombre() %>"
					placeholder="Nombre">
			</div>
			<div class="form-group col-md-6">
				<label for="inputApellidos4">Apellidos</label> <input type="text"
					class="form-control" id="inputApellidos4" name="apellidos" value="<%=u.getApellidos() %>"
					placeholder="Apellidos">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputFecha4">Fecha Nacimiento</label> <input type="date"
					class="form-control" id="inputDate4" name="fecnacimiento" value="<%=u.getFecnacimiento() %>"
					placeholder="Fecha Nacimiento">
			</div>
			<div class="form-group col-md-6">
				<label for="Select1">Rol</label> <select class="form-control"
					id="select1" name="rol">
					<option>Admin</option>
					<option>Visitante</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail4">Email</label> <input type="email"
				class="form-control" id="inputEmail4" name="email" placeholder="Email" value="<%=u.getEmail() %>">
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputPassword4">Password</label> <input type="password"
					class="form-control" id="inputPassword4" name="password" placeholder="Password">
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword5">Confirmar Password</label> <input
					type="password" class="form-control" id="inputPassword5"
					placeholder="Repite Password">
			</div>
		</div>
		<div class="form-row">&nbsp;</div>
		<div class="custom-file">
			<input type="hidden" name="opcion" value="e">
			<input type="file" class="custom-file-input" name="foto" id="customFile">
			<label class="custom-file-label" for="customFile">Foto</label>
		</div>
		<div class="form-row">&nbsp;</div>
		<input type="hidden" name="idusuario" value="<%=u.getIdusuario() %>">
		<button type="submit" class="btn btn-secondary btn-block">Guardar Datos</button>
	</form>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>

</body>
</html>