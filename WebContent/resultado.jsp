<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="crudjava.eoi.servicio.Conexion"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro del usuario</title>
</head>
<body>
	<table>
		
		<tr>
			<td>Nombre</td>
			<td>Apellidos</td>
			<td>Email</td>
			<td>Password</td>
			<td>Fecha Nacimiento</td>
			<td>Foto</td>
			<td>Fecha de Alta</td>
			<td>Rol</td>
		</tr>
<% 		
		Connection con = Conexion.getInstance().getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * from usuarios");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
%>
		<tr>
			<td><%= rs.getString("nombre")%></td>
			<td><%= rs.getString("apellidos")%></td>
			<td><%= rs.getString("email")%></td>
			<td><%= rs.getString("password")%></td>
			<td><%= rs.getDate("fecnacimiento")%></td>
			<td><%= rs.getBlob("foto")%></td>
			<td><%= rs.getTimestamp("fecalta")%></td>
			<td><%= rs.getString("rol")%></td>
		</tr>
<%
		}
%>
		
	</table>
</body>
</html>