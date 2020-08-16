<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="es.eoi.servicios.Conexion"%>
<%@ page import="java.sql.*"%>
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
<title>Home - EOI</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light">
		<a class="navbar-brand" href="#"><img src="img/eoi.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Registro</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
			</ul>
			<span class="navbar-text"> Bienvenido <%=session.getAttribute("nomusuario")%>
			</span>
		</div>
	</nav>

	<div class="container-fluid">

		<table class="table table-bordered">
			<caption>Usuarios Registrados</caption>
			<thead>
				<tr>
					<th scope="col">idUsuario</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellidos</th>
					<th scope="col">Fecha Alta</th>
					<th scope="col">Fecha Nacimiento</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Rol</th>
				</tr>
			</thead>
			<%
				Connection con = Conexion.getInstance().getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * from usuarios");
			ResultSet rs = ps.executeQuery();
			%>
			<tbody>
			<%
					while (rs.next()) {
			%>
				<tr>
					<td scope="col">10000</td>
					<td scope="col"><%=rs.getString("nombre")%></td>
					<td scope="col"><%=rs.getString("apellidos")%></td>
					<td scope="col"><%=rs.getTimestamp("fecalta")%></td>
					<td scope="col"><%=rs.getDate("fecnacimiento")%></td>
					<td scope="col"><%=rs.getString("email")%></td>
					<td scope="col"><%=rs.getString("password")%></td>
					<td scope="col"><%=rs.getString("rol")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>


		<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>
</html>