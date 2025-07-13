<%-- 
    Document   : login
    Created on : 22 jun. 2025, 20:53:19
    Author     : ASPIRE 5 CI7 10MA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - AresFitness</title>
    <link rel="stylesheet" href="Css/login.css">
    <link rel="icon" href="Imagenes/logo.png" type="image/png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<style>
.btn-login {
    width: 100%;
    padding: 14px 0;
    background: linear-gradient(135deg, #ffd500, #ff9900);
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    color: #2c2c2c;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 20px;
    box-shadow: 0 4px 10px rgba(255, 213, 0, 0.3);
}

.btn-login:hover {
    background: linear-gradient(135deg, #ff9900, #ffd500);
    box-shadow: 0 6px 15px rgba(255, 213, 0, 0.5);
    transform: translateY(-2px);
}   
</style> 
    <body class="bg-light">
        <!-- Encabezado -->
        <header>
            <div class="logo-container">
                <a href="index.jsp">
                    <img src="Imagenes/logo.png" alt="Logo AresFitness">
                </a>
            </div>
        </header>

        <!-- Formulario -->
        <div class="main-wrapper">
            <div class="container">
                <div class="form-content">
                    <div class="user-icon">
                        <img src="Imagenes/usuario.png" alt="Icono de usuario" />
                    </div>
                    <h1 id="title">INICIAR SESIÓN</h1>
                    <p class="subtitle">Ingresa tus credenciales para acceder a tu cuenta</p>

                    <form id="loginForm" action="LoginServlet" method="post">
                        <div class="input-group">
                            <div class="input-field" id="nameInput">
                                <i class="fa-solid fa-envelope"></i>
                                <input type="number "name="dni" id="email" placeholder="dni" maxlength="8" pattern="\d{8}" required />
                            </div>
                            <div class="input-field">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" name="contrasena" id="password" placeholder="Contraseña" minlength="8" required />
                                <i class="fa-regular fa-eye-slash toggle-password" id="togglePassword" style="cursor: pointer;"></i>
                            </div>
                            <div class="OLVIDE">
                                <a href="olvide.jsp">¿Olvidaste tu contraseña?</a>
                            </div>
                        </div>
                        <button type="submit" class="btn-login">Ingresar</button>
                    </form>
                    <div class="text-center mt-3">
                        <a href="PlanServlet">¿No tienes cuenta? Matriculate</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pie de pÃ¡gina bÃ¡sico -->
        <footer>
            <p style="text-align: center; color: #888;">&copy; 2025 AresFitness. Todos los derechos reservados.</p>
        </footer>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
