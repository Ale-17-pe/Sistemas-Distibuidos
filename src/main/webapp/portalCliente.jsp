<%-- 
    Document   : portalCliente
    Created on : 22 jun. 2025, 20:57:05
    Author     : ASPIRE 5 CI7 10MA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.apiweb.aresfitnes.Model.Usuario"%>
<%@page import="com.apiweb.aresfitnes.dto.ClienteDTO"%>
<%@page session="true"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogeado");
    ClienteDTO clientedto = (ClienteDTO) session.getAttribute("clientedto");
    if (usuario == null) {
        response.sendRedirect("login.jsp?error=no_autenticado");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi Perfil - AresFitness</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/perfiluser.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/HyF.css">
        <link rel="icon" href="Imagenes/logo.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">

    </head>
    <body>
        <!-- Header -->
        <header>
            <div class="logo-container">
                <a href="index.jsp">
                    <img src="Imagenes/logo.png" alt="Logo AresFitness">
                </a>
            </div>
            <nav>
                <ul>
                    <li><a href="Planes.html">PLANES</a></li>
                    <li><a href="ubi.html">UBICACIÓN</a></li>
                    <a href="${pageContext.request.contextPath}/LogoutServlet"><button class="login-btn" id="logoutButton">
                            <div class="login-btn__icon">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <!-- Icono de logout/cerrar sesión -->
                                <path d="M16 17v-3h-3v-2h3V9l4 3-4 3M11 3c3.9 0 7 3.1 7 7s-3.1 7-7 7c-2.8 0-5.2-1.7-6.3-4H4v2h2.3c.3.9.8 1.8 1.4 2.5C6.5 18.4 4 16 4 13H2c0 4.1 3.2 7.4 7.2 7.9C5.5 21.6 3 18 3 14H1c0 5 4 9 9 9 5.5 0 10-4.5 10-10S16.5 3 11 3z"/>
                                </svg>
                            </div>
                            <div class="login-btn__text">Salir</div>
                        </button></a>
                </ul>
            </nav>
        </header>

        <!-- Perfil -->
        <main class="main-perfil">
            <section class="perfil-panel">
                <div class="perfil-contenedor">

                    <!-- Imagen de perfil -->
                    <div class="perfil-imagen">
                        <div class="imagen-wrapper">
                            <div class="avatar-container">
                                <i class="fas fa-user-circle icono-usuario"></i>
                                <label class="icono-camara">
                                    <i class="fas fa-camera"></i>
                                    <input type="file" accept="image/*" hidden>
                                    <span class="tooltip">Cambiar foto</span>
                                </label>
                            </div>
                            <div class="nivel-usuario">
                                <div class="barra-progreso">
                                    <div class="progreso" style="width: 65%;"></div>
                                </div>
                                <span>Nivel 3</span>
                            </div>
                        </div>
                    </div>

                    <!-- Línea divisoria -->
                    <div class="linea-divisoria">
                        <div class="circulo-divisor"></div>
                        <div class="circulo-divisor"></div>
                    </div>

                    <!-- Datos del perfil -->
                    <div class="perfil-datos">
                        <h1 class="titulo-perfil">Mi Perfil</h1>

                        <div class="dato-perfil">
                            <div class="icono-dato"><i class="fas fa-user"></i></div>
                            <div class="contenido-dato">
                                <label>Nombre:</label>
                                <p class="valor-dato"><%= clientedto.getNombre()%></p>
                            </div>
                        </div>

                        <div class="dato-perfil">
                            <div class="icono-dato"><i class="fas fa-envelope"></i></div>
                            <div class="contenido-dato">
                                <label>Correo:</label>
                                <p class="valor-dato"><%= clientedto.getCorreo()%></p>
                            </div>
                        </div>

                        <div class="dato-perfil">
                            <div class="icono-dato"><i class="fas fa-phone"></i></div>
                            <div class="contenido-dato">
                                <label>Teléfono:</label>
                                <p class="valor-dato"><%= clientedto.getTelefono()%></p>
                            </div>
                        </div>

                        <div class="dato-perfil">
                            <div class="icono-dato"><i class="fas fa-dumbbell"></i></div>
                            <div class="contenido-dato">
                                <label>Plan Ares Fitness:</label>
                                <p class="valor-dato">
                                    <span class="plan-tag plan-premium">plan</span>
                                    <span class="fecha-renovacion">Renovación: 15/12/2023</span>
                                </p>
                            </div>
                        </div>

                        <div class="dato-perfil">
                            <div class="icono-dato"><i class="fas fa-calendar-alt"></i></div>
                            <div class="contenido-dato">
                                <label>Miembro desde:</label>
                                <p class="valor-dato"></p>
                            </div>
                        </div>

                        <div class="acciones-perfil">
                            <a href="editperfil.jsp" class="btn-editar">
                                <i class="fas fa-user-edit"></i> Editar perfil
                            </a>
                            <a href="progreso.jsp" class="btn-progreso"><i class="fas fa-chart-line"></i> Ver mi progreso</a>
                        </div>
                        <!-- Dentro de tu progress-grid, añade esta tarjeta -->
                        <div class="progress-card membership-card">
                            <div class="membership-header">
                                <i class="fas fa-crown membership-icon"></i>
                                <h2 class="card-title">Mi Membresía</h2>
                            </div>
                            <div class="membership-info">
                                <p class="membership-type">Plan Premium</p>
                                <p class="membership-expiry">Vence: 15/07/2024</p>
                            </div>
                            <div class="membership-benefits">
                                <ul>
                                    <li><i class="fas fa-check"></i> Acceso ilimitado</li>
                                    <li><i class="fas fa-check"></i> Entrenador personal</li>
                                    <li><i class="fas fa-check"></i> Clases grupales</li>
                                    <li><i class="fas fa-check"></i> Suplemento mensual</li>
                                </ul>
                            </div><a href="gestion-m.jsp">
                                <button class="primary-btn membership-btn">Gestionar Membresía</button></a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Estadísticas -->
            <section class="estadisticas-perfil">
                <div class="tarjeta-estadistica">
                    <i class="fas fa-fire icono-estadistica"></i>
                    <h3>Días entrenados</h3>
                    <p class="valor-estadistica">24</p>
                    <p class="meta-estadistica">Meta: 30 este mes</p>
                </div>
                <div class="tarjeta-estadistica">
                    <i class="fas fa-weight-hanging icono-estadistica"></i>
                    <h3>Logros</h3>
                    <p class="valor-estadistica">8</p>
                    <p class="meta-estadistica">¡Sigue así!</p>
                </div>
                <div class="tarjeta-estadistica">
                    <i class="fas fa-trophy icono-estadistica"></i>
                    <h3>Puntos</h3>
                    <p class="valor-estadistica">1,250</p>
                    <p class="meta-estadistica">Top 15%</p>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer>
            <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
        </footer>

        <script src="JS/perfil-user.js"></script>
    </body>
</html>
