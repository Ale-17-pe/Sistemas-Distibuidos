<%-- 
    Document   : carrito
    Created on : 11 jul. 2025, 1:22:03?p.�m.
    Author     : falex
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrito de Compras - AresFitness</title>
        <link rel="stylesheet" href="Css/carrito.css">
        <link rel="stylesheet" href="Css/index.css">
        <link rel="stylesheet" href="Css/HyF.css">
        <link rel="icon" href="Imagenes/logo.png" type="image/png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
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
                    <li><a href="planes.html">PLANES</a></li>
                    <li><a href="ubi.html">UBICACI�N</a></li>
                    <li><a href="suple.html">SUPLEMENTOS</a></li>
                    <li><a href="ropa.html">ROPA</a></li>

                    <!--Login de usuario-->
                    <a href="login.jsp"><button class="login-btn" id="loginButton">
                            <div class="login-btn__icon">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <!-- Icono de usuario/login -->
                                <path d="M12 4a4 4 0 0 1 4 4 4 4 0 0 1-4 4 4 4 0 0 1-4-4 4 4 0 0 1 4-4m0 10c4.42 0 8 1.79 8 4v2H4v-2c0-2.21 3.58-4 8-4z"/>
                                </svg>
                            </div>
                            <div class="login-btn__text">Entrar</div>
                        </button></a>

                    <!--Carrito de compras-->
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

        <main class="cart-page">
            <div class="cart-container">
                <h1>Carrito de Compras</h1>

                <!-- Mensaje cuando el carrito est� vac�o -->
                <div id="empty-cart-message" class="empty-cart" style="display: none;">
                    <div class="empty-cart-content">
                        <svg class="empty-cart-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M17 18a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2M1 2h3.27l.94 2H20a1 1 0 0 1 1 1c0 .17-.05.34-.12.5l-3.58 6.47c-.34.61-1 1.03-1.8 1.03H8.1l-.9 1.63-.03.12a.25.25 0 0 0 .25.25H19v2H7a2 2 0 0 1-2-2c0-.35.09-.68.24-.96l1.36-2.45L3 4H1V2m6 16a2 2 0 0 1 2 2 2 2 0 0 1-2 2 2 2 0 0 1-2-2c0-1.11.89-2 2-2m9-7l2.78-5H6.14l2.36 5H16z"/>
                        </svg>
                        <h2>Tu carrito est� vac�o</h2>
                        <p>Descubre nuestros productos y agrega tus favoritos al carrito</p>
                        <button class="browse-products-btn" onclick="browseProducts()">Ver Productos</button>
                    </div>
                </div>

                <!-- Contenido del carrito -->
                <div class="cart-content" style="display: none;">
                    <div class="cart-items-section">
                        <h2>Productos en tu carrito</h2>
                        <div id="cart-items-list">
                            <!-- Los items se cargar�n aqu� din�micamente -->
                        </div>

                        <div class="cart-actions">
                            <button class="clear-cart-btn" onclick="clearCart()">Vaciar Carrito</button>
                            <button class="continue-shopping-btn" onclick="continueShopping()">Seguir Comprando</button>
                        </div>
                    </div>

                    <div class="cart-summary">
                        <h3>Resumen de Compra</h3>
                        <div id="cart-total-section">
                            <!-- El total se calcular� aqu� -->
                        </div>

                        <div class="checkout-section">
                            <button id="checkout-btn" class="checkout-btn">Proceder al Pago</button>
                        </div>

                        <!-- Secci�n de recomendaciones -->
                        <div class="recommendations-section">
                            <h3>Te puede interesar</h3>
                            <div id="recommendations-list">
                                <!-- Las recomendaciones se cargar�n aqu� -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

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
                    <strong>CONT�CTANOS:</strong><br><br>
                    <a href="#" target="_blank"><img src="Imagenes/WhatsApp.png" alt="WhatsApp" style="width: 20px; vertical-align: middle;"></a><br><br>
                    <a href="#" target="_blank"><img src="Imagenes/Gmail.png" alt="Correo electr�nico" style="width: 20px; vertical-align: middle;"></a> 
                </div>

                <!-- Enlaces -->
                <div class="footer-section">
                    <a href="#">T�RMINOS Y CONDICIONES</a><br><br><br>
                    <a href="#">POL�TICAS Y PRIVACIDAD</a><br><br><br>
                    <a href="#">QUEJAS Y RECLAMOS</a>
                </div>

                <!-- Soporte -->
                <div class="footer-section" style="text-align: center;">
                    <a href="#">SOPORTE T�CNICO</a><br><br><br>
                    <a href="index.jsp">ARES FITNESS</a><br><br><br><br>
                    <img src="Imagenes/LibroR.png" alt="Libro de Reclamaciones" style="width: 150px;">
                </div>
            </div>

            <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
        </footer>

        <!-- Scripts -->
        <script src="JS/carrito.js"></script>
        <script src="JS/index.js"></script>
    </body>
</html>