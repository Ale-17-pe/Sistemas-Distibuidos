<%-- 
    Document   : suple
    Created on : 12 jul. 2025, 11:12:41 p. m.
    Author     : falex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.apiweb.aresfitnes.Model.Usuario"%>
<%@page import="com.apiweb.aresfitnes.dto.ClienteDTO"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Suplementos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/suple.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/HyF.css">
        <link rel="icon" href="${pageContext.request.contextPath}/Imagenes/logo.png" type="image/png">
        <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    </head>
    <body>
        <%
            // Obtener el usuario de la sesión
            Usuario usuario = (Usuario) session.getAttribute("usuario");
        %>
        <header>
            <div class="logo-container">
                <a href="index.jsp">
                    <img src="${pageContext.request.contextPath}/Imagenes/logo.png" alt="Logo AresFitness">
                </a>
            </div>
            <nav>
                <ul> 
                    <li><a href="mutar.jsp">PLANES</a></li>
                    <li><a href="ubicacion.jsp">UBICACIÓN</a></li>
                    <li><a href="EjerciciosServlet">EJERCICIOS</a></li>
                    <li><a href="EjerciciosServlet1">MOSTRAR</a></li>
                    <li><a href="suple.jsp">SUPLEMENTOS</a></li>
                    <li><a href="ropa.jsp">ROPA</a></li>
                    <li><a href="planes2.jsp">MEMBRESÍAS</a></li>

                    <% if (usuario != null) { %>
                    <%
                        String tipo = usuario.getTipoUsuario();
                        if ("cliente".equals(tipo)) {
                    %>
                    <a href="portalCliente.jsp"><button class="login-btn" id="loginButton">
                            <div class="login-btn__icon">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <!-- Icono de usuario/login -->
                                <path d="M12 4a4 4 0 0 1 4 4 4 4 0 0 1-4 4 4 4 0 0 1-4-4 4 4 0 0 1 4-4m0 10c4.42 0 8 1.79 8 4v2H4v-2c0-2.21 3.58-4 8-4z"/>
                                </svg>
                            </div>
                            <div class="login-btn__text">Perfil</div>
                        </button></a>
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

                    <a href="carrito.jsp" class="cart-btn-link">
                        <button class="cart-btn" id="cartButton">
                            <div class="cart-btn__icon">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M17 18a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2M1 2h3.27l.94 2H20a1 1 0 0 1 1 1c0 .17-.05.34-.12.5l-3.58 6.47c-.34.61-1 1.03-1.8 1.03H8.1l-.9 1.63-.03.12a.25.25 0 0 0 .25.25H19v2H7a2 2 0 0 1-2-2c0-.35.09-.68.24-.96l1.36-2.45L3 4H1V2m6 16a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2m9-7l2.78-5H6.14l2.36 5H16z"/>
                                </svg>
                                <span class="cart-count">0</span>
                            </div>
                        </button>
                    </a>
                </ul>
            </nav>
        </header>

        <!-- Banner principal -->
        <section>
            <div class="banner-container" id="banner-container">
                <!-- Botón para ocultar/mostrar el banner - posicionado como botón de cerrar -->
                <button id="toggle-banner-btn" class="banner-close-btn">
                    &#10006;
                </button>
                <div class="banner-slides">
                    <div class="banner-slide">
                        <img src="${pageContext.request.contextPath}/Imagenes/encabeza1.png" alt="Encabezado 1">
                    </div>
                    <div class="banner-slide">
                        <img src="${pageContext.request.contextPath}/Imagenes/encabeza2.png" alt="Encabezado 2">
                    </div>
                    <div class="banner-slide">
                        <img src="${pageContext.request.contextPath}/Imagenes/encabeza3.png" alt="Encabezado 3">
                    </div>
                </div>
                <button class="banner-arrow left" onclick="prevSlide()">&#10094;</button>
                <button class="banner-arrow right" onclick="nextSlide()">&#10095;</button>
            </div>
        </section>
        <hr>
        <!--Banner de patrocinadores-->
        <section class="sponsor-banner">
            <div class="sponsor-slides">
                <img src="${pageContext.request.contextPath}/Imagenes/pago1.png" alt="Patrocinador 1">
                <img src="${pageContext.request.contextPath}/Imagenes/pago2.png" alt="Patrocinador 2">
                <img src="${pageContext.request.contextPath}/Imagenes/pago3.png" alt="Patrocinador 3">
                <img src="${pageContext.request.contextPath}/Imagenes/pago4.png" alt="Patrocinador 4">
                <img src="${pageContext.request.contextPath}/Imagenes/pago5.png" alt="Patrocinador 5">
                <img src="${pageContext.request.contextPath}/Imagenes/pago6.png" alt="Patrocinador 6">
                <img src="${pageContext.request.contextPath}/Imagenes/pago7.png" alt="Patrocinador 7">
                <img src="${pageContext.request.contextPath}/Imagenes/pago8.png" alt="Patrocinador 8">
                <img src="${pageContext.request.contextPath}/Imagenes/pago9.png" alt="Patrocinador 9">
                <img src="${pageContext.request.contextPath}/Imagenes/pago10.png" alt="Patrocinador 10">
                <img src="${pageContext.request.contextPath}/Imagenes/pago11.png" alt="Patrocinador 11">

                <img src="${pageContext.request.contextPath}/Imagenes/pago1.png" alt="Patrocinador 1">
                <img src="${pageContext.request.contextPath}/Imagenes/pago2.png" alt="Patrocinador 2">
                <img src="${pageContext.request.contextPath}/Imagenes/pago3.png" alt="Patrocinador 3">
                <img src="${pageContext.request.contextPath}/Imagenes/pago4.png" alt="Patrocinador 4">
                <img src="${pageContext.request.contextPath}/Imagenes/pago5.png" alt="Patrocinador 5">
                <img src="${pageContext.request.contextPath}/Imagenes/pago6.png" alt="Patrocinador 6">
                <img src="${pageContext.request.contextPath}/Imagenes/pago7.png" alt="Patrocinador 7">
                <img src="${pageContext.request.contextPath}/Imagenes/pago8.png" alt="Patrocinador 8">
                <img src="${pageContext.request.contextPath}/Imagenes/pago9.png" alt="Patrocinador 9">
                <img src="${pageContext.request.contextPath}/Imagenes/pago10.png" alt="Patrocinador 10">
                <img src="${pageContext.request.contextPath}/Imagenes/pago11.png" alt="Patrocinador 11">

                <img src="${pageContext.request.contextPath}/Imagenes/pago1.png" alt="Patrocinador 1">
                <img src="${pageContext.request.contextPath}/Imagenes/pago2.png" alt="Patrocinador 2">
                <img src="${pageContext.request.contextPath}/Imagenes/pago3.png" alt="Patrocinador 3">
                <img src="${pageContext.request.contextPath}/Imagenes/pago4.png" alt="Patrocinador 4">
                <img src="${pageContext.request.contextPath}/Imagenes/pago5.png" alt="Patrocinador 5">
                <img src="${pageContext.request.contextPath}/Imagenes/pago6.png" alt="Patrocinador 6">
                <img src="${pageContext.request.contextPath}/Imagenes/pago7.png" alt="Patrocinador 7">
                <img src="${pageContext.request.contextPath}/Imagenes/pago8.png" alt="Patrocinador 8">
                <img src="${pageContext.request.contextPath}/Imagenes/pago9.png" alt="Patrocinador 9">
                <img src="${pageContext.request.contextPath}/Imagenes/pago10.png" alt="Patrocinador 10">
                <img src="${pageContext.request.contextPath}/Imagenes/pago11.png" alt="Patrocinador 11">

                <img src="${pageContext.request.contextPath}/Imagenes/pago1.png" alt="Patrocinador 1">
                <img src="${pageContext.request.contextPath}/Imagenes/pago2.png" alt="Patrocinador 2">
                <img src="${pageContext.request.contextPath}/Imagenes/pago3.png" alt="Patrocinador 3">
                <img src="${pageContext.request.contextPath}/Imagenes/pago4.png" alt="Patrocinador 4">
                <img src="${pageContext.request.contextPath}/Imagenes/pago5.png" alt="Patrocinador 5">
                <img src="${pageContext.request.contextPath}/Imagenes/pago6.png" alt="Patrocinador 6">
                <img src="${pageContext.request.contextPath}/Imagenes/pago7.png" alt="Patrocinador 7">
                <img src="${pageContext.request.contextPath}/Imagenes/pago8.png" alt="Patrocinador 8">
                <img src="${pageContext.request.contextPath}/Imagenes/pago9.png" alt="Patrocinador 9">
                <img src="${pageContext.request.contextPath}/Imagenes/pago10.png" alt="Patrocinador 10">
                <img src="${pageContext.request.contextPath}/Imagenes/pago11.png" alt="Patrocinador 11">
            </div>
        </section>
        <hr>

        <!--Sección de catalogo-->
        <section class="product-sections" style="display: flex; align-items: flex-start; min-height: 100vh;">
            <!-- Barra lateral de filtros -->
            <aside class="filters-sidebar enhanced-sidebar">
                <div class="filters-container">
                    <h3>Filtros</h3>

                    <!-- Filtro por Marca -->
                    <div class="filter-group">
                        <button class="filter-toggle" onclick="toggleFilterSection('brand')">
                            <span>Marca</span>
                            <span class="arrow">▼</span>
                        </button>
                        <div class="filter-content" id="brand">
                            <label class="checkbox-container">
                                <input type="checkbox" value="muscletech" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Muscletech</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="optimum-nutrition" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Optimum Nutrition</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="vecos" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Vecos Nutriceutical</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="powergym" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Powergym</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="amix" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Amix</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="biotech" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>BioTechUSA</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="dymatize" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Dymatize</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="evolution" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Evolution</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="costa" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Costa</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="gatorade" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Gatorade/PepsiCo</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="powerade" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Powerade/Coca-Cola</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="otras-marcas" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Otras Marcas</span>
                            </label>
                        </div>
                    </div>

                    <!-- Filtro por Sabor -->
                    <div class="filter-group">
                        <button class="filter-toggle" onclick="toggleFilterSection('flavor')">
                            <span>Sabor</span>
                            <span class="arrow">▼</span>
                        </button>
                        <div class="filter-content" id="flavor">
                            <label class="checkbox-container">
                                <input type="checkbox" value="sin-sabor" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Sin sabor</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="chocolate" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Chocolate</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="caramelo" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Caramelo</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="manzana" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Manzana</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="limon" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Limón</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="frutas-rojas" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Frutas rojas</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="chocolate-mani" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Chocolate con maní</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="blue-raspberry" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Blue Raspberry</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="naranja" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Naranja</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="uva" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Uva</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="mango" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Mango</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="arandanos" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Arándanos</span>
                            </label>
                        </div>
                    </div>

                    <!-- Filtro por Funcionalidad -->
                    <div class="filter-group">
                        <button class="filter-toggle" onclick="toggleFilterSection('functionality')">
                            <span>Funcionalidad</span>
                            <span class="arrow">▼</span>
                        </button>
                        <div class="filter-content" id="functionality">
                            <label class="checkbox-container">
                                <input type="checkbox" value="construccion-muscular" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Construcción Muscular</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="energia-rendimiento" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Energía y Rendimiento</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="recuperacion" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Recuperación</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="hidratacion" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Hidratación</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="perdida-peso" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Pérdida de Peso</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="salud-general" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Salud General</span>
                            </label>
                            <label class="checkbox-container">
                                <input type="checkbox" value="acceso-gimnasio" onchange="applyFilters()">
                                <span class="checkmark"></span>
                                <span>Acceso al Gimnasio</span>
                            </label>
                        </div>
                    </div>

                    <!-- Botón para limpiar filtros -->
                    <div class="filter-actions">
                        <button class="clear-filters-btn" onclick="clearAllFilters()">
                            Limpiar Filtros
                        </button>
                    </div>
                </div>
            </aside>

            <!-- Contenido principal -->
            <div class="main-content">
                <div class="section-content">
                    <!-- Sección de buscador reorganizada -->
                    <div class="search-section-reorganized" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 20px;">
                        <!-- Buscador a la izquierda -->
                        <div style="display: flex; align-items: center; gap: 15px;">
                            <h1 style="margin: 0; font-size: 2em; color: #ffffff;">Buscador:</h1>
                            <div class="search-container" style="margin: 0;">
                                <input type="search" class="search-bar" 
                                       onkeyup="buscarProductos(this.value, 'productos-slider')">
                                <img src="${pageContext.request.contextPath}/Imagenes/search.png" alt="Buscar" class="search-icon">
                            </div>
                        </div>
                        <!-- Botones a la derecha -->
                        <div style="display: flex; gap: 10px;">
                            <button class="suplemento-cat-btn" id="btn-suplementos" onclick="toggleFiltro('suplementos', this)">Suplementos</button>
                            <button class="suplemento-cat-btn" id="btn-membresia" onclick="toggleFiltro('membresia', this)">Membresías</button>
                            <button class="suplemento-cat-btn" id="btn-extras" onclick="toggleFiltro('extras', this)">Extras</button>
                        </div>
                    </div>
                    <!--Todos los productos-->
                    <div class="suplementos-slider-container">
                        <div class="suplementos-slider" id="productos-slider">
                            <div class="product-card proteinas sin-sabor suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ1.png" alt="Platinum 100% Creatine" class="suplemento-img">
                                <h4>Platinum 100% Creatine</h4>
                                <p><strong>S/ 125.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Muscletech</button>
                                    <button class="category-btn">Sin sabor</button>
                                    <button class="category-btn">Creatina monohidratada (5g)</button>
                                </div>
                                <p>Suplemento de creatina pura para mejorar la fuerza y el rendimiento muscular.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card otros sin-sabor suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ2.png" alt="HMB Power 2000 mg" class="suplemento-img">
                                <h4>HMB Power 2000 mg</h4>
                                <p><strong>S/ 95.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Vecos Nutriceutical</button>
                                    <button class="category-btn">Sin sabor</button>
                                    <button class="category-btn">HMB, Vitamina B6</button>
                                </div>
                                <p>Suplemento para preservar masa muscular y apoyar la recuperación.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card otros sin-sabor suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ3.png" alt="Tribulus Maca L-Arginine" class="suplemento-img">
                                <h4>Tribulus Maca L-Arginine</h4>
                                <p><strong>S/ 89.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Vecos Nutriceutical</button>
                                    <button class="category-btn">Sin sabor</button>
                                    <button class="category-btn">Tribulus terrestris, L-Arginina</button>
                                </div>
                                <p>Fórmula natural para energía, vitalidad y rendimiento físico.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas caramelo suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ4.png" alt="Gold Standard 100% Whey" class="suplemento-img">
                                <h4>Gold Standard 100% Whey</h4>
                                <p><strong>S/ 185.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Optimum Nutrition</button>
                                    <button class="category-btn">Caramelo</button>
                                    <button class="category-btn">Proteína de suero, BCAA</button>
                                </div>
                                <p>Proteína de alta calidad para soporte muscular y recuperación.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card otros sin-sabor suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ5.png" alt="L-Carnitine 3000 mg" class="suplemento-img">
                                <h4>L-Carnitine 3000 mg</h4>
                                <p><strong>S/ 85.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Vecos Nutriceutical</button>
                                    <button class="category-btn">Sin sabor</button>
                                    <button class="category-btn">L-Carnitina</button>
                                </div>
                                <p>Suplemento para apoyar el metabolismo de grasas y la energía.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas sin-sabor suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ6.png" alt="Creatine Monohydrate" class="suplemento-img">
                                <h4>Creatine Monohydrate</h4>
                                <p><strong>S/ 98.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Amix</button>
                                    <button class="category-btn">Sin sabor</button>
                                    <button class="category-btn">Creatina monohidratada</button>
                                </div>
                                <p>Creatina en polvo de alta pureza para mejorar el rendimiento físico.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card prepost manzana suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ7.png" alt="RECOPLUS" class="suplemento-img">
                                <h4>RECOPLUS</h4>
                                <p><strong>S/ 92.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Powergym</button>
                                    <button class="category-btn">Manzana</button>
                                    <button class="category-btn">Carbohidratos, Proteínas</button>
                                </div>
                                <p>Recuperador post-ejercicio con antioxidantes y aminoácidos.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card prepost limon suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ8.png" alt="ISOPOWER" class="suplemento-img">
                                <h4>ISOPOWER</h4>
                                <p><strong>S/ 88.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Powergym</button>
                                    <button class="category-btn">Limón</button>
                                    <button class="category-btn">Electrolitos, Glutamina</button>
                                </div>
                                <p>Bebida electrolítica para hidratación antes, durante y después del ejercicio.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ9.png" alt="WheyPlus" class="suplemento-img">
                                <h4>WheyPlus</h4>
                                <p><strong>S/ 145.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Powergym</button>
                                    <button class="category-btn">Chocolate</button>
                                    <button class="category-btn">Proteína de suero y vegetal, BCAA</button>
                                </div>
                                <p>Proteína mixta para soporte muscular integral.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ10.png" alt="Nutrision 100% ZMA®" class="suplemento-img">
                                <h4>Nutrision 100% ZMA®</h4>
                                <p><strong>S/ 135.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">KeForma</button>
                                    <button class="category-btn">Chocolate</button>
                                    <button class="category-btn">Proteína aislada, ZMA</button>
                                </div>
                                <p>Proteína con ZMA para recuperación y soporte hormonal.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ11.png" alt="Muscle Mass" class="suplemento-img">
                                <h4>Muscle Mass</h4>
                                <p><strong>S/ 165.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">BioTechUSA</button>
                                    <button class="category-btn">Chocolate</button>
                                    <button class="category-btn">Proteína, Creatina</button>
                                </div>
                                <p>Ganador de masa con mezcla de carbohidratos y proteínas.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ12.png" alt="Whey-Pro Fusion Protein" class="suplemento-img">
                                <h4>Whey-Pro Fusion Protein</h4>
                                <p><strong>S/ 155.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Amix</button>
                                    <button class="category-btn">Chocolate</button>
                                    <button class="category-btn">Whey concentrado e isolado, Glutamina</button>
                                </div>
                                <p>Proteína avanzada con enzimas digestivas y alto contenido en BCAA.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card prepost frutas-rojas suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ13.png" alt="Muscle Cell Mass" class="suplemento-img">
                                <h4>Muscle Cell Mass</h4>
                                <p><strong>S/ 125.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">DMI</button>
                                    <button class="category-btn">Frutas rojas</button>
                                    <button class="category-btn">Creapure, CarnoSyn</button>
                                </div>
                                <p>Voluminizador celular con ingredientes de alta calidad para rendimiento.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate-mani suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ14.png" alt="ISO100 Hydrolyzed" class="suplemento-img">
                                <h4>ISO100 Hydrolyzed</h4>
                                <p><strong>S/ 195.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Dymatize</button>
                                    <button class="category-btn">Chocolate con mantequilla de maní</button>
                                    <button class="category-btn">Proteína aislada e hidrolizada, Leucina</button>
                                </div>
                                <p>Proteína de rápida absorción para recuperación muscular.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card prepost blue-raspberry suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ15.png" alt="G10 Xplosive" class="suplemento-img">
                                <h4>G10 Xplosive</h4>
                                <p><strong>S/ 105.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Kiffer Laboratories</button>
                                    <button class="category-btn">Frutas (Blue Raspberry)</button>
                                    <button class="category-btn">Sin especificar</button>
                                </div>
                                <p>Pre-entrenamiento para energía y enfoque antes del ejercicio.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ16.png" alt="Premium ISO90" class="suplemento-img">
                                <h4>Premium ISO90</h4>
                                <p><strong>S/ 175.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Natly Sports Nutrition</button>
                                    <button class="category-btn">Chocolate</button>
                                    <button class="category-btn">Proteína aislada, DigeZyme</button>
                                </div>
                                <p>Proteína limpia con enzimas y probióticos para digestión y recuperación.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ17.png" alt="Evolution WP100" class="suplemento-img">
                                <h4>Evolution WP100</h4>
                                <p><strong>S/ 139.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Evolution</button>
                                    <button class="category-btn">Chocolate</button>
                                    <button class="category-btn">Proteína de suero, Bajo sodio</button>
                                </div>
                                <p>Proteína limpia sin azúcar ni aspartame, ideal para uso diario.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card proteinas chocolate suplementos">
                                <img src="${pageContext.request.contextPath}/Imagenes/produ18.png" alt="ISO Whey Zero" class="suplemento-img">
                                <h4>ISO Whey Zero</h4>
                                <p><strong>S/ 185.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">BioTechUSA</button>
                                    <button class="category-btn">Chocolate</button>
                                    <button class="category-btn">Proteína aislada, L-Glutamina</button>
                                </div>
                                <p>Proteína sin lactosa, azúcar ni gluten, ideal para dietas estrictas.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <!-- Membresías -->
                            <div class="product-card membresia">
                                <img src="${pageContext.request.contextPath}/Imagenes/membre1.png" alt="Membresia 1 mes" class="suplemento-img">
                                <h4>Giftcard 1 Mes</h4>
                                <p><strong>S/ 89.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Mensual</button>
                                    <button class="category-btn">Todas las sedes</button>
                                </div>
                                <p>Membresia valida in cualquier sede del Perú por 1 mes. Sin fecha de expiración.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card membresia">
                                <img src="${pageContext.request.contextPath}/Imagenes/membre6.png" alt="Membresia 6 meses" class="suplemento-img">
                                <h4>Giftcard 6 meses</h4>
                                <p><strong>S/ 480.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Semestral</button>
                                    <button class="category-btn">Todas las sedes</button>
                                </div>
                                <p>Membresia valida in cualquier sede del Perú por 6 meses. Sin fecha de expiración.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <div class="product-card membresia">
                                <img src="${pageContext.request.contextPath}/Imagenes/membre12.png" alt="Producto 12 meses" class="suplemento-img">
                                <h4>Giftcard 12 meses</h4>
                                <p><strong>S/ 900.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Anual</button>
                                    <button class="category-btn">Todas las sedes</button>
                                </div>
                                <p>Membresia valida in cualquier sede del Perú por 12 meses. Sin fecha de expiración.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                            <!-- Extras -->
                            <!-- Bebidas Energéticas -->
                            <div class="product-card bebida-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack1.png" alt="Gatorade" class="suplemento-img">
                                <h4>Gatorade</h4>
                                <p><strong>S/ 5.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">PepsiCo</button>
                                    <button class="category-btn">Sin sabor</button>
                                </div>
                                <p>Bebida isotónica para hidratación y recuperación deportiva.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card bebida-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack2.png" alt="Electrolit" class="suplemento-img">
                                <h4>Electrolit</h4>
                                <p><strong>S/ 5.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Grupo Pisa</button>
                                    <button class="category-btn">Frutos Rojos</button>
                                </div>
                                <p>Bebida rehidratante tipo suero oral para reponer electrolitos.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card bebida-energetica uva extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack3.png" alt="Sporade Uva" class="suplemento-img">
                                <h4>Sporade Uva</h4>
                                <p><strong>S/ 4.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Ajegroup</button>
                                    <button class="category-btn">Uva</button>
                                </div>
                                <p>Bebida deportiva con electrolitos para hidratación.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card bebida-energetica naranja extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack4.png" alt="Sporade Naranja" class="suplemento-img">
                                <h4>Sporade Naranja</h4>
                                <p><strong>S/ 4.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Ajegroup</button>
                                    <button class="category-btn">Naranja</button>
                                </div>
                                <p>Bebida para deportistas fortificada con vitaminas.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card bebida-energetica manzana extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack5.png" alt="Sporade Apple Ice" class="suplemento-img">
                                <h4>Sporade Apple Ice</h4>
                                <p><strong>S/ 4.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Ajegroup</button>
                                    <button class="category-btn">Manzana</button>
                                </div>
                                <p>Bebida deportiva con sabor frutal y efecto refrescante.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card bebida-energetica arandanos extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack6.png" alt="Powerade Mountain Blast" class="suplemento-img">
                                <h4>Powerade Mountain Blast</h4>
                                <p><strong>S/ 5.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">The Coca-Cola Company</button>
                                    <button class="category-btn">Arandanos</button>
                                </div>
                                <p>Bebida deportiva con electrolitos para rehidratación.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card bebida-energetica mango extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack7.png" alt="Powerade Golden Mango" class="suplemento-img">
                                <h4>Powerade Golden Mango</h4>
                                <p><strong>S/ 5.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">The Coca-Cola Company</button>
                                    <button class="category-btn">Mango</button>
                                </div>
                                <p>Bebida deportiva con vitaminas y electrolitos.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <!-- Barritas Energéticas -->
                            <div class="product-card barrita-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack8.png" alt="Titanium Endurance Power Bites" class="suplemento-img">
                                <h4>Titanium Power Bites</h4>
                                <p><strong>S/ 6.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Titanium Endurance</button>
                                    <button class="category-btn">Sweet N' Salty</button>
                                </div>
                                <p>Bocaditos energéticos con proteína y quinoa pop.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card barrita-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack9.png" alt="deliCatalia Almendras y Arándanos" class="suplemento-img">
                                <h4>deliCatalia Mix</h4>
                                <p><strong>S/ 5.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">deliCatalia</button>
                                    <button class="category-btn">Almendras y arándanos</button>
                                </div>
                                <p>Barra energética orgánica y ecológica.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card barrita-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack10.png" alt="Buddha Energy Bar" class="suplemento-img">
                                <h4>Buddha Energy Bar</h4>
                                <p><strong>S/ 7.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Iswari</button>
                                    <button class="category-btn">Acai, fresa y plátano</button>
                                </div>
                                <p>Barra energética orgánica y vegana, 100% vegetal.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card barrita-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack11.png" alt="Oxypro Race Bar" class="suplemento-img">
                                <h4>Oxypro Race Bar</h4>
                                <p><strong>S/ 7.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Oxypro Nutrition</button>
                                    <button class="category-btn">Choc Splash</button>
                                </div>
                                <p>Barra energética con triple fuente de energía.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card barrita-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack12.png" alt="Costa Cereal Bar Almendra" class="suplemento-img">
                                <h4>Costa Cereal Almendra</h4>
                                <p><strong>S/ 3.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Costa</button>
                                    <button class="category-btn">Almendra y miel</button>
                                </div>
                                <p>Barra de cereal nutritiva con frutos secos.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card barrita-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack13.png" alt="Costa Cereal Bar Chocolate" class="suplemento-img">
                                <h4>Costa Cereal Chocolate</h4>
                                <p><strong>S/ 3.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Costa</button>
                                    <button class="category-btn">Chips de chocolate</button>
                                </div>
                                <p>Barra de cereal con trozos de chocolate.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card barrita-energetica extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack14.png" alt="Costa Cereal Bar Fresa" class="suplemento-img">
                                <h4>Costa Cereal Fresa</h4>
                                <p><strong>S/ 3.50</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Costa</button>
                                    <button class="category-btn">Fresa con yogurt</button>
                                </div>
                                <p>Barra de cereal con sabor frutado y cremoso.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <!-- Snacks -->
                            <div class="product-card snack extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack15.png" alt="Mix de Nuez y Fruta Seca" class="suplemento-img">
                                <h4>Mix Nuez y Fruta Seca</h4>
                                <p><strong>S/ 7.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Orando con el Huerto</button>
                                    <button class="category-btn">Mix de frutos</button>
                                </div>
                                <p>Snack saludable con frutos secos y deshidratados.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>

                            <div class="product-card snack extras">
                                <img src="${pageContext.request.contextPath}/Imagenes/snack16.png" alt="Delicias Maní con Pasas" class="suplemento-img">
                                <h4>Maní con Pasas</h4>
                                <p><strong>S/ 5.00</strong></p>
                                <div class="product-categories">
                                    <button class="category-btn">Delicias</button>
                                    <button class="category-btn">Maní con pasas</button>
                                </div>
                                <p>Mezcla de frutos secos como snack energético.</p>
                                <div class="product-buttons">
                                    <button class="add-to-cart">Agregar al Carro</button>
                                    <button class="buy-now">Comprar Ahora</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div id="LOGO">
            <a href="index.jsp" target="_blank"><img id="LOGO" src="${pageContext.request.contextPath}/Imagenes/logo.png" alt="Logo Ares Fitness"><br><br></a>
        </div>

        <div class="footer_container">

            <!-- Sección izquierda: Redes y contacto -->
            <div class="redes-sociales">
                <strong>Redes Sociales:</strong><br><br>
                <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/Imagenes/FB.png" alt="Facebook" class="icono-red"></a>
                <a href="https://www.instagram.com/aresfitness.peru/" target="_blank"><img src="${pageContext.request.contextPath}/Imagenes/Insta.png" alt="Instagram" class="icono-red"></a>
                <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/Imagenes/Tiktok.png" alt="Tiktok" class="icono-red"></a>
                <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/Imagenes/X.png" alt="X" class="icono-red"></a><br>
                <br><br>
                <strong>CONTACTANOS:</strong><br><br>
                <a href="#" target="_blank">
                    <img src="${pageContext.request.contextPath}/Imagenes/WhatsApp.png" alt="WhatsApp" style="width: 20px; vertical-align: middle;"></a>
                <br><br>
                <a href="#" target="_blank">
                    <img src="${pageContext.request.contextPath}/Imagenes/Gmail.png" alt="Correo" style="width: 20px; vertical-align: middle;"></a> 

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
                <a href="index.jsp">ARES FITNESS</a><br><br><br><br>
                <span style="color: #00ccff; font-weight: bold;"></span><br>
                <img src="${pageContext.request.contextPath}/Imagenes/LibroR.png" alt="Libro de Reclamaciones" style="width: 150px;">
            </div>
        </div>

        <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
    </footer>

    <!-- Vincula el archivo JS externo al final del body -->
    <script src="${pageContext.request.contextPath}/JS/carrito.js"></script>
    <script src="${pageContext.request.contextPath}/JS/suple.js"></script>
    <script src="${pageContext.request.contextPath}/JS/index.js"></script>
</body>
</html>