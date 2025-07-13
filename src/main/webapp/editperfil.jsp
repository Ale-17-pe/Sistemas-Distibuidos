<%-- 
    Document   : editperfil
    Created on : 11 jul. 2025, 7:56:29 p. m.
    Author     : falex
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.apiweb.aresfitnes.Model.Usuario"%>
<%@page import="com.apiweb.aresfitnes.dto.ClienteDTO"%>
<%@page session="true"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogeado");
    ClienteDTO clientedto = (ClienteDTO) session.getAttribute("clientedto");
    if (usuario == null || clientedto == null) {
        response.sendRedirect("login.jsp?error=no_autenticado");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/editperfil.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/HyF.css">
        <link rel="icon" href="Imagenes/usuario.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    </head>

    <body>
        <!-- Header mejorado -->
        <header>
            <div class="logo-container"><a href="Index.html">
                    <img src="Imagenes/logo.png" alt="Logo AresFitness"></a>
            </div>
            <nav>
                <ul>
                    <ul>
                        <li><a href="planes.html">PLANES</a></li>
                        <li><a href="ubi.html">UBICACIÓN</a></li>
                        <li><a href="suple.html">SUPLEMENTOS</a></li>
                        <li><a href="ropa.html">ROPA</a></li>
                        <a href="carrito.jsp    " class="cart-btn-link">
                            <button class="cart-btn" id="cartButton">
                                <div class="cart-btn__icon">
                                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17 18a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2M1 2h3.27l.94 2H20a1 1 0 0 1 1 1c0 .17-.05.34-.12.5l-3.58 6.47c-.34.61-1 1.03-1.8 1.03H8.1l-.9 1.63-.03.12a.25.25 0 0 0 .25.25H19v2H7a2 2 0 0 1-2-2c0-.35.09-.68.24-.96l1.36-2.45L3 4H1V2m6 16a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2m9-7l2.78-5H6.14l2.36 5H16z"/>
                                    </svg>
                                    <span class="cart-count">0</span>
                                </div>
                            </button></a>
                        <a href="login.jsp"><button class="login-btn" id="loginButton">
                                <div class="login-btn__icon">
                                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <!-- Icono de usuario/login -->
                                    <path d="M12 4a4 4 0 0 1 4 4 4 4 0 0 1-4 4 4 4 0 0 1-4-4 4 4 0 0 1 4-4m0 10c4.42 0 8 1.79 8 4v2H4v-2c0-2.21 3.58-4 8-4z"/>
                                    </svg>
                                </div>
                                <div class="login-btn__text">Entrar</div>
                            </button></a>  

                    </ul>
            </nav>
        </header>
        <main class="main-content">
            <section class="perfil-usuario">
                <div class="profile-header">
                    <h1 class="profile-title">Editar información</h1>
                    <div class="avatar-container">
                        <img src="Imagenes/david-gif.gif" alt="Avatar del usuario" class="profile-avatar" width="100" height="100">
                        <button class="avatar-edit-btn" aria-label="Cambiar foto de perfil">
                            <i class="fas fa-camera"></i>
                        </button>
                    </div>
                </div>

                <form class="profile-form" id="profileForm" action="ActualizarPerfilServlet" method="POST">
                    <div class="form-grid">
                        <!-- Campos del formulario con valores prellenados -->
                        <div class="form-field">
                            <label for="nombre" class="form-label">Nombre:</label>
                            <div class="input-container">
                                <input type="text" id="nombre" name="nombre" class="form-input" 
                                       value="<%= clientedto.getNombre()%>" required disabled>
                                <!-- ... -->
                            </div>
                        </div>

                        <div class="form-field">
                            <label for="apellido" class="form-label">Apellido:</label>
                            <div class="input-container">
                                <input type="text" id="apellido" name="apellido" class="form-input" 
                                       value="<%= clientedto.getApellido()%>" required disabled>
                                <!-- ... -->
                            </div>
                        </div>

                        <div class="form-field">
                            <label for="dni" class="form-label">DNI:</label>
                            <div class="input-container">
                                <input type="text" id="dni" name="dni" class="form-input" 
                                       value="<%= usuario.getDni()%>" pattern="[0-9]{8}" required disabled>
                                <!-- ... -->
                            </div>
                        </div>

                        <div class="form-field">
                            <label for="fecha" class="form-label">Fecha de nacimiento:</label>
                            <div class="input-container">
                                <input type="date" id="fecha" name="fechaNacimiento" class="form-input" 
                                       value="<%= clientedto.getFechaNacimiento()%>" required>
                                <!-- ... -->
                            </div>
                        </div>

                        <div class="form-field">
                            <label for="correo" class="form-label">Correo electrónico:</label>
                            <div class="input-container">
                                <input type="email" id="correo" name="correo" class="form-input" 
                                       value="<%= clientedto.getCorreo()%>" required>
                                <!-- ... -->
                            </div>
                        </div>

                        <div class="form-field">
                            <label for="telefono" class="form-label">Teléfono:</label>
                            <div class="input-container">
                                <input type="tel" id="telefono" name="telefono" class="form-input" 
                                       value="<%= clientedto.getTelefono()%>" pattern="[0-9]{9}" required>
                                <!-- ... -->
                            </div>
                        </div>

                        <div class="form-field">
                            <label for="genero" class="form-label">Género:</label>
                            <div class="input-container">
                                <select id="genero" name="genero" class="form-input">
                                    <option value="masculino" <%= "masculino".equals(clientedto.getGenero()) ? "selected" : ""%>>Masculino</option>
                                    <option value="femenino" <%= "femenino".equals(clientedto.getGenero()) ? "selected" : ""%>>Femenino</option>
                                    <option value="prefiero-no-decir" 
                                            <% if ("prefiero-no-decir".equals(clientedto.getGenero()) || clientedto.getGenero() == null) { %>
                                            selected
                                            <% }%>
                                            >Prefiero no decirlo</option>
                                </select>
                                <button type="button" class="edit-btn" aria-label="Editar genero">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                        </div
                        <div class="form-field">
                            <label for="contrasena" class="form-label">Nueva Contraseña:</label>
                            <div class="input-container">
                                <input type="password" id="contrasena" name="contrasena" class="form-input" placeholder="Dejar en blanco para no cambiar">
                                <button type="button" class="edit-btn" aria-label="Editar contraseña">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                        </div>

                        <!-- ... (otros campos) ... -->
                    </div>

                    <div class="form-actions">
                        <a href="portalCliente.jsp">
                            <button type="button" class="secondary-btn">Cancelar</button>
                        </a>
                        <button type="submit" class="primary-btn">Guardar cambios</button>
                    </div>
                </form>        </main>



        <!-- Footer mejorado -->
        <footer>
            <div id="LOGO">
                <div id="logo">
                    <a href="index.html" target="_blank"><img id="logo" src="Imagenes/logo.png" alt="Logo Ares Fitness"><br><br></a>

                    <div class="footer_container">
                        <!-- Sección izquierda: Redes y contacto -->
                        <div class="redes-sociales">
                            <strong>Redes Sociales:</strong><br><br>
                            <a href="#" target="_blank"><img src="Imagenes/FB.png" alt="Facebook" class="icono-red"></a>
                            <a href="https://www.instagram.com/aresfitness.peru/" target="_blank"><img src="Imagenes/Insta.png"
                                                                                                       alt="Instagram" class="icono-red"></a>
                            <a href="#" target="_blank"><img src="Imagenes/Tiktok.png" alt="Tiktok" class="icono-red"></a>
                            <a href="#" target="_blank"><img src="Imagenes/X.png" alt="X" class="icono-red"></a><br>
                            <br><br>
                            <strong>CONTACTANOS:</strong><br><br>
                            <a href="#" target="_blank">
                                <img src="Imagenes/WhatsApp.png" alt="WhatsApp" style="width: 20px; vertical-align: middle;"></a>
                            <br><br>
                            <a href="#" target="_blank">
                                <img src="Imagenes/Gmail.png" alt="Correo" style="width: 20px; vertical-align: middle;"></a>

                        </div>
                        <!-- Sección central: Enlaces -->
                        <div class="footer-section">
                            <a href="#">TERMINOS Y CONDICIONES</a><br><br><br>
                            <a href="#">POLITICAS Y PRIVACIDAD</a><br><br><br>
                            <a href="#">QUEJAS Y RECLAMOS</a>
                        </div>

                        <!-- Sección derecha: soporte y libro -->
                        <div class="footer-section" style="text-align: center;">
                            <a href="#">SOPORTE TECNICO</a><br><br><br>
                            <a href="Index.html">ARES FITNESS</a><br><br><br><br>
                            <span style="color: #00ccff; font-weight: bold;"></span><br>
                            <img src="Imagenes/LibroR.png" alt="Libro de Reclamaciones" style="width: 150px;">
                        </div>
                    </div>
                    <p>&copy; 2023 AresFitness. Todos los derechos reservados.</p>

                    </footer>
                    <script src="${pageContext.request.contextPath}/Js/editperfil.js"></script>                    
                    <script>
                        // Prellenar campos adicionales si es necesario
                        document.addEventListener('DOMContentLoaded', function () {
                            // Campos que no están en el DTO pero podrías tener en sesión
                            const peso = "<%= session.getAttribute("peso") != null ? session.getAttribute("peso") : ""%>";
                            const talla = "<%= session.getAttribute("talla") != null ? session.getAttribute("talla") : ""%>";
                            const objetivos = "<%= session.getAttribute("objetivos") != null ? session.getAttribute("objetivos") : ""%>";

                            if (peso)
                                document.getElementById('peso').value = peso;
                            if (talla)
                                document.getElementById('talla').value = talla;
                            if (objetivos)
                                document.getElementById('objetivos').value = objetivos;
                        });
                    </script>
                    <% if (request.getParameter("error") != null) {%>
                    <div class="error-message">
                        Error: <%= request.getParameter("error")%>
                    </div>
                    <% } %>
                    <% if (request.getParameter("success") != null) {%>
                    <div class="success-message">
                        <%= request.getParameter("success")%>
                    </div>
                    <% }%>

                    </body>

                    </html>
