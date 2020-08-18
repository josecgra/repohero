package es.eoi.control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		Date fecnacimiento=Date.valueOf(request.getParameter("fecnacimiento").toString());	
		String rol = request.getParameter("rol");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String foto = request.getParameter("foto");
		
		
		Usuario usuario = new Usuario();
		
		usuario.setApellidos(apellidos);
		usuario.setEmail(email);
		usuario.setFecnacimiento(fecnacimiento);
		usuario.setNombre(nombre);
		usuario.setRol(rol);
		usuario.setPassword(password);
		usuario.setFoto(foto);
		
		UsuarioDAO udao = new UsuarioDAO();

		try {
			udao.alta(usuario);
			String destPage = "index.jsp";

			if (usuario != null) {
				HttpSession session = request.getSession();
				session.setAttribute("nomusuario", usuario.getNombre()+ " " +usuario.getApellidos());
				session.setAttribute("rol", usuario.getRol());
				destPage = "home.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
