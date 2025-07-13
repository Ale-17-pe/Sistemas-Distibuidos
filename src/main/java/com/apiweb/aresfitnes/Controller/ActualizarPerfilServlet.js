package com.apiweb.aresfitnes.Controller;
import com.apiweb.aresfitnes.Model.Cliente;
import com.apiweb.aresfitnes.Model.Usuario;
import com.apiweb.aresfitnes.Service.ClienteService;
import com.apiweb.aresfitnes.dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
        @WebServlet("/ActualizarPerfilServlet")
        public class ActualizarPerfilServlet extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

                HttpSession session = request.getSession();
                        Usuario usuario = (Usuario) session.getAttribute("usuarioLogeado");
                        ClienteDTO clientedto = (ClienteDTO) session.getAttribute("clientedto");
                        if (usuario == null || clientedto == null) {
                response.sendRedirect("login.jsp?error=no_autenticado");
                        return;
                }

                try {
                // Obtener parámetros del formulario
                String correo = request.getParameter("correo");
                        String telefono = request.getParameter("telefono");
                        String genero = request.getParameter("genero");
                        String contrasena = request.getParameter("contrasena");
                        Date fechaNacimiento = Date.valueOf(request.getParameter("fechaNacimiento"));
                        // Validaciones básicas
                        if (correo == null || correo.isEmpty() || telefono == null || telefono.isEmpty()) {
                response.sendRedirect("editperfil.jsp?error=campos_requeridos");
                        return;
                }

                // Actualizar datos del cliente
                clientedto.setCorreo(correo);
                        clientedto.setTelefono(telefono);
                        clientedto.setGenero(genero);
                        clientedto.setFechaNacimiento(fechaNacimiento);
                        // Actualizar contraseña si se proporcionó
                        if (contrasena != null && !contrasena.isEmpty()) {
                usuario.setContraseña(contrasena); // Asegúrate de hashear la contraseña
                }

                // Guardar cambios en la base de datos (ejemplo con ClienteService)
                ClienteService clienteService = new ClienteService();
                        boolean actualizado = clienteService.actualizarCliente(clientedto, usuario);
                        if (actualizado) {
                // Actualizar datos en sesión
                session.setAttribute("clientedto", clientedto);
                        session.setAttribute("usuarioLogeado", usuario);
                        response.sendRedirect("portalCliente.jsp?success=perfil_actualizado");
                } else {
                response.sendRedirect("editperfil.jsp?error=error_actualizacion");
                }

                } catch (Exception e) {
                e.printStackTrace();
                        response.sendRedirect("editperfil.jsp?error=error_servidor");
                }
                }

        @Override
                protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                processRequest(request, response);
                }
         // Dentro de tu ActualizarPerfilServlet
ClienteService clienteService = new ClienteService();

// Obtener parámetros del formulario
String correo = request.getParameter("correo");
String telefono = request.getParameter("telefono");
String genero = request.getParameter("genero");
String contrasena = request.getParameter("contrasena");
Date fechaNacimiento = Date.valueOf(request.getParameter("fechaNacimiento"));

// Actualizar objetos
clienteDTO.setCorreo(correo);
clienteDTO.setTelefono(telefono);
clienteDTO.setGenero(genero);
clienteDTO.setFechaNacimiento(fechaNacimiento);

if (contrasena != null && !contrasena.isEmpty()) {
    usuario.setContraseña(contrasena);
}

// Llamar al servicio
boolean actualizado = clienteService.actualizarCliente(clienteDTO, usuario);
        }