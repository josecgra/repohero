<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Datos del Formulario</title>
</head>
<style>
	table {
		border: 1px solid;
		width: 100%;
	}
	td, th {
		border: 1px solid;
	}
	th {
		height: 50px;
	}	
	.cabecera {
		font-weight: bold;
		background-color: yellow;
	}

</style>
<body>
	<h1>Datos del Formulario</h1>
	<table>
		<tr class="cabecera">
			<th>Nombre</th>
			<th>Email</th>
			<th>URL</th>
			<th>Fecha</th>
			<th>Hora</th>
			<th>Fecha y Hora</th>
			<th>Mes</th>
			<th>Semana</th>
			<th>Numero</th>
			<th>Telefono</th>
			<th>Termino</th>
			<th>Color</th>
		</tr>
		<tr>
			<td><%=request.getParameter("name_control") %></td>
			<td><%=request.getParameter("email_control") %></td>
			<td><%=request.getParameter("url_control") %></td>
			<td><%=request.getParameter("date_control") %></td>
			<td><%=request.getParameter("time_control") %></td>
			<td><%=request.getParameter("datetime_control") %></td>
			<td><%=request.getParameter("month_control") %></td>
			<td><%=request.getParameter("week_control") %></td>
			<td><%=request.getParameter("number_control") %></td>
			<td><%=request.getParameter("tel_control") %></td>
			<td><%=request.getParameter("search_control") %></td>
			<td><%=request.getParameter("color_control") %></td>		
		</tr>
	</table>
</body>
</html>