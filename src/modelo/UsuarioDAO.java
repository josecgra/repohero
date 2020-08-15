package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import es.eoi.servicios.Conexion;

public class UsuarioDAO {
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public Usuario login(String email, String password) throws SQLException {
		
		String sql = "SELECT * FROM usuarios WHERE email = ? and password = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, email);
		pst.setString(2, password);
		
		rs = pst.executeQuery();
		
		Usuario usu = null;
		
		if (rs.next()) {
			usu = new Usuario();
			usu.setIdusuario(Integer.parseInt(rs.getString("idusuario")));
			usu.setNombre(rs.getString("nombre"));
			usu.setApellidos(rs.getString("apellidos"));
			usu.setEmail(rs.getString("email"));
			usu.setPassword(rs.getString("password"));
			usu.setFecnacimiento(rs.getDate("fecnacimiento"));
			usu.setRol(rs.getString("rol"));
		}
		
		
		return usu;
	}
	
}
