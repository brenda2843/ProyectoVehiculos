import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/VehiculoServlet")
public class VehiculoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VehiculoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String cedula = request.getParameter("cedula");
        String placa = request.getParameter("placa");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");

        if(nombre == null) nombre = "";
        if(cedula == null) cedula = "";
        if(placa == null) placa = "";
        if(marca == null) marca = "";
        if(modelo == null) modelo = "";

        HttpSession session = request.getSession();

        ArrayList<String> placasRegistradas = (ArrayList<String>) session.getAttribute("placas");
        ArrayList<String> cedulasRegistradas = (ArrayList<String>) session.getAttribute("cedulas");

        if(placasRegistradas == null) placasRegistradas = new ArrayList<String>();
        if(cedulasRegistradas == null) cedulasRegistradas = new ArrayList<String>();

        boolean placaDuplicada = placasRegistradas.contains(placa.toUpperCase());
        boolean cedulaDuplicada = cedulasRegistradas.contains(cedula);

        if(placaDuplicada) {
            request.setAttribute("error", "La placa " + placa.toUpperCase() + " ya fue registrada.");
        } else if(cedulaDuplicada) {
            request.setAttribute("error", "La cedula " + cedula + " ya fue registrada.");
        } else {
            placasRegistradas.add(placa.toUpperCase());
            cedulasRegistradas.add(cedula);
            session.setAttribute("placas", placasRegistradas);
            session.setAttribute("cedulas", cedulasRegistradas);
            request.setAttribute("nombre", nombre);
            request.setAttribute("cedula", cedula);
            request.setAttribute("placa", placa.toUpperCase());
            request.setAttribute("marca", marca);
            request.setAttribute("modelo", modelo);
        }

        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }
}