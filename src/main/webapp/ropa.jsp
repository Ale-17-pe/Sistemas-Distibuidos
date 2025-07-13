<%-- 
    Document   : ropa
    Created on : 12 jul. 2025, 10:31:27 p. m.
    Author     : falex
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/ropa.css">
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
                    <li><a href=EjerciciosServlet1 >MOSTRAR</a></li>
                    <li><a href=suple.jsp >SUPLEMENTOS</a></li>
                    <li><a href=ropa.jsp >ROPA</a></li>

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

    <section class="hero-video-section">
        <div class="video-container">
            <video autoplay muted loop playsinline class="hero-video">
                <source src="Imagenes/ropaV.mp4" type="video/mp4">
                <img src="Imagenes/fallback-image.jpg" alt="Fondo Ares Fitness">
            </video>
            <div class="video-overlay"></div>
        </div>
        
        <div class="hero-content">
            <h1>ARES TE VISTE</h1>
            <br>
            <h2>Transforma tu cuerpo con el mejor estilo</h2> <br>
            <p>VISTETE COMO TODO UN GYMRAT</p><br>
            <a href="#" class="cta-button">Descubre más</a>
        </div>
    </section>

    <!-- Sección de Ropa por Género -->
    <section class="clothing-section">
        <div class="gender-tabs">
            <button class="gender-tab active" onclick="showGender('men')">HOMBRES</button>
            <button class="gender-tab" onclick="showGender('women')">MUJERES</button>
        </div>

        <!-- Sección Hombres -->
        <div id="men-section" class="gender-section active">
            <div class="gender-video-container">
                <video autoplay muted loop playsinline class="gender-video">
                    <source src="Imagenes/HombresG.mp4" type="video/mp4">
                    <img src="Imagenes/fallback-image.jpg" alt="Ropa para hombres">
                </video>
                <div class="video-overlay"></div>
            </div>
            <h2 class="section-title">ROPA PARA HOMBRES</h2>                <div class="category">
                    <h3>POLOS</h3>
                    <div class="products-grid">
                        <div class="product-card">
                            <img src="Imagenes/polo basico.png" alt="Polo deportivo hombre" class="suplemento-img">
                            <h4>Polo Performance</h4>
                            <p><strong>S/ 34.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L, XL</button>
                                <button class="category-btn">Transpirable</button>
                            </div>
                            <p>Polo deportivo. Tela transpirable y de secado rápido.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="Imagenes/paloMangaC.png" alt="Polo manga corta hombre" class="suplemento-img">
                            <h4>Polo Clásico</h4>
                            <p><strong>S/ 29.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L, XL</button>
                                <button class="category-btn">Manga Corta</button>
                            </div>
                            <p>Polo de manga corta. Diseño clásico para entrenamiento.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://gymratswear.com/cdn/shop/files/BLACK-Photoroom_2_cfef010f-bd0f-403a-82ae-ee2ffa60f28b.png?v=1735435603&width=640" alt="Polo entrenamiento hombre" class="suplemento-img">
                            <h4>Polo Active</h4>
                            <p><strong>S/ 39.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L, XL</button>
                                <button class="category-btn">Elástico</button>
                            </div>
                            <p>Polo para entrenamiento intenso. Material elástico y resistente.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                    </div>
                </div>                <div class="category">
                    <h3>SHORTS</h3>
                    <div class="products-grid">
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/0156/6146/files/HeritageRawEdge5ShortsGSOnyxGreyA2C6V-GB7N-0043_a32860e8-3a63-4fa4-a157-22476d7d2751_1920x.jpg?v=1746089230" alt="Short deportivo hombre" class="suplemento-img">
                            <h4>Short Training</h4>
                            <p><strong>S/ 24.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L</button>
                                <button class="category-btn">Bolsillos Laterales</button>
                            </div>
                            <p>Short para entrenamiento. Con bolsillos laterales.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/0156/6146/files/SportsShortIteration2GSHeavyBlue-GSIronBlueA2C2U-UCY1-1290-0239_1920x.jpg?v=1744978693" alt="Short running hombre" class="suplemento-img">
                            <h4>Short Running</h4>
                            <p><strong>S/ 27.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L, XL</button>
                                <button class="category-btn">Transpirable</button>
                            </div>
                            <p>Short para running. Ligero y transpirable.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/0156/6146/files/GFXLifting4MultiGraphicShortRDEGSBlackA2B1G-BB2J-0570_623bfd02-30a9-4958-8aeb-dfe54078796a_1920x.jpg?v=1746089230" alt="Short básico hombre" class="suplemento-img">
                            <h4>Short Essential</h4>
                            <p><strong>S/ 22.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L</button>
                                <button class="category-btn">Corte Clásico</button>
                            </div>
                            <p>Short básico para gimnasio. Corte clásico.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                    </div>
                </div>                <div class="category">
                    <h3>POLERAS</h3>
                    <div class="products-grid">
                        <div class="product-card">
                            <img src="https://gymratswear.com/cdn/shop/files/HOODIEBLACKFRONTAL_ffbb7d46-7ef0-4095-9ba2-6181b419a717.png?v=1704485606&width=640" alt="Polera deportiva hombre" class="suplemento-img">
                            <h4>Polera Workout</h4>
                            <p><strong>S/ 44.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L, XL</button>
                                <button class="category-btn">Con Capucha</button>
                            </div>
                            <p>Polera deportiva. Ideal para entrenamientos.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://gymratswear.com/cdn/shop/files/HOODIECREMAFRONTAL_b6b3a6ce-9c45-4fce-bcb2-5162753686d3.png?v=1704486181&width=640" alt="Polera entrenamiento hombre" class="suplemento-img">
                            <h4>Polera Training</h4>
                            <p><strong>S/ 49.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas M, L, XL</button>
                                <button class="category-btn">Material Premium</button>
                            </div>
                            <p>Polera para entrenamiento. Material premium.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/0156/6146/files/A_PowerOriginalsHoodieCharcoalCoreMarlA2C9H-GBBB-1262_391700d8-8ec4-4ddb-9d76-a3ce4d42eb27_1920x.jpg?v=1743417072" alt="Polera básica hombre" class="suplemento-img">
                            <h4>Polera Essential</h4>
                            <p><strong>S/ 39.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L</button>
                                <button class="category-btn">Minimalista</button>
                            </div>
                            <p>Polera básica. Diseño minimalista y cómodo.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <!-- Sección Mujeres -->
        <div id="women-section" class="gender-section">
            <div class="gender-video-container">
                <video autoplay muted loop playsinline class="gender-video">
                    <source src="Imagenes/mujeresG.mp4" type="video/mp4">
                    <img src="Imagenes/fallback-image.jpg" alt="Ropa para mujeres">
                </video>
                <div class="video-overlay"></div>
            </div>
            <h2 class="section-title">ROPA PARA MUJERES</h2>                <div class="category">
                    <h3>POLOS</h3>
                    <div class="products-grid">
                        <div class="product-card">
                            <img src="https://home.ripley.com.pe/Attachment/WOP_5/2020336031071/2020336031071_2.jpg" alt="Polo deportivo mujer" class="suplemento-img">
                            <h4>Polo Sport</h4>
                            <p><strong>S/ 32.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas XS, S, M</button>
                                <button class="category-btn">Transpirable</button>
                            </div>
                            <p>Polo deportivo para mujer. Tela transpirable.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/61ba686e6ada4009b43f690f3bf89881_9366/Polo_Corto_Essentials_Verde_JD5338_01_laydown.jpg" alt="Polo ajustado mujer" class="suplemento-img">
                            <h4>Polo Fit</h4>
                            <p><strong>S/ 29.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas XS, S, M, L</button>
                                <button class="category-btn">Ajustado</button>
                            </div>
                            <p>Polo ajustado. Ideal para entrenamiento.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://http2.mlstatic.com/D_NQ_NP_2X_817152-MPE77849157166_072024-F-polo-oversized-gymshark-mujer-original.webp" alt="Polo casual mujer" class="suplemento-img">
                            <h4>Polo Casual</h4>
                            <p><strong>S/ 27.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L</button>
                                <button class="category-btn">Oversize</button>
                            </div>
                            <p>Polo casual oversize. Estilo relajado.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                    </div>
                </div>                <div class="category">
                    <h3>SHORTS</h3>
                    <div class="products-grid">
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/1367/5207/files/SUN_C_bigger_Athlete_6_1920x.jpg?v=1739125238" alt="Short deportivo mujer" class="suplemento-img">
                            <h4>Short Training</h4>
                            <p><strong>S/ 26.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas XS, S, M</button>
                                <button class="category-btn">Corte Alto</button>
                            </div>
                            <p>Short para entrenamiento. Corte alto.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/1367/5207/files/Adapt-x-whitney_Static_eComm_PDP_1692x2018_09_1e1a8e33-d2ea-4aff-9579-36ea4bc59773_1920x.jpg?v=1740661798" alt="Short GYM mujer" class="suplemento-img">
                            <h4>Short Yoga</h4>
                            <p><strong>S/ 24.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L</button>
                                <button class="category-btn">Elástico</button>
                            </div>
                            <p>Short para yoga. Material elástico.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/0156/6146/files/StitchFeatureWovenPantGSBlackB6A9S-BB2J841_d8d7d834-dc0d-44d5-85cd-b08409fa9e69_1920x.jpg?v=1705568074" alt="Pants mujer" class="suplemento-img">
                            <h4>Short Running</h4>
                            <p><strong>S/ 28.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas XS, S, M, L</button>
                                <button class="category-btn">Transpirable</button>
                            </div>
                            <p>Short para running. Transpirable.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                    </div>
                </div>                <div class="category">
                    <h3>POLERAS</h3>
                    <div class="products-grid">
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/0156/6146/files/GFXBULKINGSEASONBRUSHEDHOODIEGSBlackB1C9K-BB2J-0769_e3e7debd-c54f-4cd9-b6a0-40ed97e206d8_1920x.jpg?v=1737639236" alt="Polera deportiva mujer" class="suplemento-img">
                            <h4>Polera Workout</h4>
                            <p><strong>S/ 42.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L</button>
                                <button class="category-btn">Deportiva</button>
                            </div>
                            <p>Polera deportiva. Ideal para entrenamientos.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://cdn.shopify.com/s/files/1/0156/6146/files/GFXBULKINGSEASONBRUSHEDHOODIEGSLightGreyMarlB1C9K-GCHR-0799_10c5c5b6-acf4-4e70-9e06-2bab996dc556_1920x.jpg?v=1733408261" alt="Polera entrenamiento mujer" class="suplemento-img">
                            <h4>Polera Training</h4>
                            <p><strong>S/ 47.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas XS, S, M</button>
                                <button class="category-btn">Premium</button>
                            </div>
                            <p>Polera para entrenamiento. Material premium.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img src="https://home.ripley.com.pe/Attachment/WOP_5/2020324359668/2020324359668_2.jpg" alt="Polera básica mujer" class="suplemento-img">
                            <h4>Polera Essential</h4>
                            <p><strong>S/ 37.99</strong></p>
                            <div class="product-categories">
                                <button class="category-btn">Ares Fitness</button>
                                <button class="category-btn">Tallas S, M, L</button>
                                <button class="category-btn">Minimalista</button>
                            </div>
                            <p>Polera básica. Diseño minimalista y cómodo.</p>
                            <div class="product-buttons">
                                <button class="add-to-cart">Agregar al Carro</button>
                                <button class="buy-now">Comprar Ahora</button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </section>

    <section class="productos-section">
        <div class="suplementos-slider-container">
            <div class="suplementos-slider" id="productos-slider">
                <div class="product-card ropa-deportiva hombre">
                    <img src="Imagenes/CamisetaFit.png" alt="Camiseta Fit Hombre" class="suplemento-img">
                    <h4>Camiseta Fit Hombre</h4>
                    <p><strong>S/ 70.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Tallas S, M, L, XL</button>
                        <button class="category-btn">DryFit</button>
                    </div>
                    <p>Camiseta deportiva para hombre. Tela DryFit que absorbe el sudor y mantiene la frescura.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card ropa-deportiva mujer">
                    <img src="Imagenes/Top.png" alt="Top Deportivo Mujer" class="suplemento-img">
                    <h4>Top Deportivo Mujer</h4>
                    <p><strong>S/ 75.90</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Tallas S, M, L</button>
                        <button class="category-btn">Soporte Medio</button>
                    </div>
                    <p>Top ajustado con soporte medio, ideal para entrenamiento y yoga.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card ropa-deportiva mujer">
                    <img src="Imagenes/LegginsMujer.png" alt="Leggins Pro Mujer" class="suplemento-img">
                    <h4>Leggins Pro Mujer</h4>
                    <p><strong>S/ 120.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Tallas S, M, L</button>
                        <button class="category-btn">Cintura Alta</button>
                    </div>
                    <p>Leggins de alto rendimiento, cintura alta. Tecnología anti-transpirante.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card ropa-deportiva hombre">
                    <img src="Imagenes/ShortsGym.png" alt="Shorts Gym Hombre" class="suplemento-img">
                    <h4>Shorts Gym Hombre</h4>
                    <p><strong>S/ 45.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Tallas S, M, L</button>
                        <button class="category-btn">Bolsillos Laterales</button>
                    </div>
                    <p>Short deportivo ligero con bolsillos laterales.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card accesorios unisex">
                    <img src="Imagenes/Cinturón.png" alt="Cinturón de Entrenamiento" class="suplemento-img">
                    <h4>Cinturón de Entrenamiento</h4>
                    <p><strong>S/ 99.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Tallas M, L, XL</button>
                        <button class="category-btn">Acolchado</button>
                    </div>
                    <p>Cinturón lumbar acolchado para levantamiento de pesas. Hebilla metálica ajustable.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card accesorios unisex">
                    <img src="Imagenes/Toalla.png" alt="Toalla Microfibra Ares" class="suplemento-img">
                    <h4>Toalla Microfibra Ares</h4>
                    <p><strong>S/ 29.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">100x50 cm</button>
                        <button class="category-btn">Secado Rápido</button>
                    </div>
                    <p>Toalla deportiva de secado rápido y textura suave. Incluye gancho para colgar.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card accesorios unisex">
                    <img src="Imagenes/Mochila.png" alt="Mochila Gym Ares" class="suplemento-img">
                    <h4>Mochila Gym Ares</h4>
                    <p><strong>S/ 149.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">28 Litros</button>
                        <button class="category-btn">Resistente al Agua</button>
                    </div>
                    <p>Mochila resistente al agua con compartimento para calzado.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card accesorios unisex">
                    <img src="Imagenes/YOGA.png" alt="Tapete Yoga" class="suplemento-img">
                    <h4>Tapete Yoga</h4>
                    <p><strong>S/ 127.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">4mm grosor</button>
                        <button class="category-btn">Antideslizante</button>
                    </div>
                    <p>Tapete para Yoga lavable y muy durable, superficie acolchada antideslizante.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card accesorios unisex">
                    <img src="Imagenes/CUERDA.png" alt="Cuerda para Saltar" class="suplemento-img">
                    <h4>Cuerda para Saltar</h4>
                    <p><strong>S/ 11.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Ajustable</button>
                        <button class="category-btn">Cardio</button>
                    </div>
                    <p>Ideal para potenciar tus entrenamientos de cardio.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card accesorios unisex">
                    <img src="Imagenes/Guantes Deportivos.png" alt="Guantes Deportivos" class="suplemento-img">
                    <h4>Guantes Deportivos</h4>
                    <p><strong>S/ 39.90</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Antideslizante</button>
                        <button class="category-btn">Con Muñequera</button>
                    </div>
                    <p>Guantes con palma antideslizante y muñequera para mayor protección.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>

                <div class="product-card accesorios unisex">
                    <img src="Imagenes/BANDAS.png" alt="Bandas Elásticas de Resistencia" class="suplemento-img">
                    <h4>Bandas Elásticas de Resistencia</h4>
                    <p><strong>S/ 38.00</strong></p>
                    <div class="product-categories">
                        <button class="category-btn">Ares Fitness</button>
                        <button class="category-btn">Múltiples Colores</button>
                        <button class="category-btn">Resistencia Variable</button>
                    </div>
                    <p>Prepárate para elevar tu entrenamiento al siguiente nivel con nuestras bandas elásticas de resistencia.</p>
                    <div class="product-buttons">
                        <button class="add-to-cart">Agregar al Carro</button>
                        <button class="buy-now">Comprar Ahora</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

