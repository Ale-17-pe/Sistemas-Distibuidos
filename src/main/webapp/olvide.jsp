<%-- 
    Document   : olvide
    Created on : 11 jul. 2025, 4:51:42 p. m.
    Author     : falex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recuperar Contraseña - AresFitness</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/olvide.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/index.css">
    </head>
    <body>
        <header>
            <div class="logo-container">
                <a href="index.html">
                    <img src="${pageContext.request.contextPath}/Imagenes/logo.png" alt="Logo AresFitness">
                </a>
            </div>
        </header>

        <main class="contenedor-recuperacion">
            <!-- Formulario de recuperación -->
            <div class="formulario-recuperacion" id="formulario">
                <h1>Recuperar Contraseña</h1>
                <p>Ingresa tu correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.</p>

                <form id="recuperarForm">
                    <div class="campo-formulario">
                        <label for="email">Correo Electrónico:</label>
                        <input type="email" id="email" name="email" required placeholder="tu@email.com" autocomplete="email">
                    </div>

                    <button type="button" class="boton-enviar" onclick="enviarCorreo()">Enviar Enlace</button>
                </form>

                <div class="enlaces-extra">
                    <a href="login.html">Volver al Inicio de Sesión</a>
                </div>
            </div>

            <!-- Mensaje de éxito -->
            <div class="formulario-recuperacion" id="mensajeExito" style="display: none;">
                <div class="mensaje-exito">
                    <h1>¡Correo Enviado!</h1>
                    <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="#4CAF50">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                    </svg>
                    <p>Hemos enviado un enlace para restablecer tu contraseña al correo electrónico proporcionado.</p>
                    <p>Por favor revisa tu bandeja de entrada y sigue las instrucciones.</p>
                    <p>Si no recibes el correo en unos minutos, revisa tu carpeta de spam.</p>
                </div>

                <div class="enlaces-extra">
                    <a href="login.html">Volver al Inicio de Sesión</a>
                </div>
            </div>
        </main>

        <footer>
            <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
        </footer>

        <script>
            function enviarCorreo() {
                const email = document.getElementById('email').value;

                if (!email || !email.includes('@')) {
                    alert('Por favor ingresa un correo electrónico válido');
                    return;
                }

                document.getElementById('formulario').style.display = 'none';
                document.getElementById('mensajeExito').style.display = 'block';

                // Aquí puedes agregar tu llamada AJAX si es necesario
            }
        </script>
    </body>
</html>
