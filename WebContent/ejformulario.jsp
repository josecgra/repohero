<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="crudjava.eoi.servicio.Conexion"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario de inicio</title>
</head>
<body>
<form action="registro.jsp" method="get" accept-charset="UTF-8">
<p>
Nombre: <input type="text" name="name_control" autofocus required />
</p>

<p>
Correo electr�nico: <input type="email" name="email_control" required />
</p>

<p>
URL: <input type="url" name="url_control" placeholder="Escribe la URL de tu p�gina web personal" />
</p>

<p>
Fecha: <input type="date" name="date_control" />
</p>

<p>
Tiempo: <input type="time" name="time_control" />
</p>

<p>
Fecha y hora: <input type="datetime-local" name="datetime_control" />
</p>

<p>
Mes: <input type="month" name="month_control" />
</p>

<p>
Semana: <input type="week" name="week_control" />
</p>

<p>
N�mero (min -10, max 10): <input type="number" name="number_control" min="-10" max="10" value="0" />
</p>

<p>
Tel�fono: <input type="tel" name="tel_control" />
</p>

<p>
T�rmino de b�squeda: <input type="search" name="search_control" />
</p>

<p>
Color favorito: <input type="color" name="color_control" />
</p>

<p>
<input type="submit" value="Enviar" />
</p>
</form>
	

	
</body>
</html>