<footer>
            <div id="LOGO">
                <a href="index.html" target="_blank"><img id="LOGO" src="Imagenes/logo.png" alt="Logo Ares Fitness"><br><br></a>
            </div>

            <div class="footer_container">

                <!-- SecciÃ³n izquierda: Redes y contacto -->
                <div class="redes-sociales">
                    <strong>Redes Sociales:</strong><br><br>
                    <a href="#" target="_blank"><img src="Imagenes/FB.png" alt="Facebook" class="icono-red"></a>
                    <a href="https://www.instagram.com/aresfitness.peru/" target="_blank"><img src="Imagenes/Insta.png" alt="Instagram" class="icono-red"></a>
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
                <!-- SecciÃ³n central: Enlaces -->
                <div class="footer-section">
                    <a href="#">TERMINOS Y CONDICIONES</a><br><br><br>
                    <a href="#">POLITICAS Y PRIVACIDAD</a><br><br><br>
                    <a href="#">QUEJAS Y RECLAMOS</a>
                </div>

                <!-- SecciÃ³n derecha: soporte y libro -->
                <div class="footer-section" style="text-align: center;">
                    <a href="#">SOPORTE TECNICO</a><br><br><br>
                    <a href="index.jsp">ARES FITNESS</a><br><br><br><br>
                    <span style="color: #00ccff; font-weight: bold;"></span><br>
                    <img src="Imagenes/LibroR.png" alt="Libro de Reclamaciones" style="width: 150px;">
                </div>
            </div>
            
    <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
</footer>   

<!-- Notificación de acciones del carrito -->
<div id="cart-notification" class="cart-notification">
</div>

<!-- Modal de confirmación -->
<div id="confirmation-modal" class="confirmation-modal" style="display: none;">
    <div class="confirmation-content">
        <h3 id="confirmation-message">¿Estás seguro?</h3>
        <div class="confirmation-buttons">
            <button id="confirm-yes" class="confirm-btn">Sí</button>
            <button id="confirm-no" class="cancel-btn">No</button>
        </div>
    </div>
</div>

<script src="JS/carrito.js"></script>
    <script src="JS/Ropa.js"></script>
    <script src="JS/index.js"></script>
</body>
</html>