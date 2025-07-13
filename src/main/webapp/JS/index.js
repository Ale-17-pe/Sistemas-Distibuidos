document.addEventListener("DOMContentLoaded", function () {
    // Efecto de pausa al hacer hover en la barra de promoción
    const promoContainer = document.querySelector(".promo-scroll-container");

    if (promoContainer) {
        promoContainer.addEventListener("mouseenter", function () {
            this.style.animationPlayState = "paused";
        });

        promoContainer.addEventListener("mouseleave", function () {
            this.style.animationPlayState = "running";
        });

        // Click en banners laterales
        document.querySelectorAll(".promo-item").forEach((item) => {
            item.addEventListener("click", function () {
                alert("Producto seleccionado: " + this.querySelector("img").alt);
            });
        });
    }

    // Efecto parallax
    window.addEventListener("scroll", function () {
        const parallaxSection = document.querySelector(".parallax-section");
        if (parallaxSection) {
            const scrollPosition = window.pageYOffset;
            parallaxSection.style.backgroundPositionY = scrollPosition * 0.5 + "px";
        }
    });

    // SESIÓN: Verificar token y mostrar usuario
    const token = localStorage.getItem("token");
    const nombreUsuarioSpan = document.getElementById("nombreUsuario");
    const loginLink = document.getElementById("loginLink");
    const logoutBtn = document.getElementById("logoutBtn");

    if (token) {
        try {
            const payloadBase64 = token.split(".")[1];
            const payload = JSON.parse(atob(payloadBase64));
            const nombreUsuario = payload.usuario;

            // Mostrar el nombre y ocultar botón de login
            if (nombreUsuarioSpan) {
                nombreUsuarioSpan.textContent = `Hola, ${nombreUsuario}`;
            }
            if (loginLink) {
                loginLink.style.display = "none";
            }
            if (logoutBtn) {
                logoutBtn.style.display = "inline-block";
            }

            // Acción de cerrar sesión
            if (logoutBtn) {
                logoutBtn.addEventListener("click", () => {
                    localStorage.removeItem("token");
                    location.reload();
                });
            }
        } catch (error) {
            console.error("Token inválido:", error);
            localStorage.removeItem("token");
        }
    } else {
        // No hay sesión
        if (logoutBtn) {
            logoutBtn.style.display = "none";
        }
        if (nombreUsuarioSpan) {
            nombreUsuarioSpan.textContent = "";
        }
    }
});