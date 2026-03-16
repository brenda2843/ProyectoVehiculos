import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Servlet que maneja la autenticacion de usuarios
@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Usuario y contrasena validos del sistema
    private static final String USUARIO_VALIDO = "admin";
    private static final String CONTRASENA_VALIDA = "1234";

    public AuthServlet() {
        super();
    }

    // Metodo GET - redirige al login
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("auth.jsp");
    }

    // Metodo POST - procesa el login
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener datos del formulario
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Validar que los campos no esten vacios
        if(usuario == null || usuario.trim().isEmpty() ||
           contrasena == null || contrasena.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese usuario y contrasena.");
            request.getRequestDispatcher("auth.jsp").forward(request, response);
            return;
        }

        // Verificar credenciales
        if(usuario.equals(USUARIO_VALIDO) && contrasena.equals(CONTRASENA_VALIDA)) {
            // Autenticacion exitosa - crear sesion
            HttpSession session = request.getSession();
            session.setAttribute("usuarioAutenticado", usuario);
            response.sendRedirect("index.jsp");
        } else {
            // Autenticacion fallida - mostrar error
            request.setAttribute("error", "Usuario o contrasena incorrectos.");
            request.getRequestDispatcher("auth.jsp").forward(request, response);
        }
    }
}