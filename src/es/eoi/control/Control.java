package es.eoi.control;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
@MultipartConfig(maxFileSize = 16177215)
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String opcion = request.getParameter("opcion");
		RequestDispatcher dispatcher;
		int id = 0;
		UsuarioDAO udao;
		String destPage = "index.jsp";

		switch (opcion) {
		case "eliminar":
			id = Integer.parseInt(request.getParameter("id"));
			udao = new UsuarioDAO();
			try {
				udao.eliminar(id);
				destPage = "home.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "editar":
			id = Integer.parseInt(request.getParameter("id"));
			udao = new UsuarioDAO();
			try {
				request.setAttribute("usuario", udao.getUsuario(id));
				destPage = "editar.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		}

		dispatcher = request.getRequestDispatcher(destPage);
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String opcion = request.getParameter("opcion");
		int idusuario = 0;
		if (opcion.equals("e"))
			idusuario = Integer.parseInt(request.getParameter("idusuario"));
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		Date fecnacimiento = Date.valueOf(request.getParameter("fecnacimiento").toString());
		String rol = request.getParameter("rol");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Part fotoPart = request.getPart("foto");
		// String filePath = request.getSession().getServletContext().getRealPath("/") +
		// "fotos\\";
		String filePath = request.getSession().getServletContext().getRealPath("/") + "fotos/";
		String fileName = "";
		File uploadDir = new File(filePath);

		if (fotoPart.getSubmittedFileName() != "") {
			if (!uploadDir.exists())
				uploadDir.mkdirs();
			for (Part part : request.getParts()) {
				if (part.getName().equals("foto")) {
					fileName = fotoPart.getSubmittedFileName();
					part.write(filePath + File.separator + fileName);
				}
			}
		}

		Usuario usuario = new Usuario();

		usuario.setApellidos(apellidos);
		usuario.setEmail(email);
		usuario.setFecnacimiento(fecnacimiento);
		usuario.setNombre(nombre);
		usuario.setRol(rol);
		usuario.setPassword(password);
		usuario.setFoto(fileName);

		UsuarioDAO udao = new UsuarioDAO();

		try {
			if (opcion.equals("a"))
				udao.alta(usuario);
			if (opcion.equals("e")) {
				usuario.setIdusuario(idusuario);
				udao.modificar(usuario);
			}
			String destPage = "index.jsp";

			if (usuario != null) {
				HttpSession session = request.getSession();
				session.setAttribute("nomusuario", usuario.getNombre() + " " + usuario.getApellidos());
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
