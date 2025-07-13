<%-- 
    Document   : index
    Created on : 22 jun. 2025, 19:30:39
    Author     : ASPIRE 5 CI7 10MA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    com.apiweb.aresfitnes.Model.Usuario usuario = (com.apiweb.aresfitnes.Model.Usuario) session.getAttribute("usuarioLogeado");
    com.apiweb.aresfitnes.dto.ClienteDTO clientedto = (com.apiweb.aresfitnes.dto.ClienteDTO) session.getAttribute("clientedto");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AresFitness</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/HyF.css">
        <link rel="icon" href="${pageContext.request.contextPath}/Imagenes/logo.png" type="image/png">
        <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    </head>

    <body>
        <header>
            <div class="logo-container">
                <a href="index.jsp">
                    <img src="Imagenes/logo.png" alt="Logo AresFitness">
                </a>
            </div>
            <nav>
                <ul> 
                    <li><a href=mutar.jsp >PLANES</a></li>
                    <li><a href=ubicacion.jsp >UBICACIÓN</a></li>
                    <li><a href=EjerciciosServlet >EJERCICIOS</a></li>
                    <li><a href=EjerciciosServlet1 >mostrar</a></li>
                    <li><a href=planes2.jsp >MENBRESIAS</a></li>
                        <% if (usuario != null) { %>

                    <%
                        String tipo = usuario.getTipoUsuario();
                        if ("cliente".equals(tipo)) {
                    %>
                    <li><a href="portalCliente.jsp">MI PORTAL</a></li>
                        <% } else if ("recepcionista".equals(tipo)) { %>
                    <li><a href="portalRecepcionista.jsp">MI PORTAL</a></li>
                        <% } else if ("administrador".equals(tipo)) { %>
                    <li><a href="portalAdmin.jsp">MI PORTAL</a></li>
                        <% } %>

                    <a href="${pageContext.request.contextPath}/LogoutServlet"><button class="login-btn" id="logoutButton">
                            <div class="login-btn__icon">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <!-- Icono de logout/cerrar sesión -->
                                <path d="M10 4h6v2h-6v3h-2V6H4v12h4v-3h2v3h6v2h-6v-5h-2v5H2V4h8v5h2V4Z" fill="currentColor"/>
                                <path d="m18 12-5-5v3H9v4h4v3l5-5Z" fill="currentColor"/>
                                </svg>
                            </div>
                            <div class="login-btn__text">Salir</div>
                        </button></a>

                    <% } else { %>
                    <a href="login.jsp"><button class="login-btn" id="loginButton">
                            <div class="login-btn__icon">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <!-- Icono de usuario/login -->
                                <path d="M12 4a4 4 0 0 1 4 4 4 4 0 0 1-4 4 4 4 0 0 1-4-4 4 4 0 0 1 4-4m0 10c4.42 0 8 1.79 8 4v2H4v-2c0-2.21 3.58-4 8-4z"/>
                                </svg>
                            </div>
                            <div class="login-btn__text">Entrar</div>
                        </button></a>  
                        <% }%>
                    <a href="carrito.jsp    " class="cart-btn-link">
                        <button class="cart-btn" id="cartButton">
                            <div class="cart-btn__icon">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M17 18a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2M1 2h3.27l.94 2H20a1 1 0 0 1 1 1c0 .17-.05.34-.12.5l-3.58 6.47c-.34.61-1 1.03-1.8 1.03H8.1l-.9 1.63-.03.12a.25.25 0 0 0 .25.25H19v2H7a2 2 0 0 1-2-2c0-.35.09-.68.24-.96l1.36-2.45L3 4H1V2m6 16a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2m9-7l2.78-5H6.14l2.36 5H16z"/>
                                </svg>
                                <span class="cart-count">0</span>
                            </div>
                        </button></a>
                </ul>
            </nav>
        </header>

        <section>
            <section class="video-background-section">
                <video autoplay muted loop playsinline class="video-background">
                    <source src="Imagenes/video-fondo.mp4" type="video/mp4">
                    <!-- Fallback para navegadores que no soportan video -->
                    <img src="Imagenes/cbum.gif" alt="Fondo Ares Fitness">
                </video>
                <div class="parallax-content">
                    <h1>ARES FITNESS</h1>
                    <h2>Transforma tu cuerpo, transforma tu vida</h2>
                    <p>GRADO PROFESIONAL EN FITNESS Y NUTRICIÓN</p>
                </div>
            </section>
            <div class="top-promo-bar">
                <div class="promo-scroll-container">
                    <!-- Contenido original -->
                    <a href="#"><img src="Imagenes/EL Cambio.png" alt="Oferta proteínas"></a>
                    <a href="#"><img src="Imagenes/Ropa baner.png" alt="Kit entrenamiento"></a>
                    <a href="#"><img src="Imagenes/4.png" alt="Bebida energética"></a>
                    <a href="#"><img src="Imagenes/3.png" alt="Accesorios gym"></a>
                    <a href="#"><img src="Imagenes/5.png" alt="Oferta membresía"></a>
                    <a href="#"><img src="Imagenes/6.png" alt="Clases especiales"></a>

                    <!-- Contenido duplicado (mismo orden) -->
                    <a href="#"><img src="Imagenes/EL Cambio.png" alt="Oferta proteínas"></a>
                    <a href="#"><img src="Imagenes/Ropa baner.png" alt="Kit entrenamiento"></a>
                    <a href="#"><img src="Imagenes/4.png" alt="Bebida energética"></a>
                    <a href="#"><img src="Imagenes/3.png" alt="Accesorios gym"></a>
                    <a href="#"><img src="Imagenes/5.png" alt="Oferta membresía"></a>
                    <a href="#"><img src="Imagenes/6.png" alt="Clases especiales"></a>
                </div>
            </div>
            <!-- Img-1 -->
            <div class="Img-1">
                <img src="Imagenes/Gym-1.png" alt="Gimnasio vista frontal">
                <div>
                    <h2>¿QUIÉNES SOMOS?</h2>
                    <p>En <strong>AresFitness</strong>, somos más que un gimnasio: somos una comunidad apasionada por transformar vidas a través del fitness,
                        la disciplina y la superación personal. Con más de 5 años de experiencia, ofrecemos un enfoque integral para mejorar tu bienestar
                        físico y mental.</p>
                </div>
            </div>

            <!-- Img-2 -->
            <div class="Img-2">
                <div>
                    <h2>¿CUÁNTOS AÑOS TENEMOS?</h2>
                    <p>Llevamos más de <strong>5 años</strong> en el rubro del fitness, acompañando a miles de personas en su camino hacia 
                        una vida más saludable. Nuestra experiencia nos permite brindarte un servicio de calidad con resultados comprobados y un enfoque personalizado.</p>
                </div>
                <img src="Imagenes/Gym-2.png" alt="Clientes en entrenamiento">
            </div>

            <!-- Img-3 -->
            <div class="Img-3">
                <img src="Imagenes/Gym-3.1.PNG" alt="Entrenamiento grupal">
                <div>
                    <h2>¿NUESTROS OBJETIVOS?</h2>
                    <p>En <strong>AresFitness</strong>, buscamos ayudarte a alcanzar tu mejor versión. Nuestro objetivo es ofrecer planes de 
                        entrenamiento accesibles y personalizados, promover un estilo de vida saludable y abrir nuevas sedes para impactar positivamente en
                        más comunidades.</p>
                </div>
            </div>

            <iframe width="800" height="500" src="https://www.youtube.com/embed/riWch046AqI?autoplay=1&mute=1&enablejsapi=1" title="Video presentación AresFitness" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </section>

        <footer>
            <div class="logo-footer">
                <a href="index.jsp" target="_blank">
                    <img src="Imagenes/logo.png" alt="Logo AresFitness"><br><br>
                </a>
            </div>

            <div class="footer_container">
                <!-- Redes sociales -->
                <div class="redes-sociales">
                    <strong>Redes Sociales:</strong><br><br>
                    <a href="#" target="_blank"><img src="Imagenes/FB.png" alt="Facebook" class="icono-red"></a>
                    <a href="https://www.instagram.com/aresfitness.peru/" target="_blank"><img src="Imagenes/Insta.png" alt="Instagram" class="icono-red"></a>
                    <a href="#" target="_blank"><img src="Imagenes/Tiktok.png" alt="Tiktok" class="icono-red"></a>
                    <a href="#" target="_blank"><img src="Imagenes/X.png" alt="X" class="icono-red"></a>
                    <br><br>
                    <strong>CONTÁCTANOS:</strong><br><br>
                    <a href="#" target="_blank"><img src="Imagenes/WhatsApp.png" alt="WhatsApp" style="width: 20px; vertical-align: middle;"></a><br><br>
                    <a href="#" target="_blank"><img src="Imagenes/Gmail.png" alt="Correo electrónico" style="width: 20px; vertical-align: middle;"></a> 
                </div>

                <!-- Enlaces -->
                <div class="footer-section">
                    <a href="#">TÉRMINOS Y CONDICIONES</a><br><br><br>
                    <a href="#">POLÍTICAS Y PRIVACIDAD</a><br><br><br>
                    <a href="#">QUEJAS Y RECLAMOS</a>
                </div>

                <!-- Soporte -->
                <div class="footer-section" style="text-align: center;">
                    <a href="#">SOPORTE TÉCNICO</a><br><br><br>
                    <a href="index.jsp">ARES FITNESS</a><br><br><br><br>
                    <img src="Imagenes/LibroR.png" alt="Libro de Reclamaciones" style="width: 150px;">
                </div>
            </div>

            <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
        </footer>

        &nbsp;
    </body>
</html>