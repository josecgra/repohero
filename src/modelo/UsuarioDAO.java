package modelo;

import java.sql.Connection;
import java.sql.Date;
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

		rs.close();
		pst.close();
		con.close();

		return usu;
	}

	public void alta(Usuario u) throws SQLException {

		String sql = "INSERT INTO usuarios (nombre,apellidos,email,password,fecnacimiento,foto,fecalta,rol) VALUES (?,?,?,?,?,?,?,?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, u.getNombre());
		pst.setString(2, u.getApellidos());
		pst.setString(3, u.getEmail());
		pst.setString(4, u.getPassword());
		pst.setDate(5, u.getFecnacimiento());
		pst.setString(6, u.getFoto());
		pst.setDate(7, new Date(System.currentTimeMillis()));
		pst.setString(8, u.getRol());

		pst.executeUpdate();

	}
	
	public void modificar(Usuario u) throws SQLException {

		String sql = "UPDATE usuarios SET nombre=?,apellidos=?,email=?,password=?,fecnacimiento=?,foto=?,fecalta=?,rol=? WHERE idusuario=?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, u.getNombre());
		pst.setString(2, u.getApellidos());
		pst.setString(3, u.getEmail());
		pst.setString(4, u.getPassword());
		pst.setDate(5, u.getFecnacimiento());
		pst.setString(6, u.getFoto());
		pst.setDate(7, new Date(System.currentTimeMillis()));
		pst.setString(8, u.getRol());
		pst.setInt(9, u.getIdusuario());

		pst.executeUpdate();

	}

	public void eliminar(int idusuario) throws SQLException {

		String sql = "DELETE FROM usuarios WHERE idusuario = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, idusuario);

		pst.executeUpdate();

	}

	public Usuario getUsuario(int idusuario) throws SQLException {

		String sql = "SELECT * FROM usuarios WHERE idusuario = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, idusuario);

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

		rs.close();
		pst.close();
		con.close();

		return usu;
	}

}
