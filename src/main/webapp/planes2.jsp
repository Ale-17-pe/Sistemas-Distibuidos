<%-- 
    Document   : planes2
    Created on : 3 jul. 2025, 13:48:05
    Author     : ASPIRE 5 CI7 10MA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Planes del Gimnasio</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .plan {
                border: 2px dashed red;
                border-radius: 8px;
                padding: 12px;
                margin-bottom: 10px;
                background-color: #f8f8f8;
            }
        </style>
    </head>
    <body>
        <h2>🏋️ Planes disponibles</h2>
        <div id="planesContainer">Cargando planes...</div>

        <script>
            fetch('http://localhost:8080/AresFitnes/api/planes')
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Error al cargar los planes');
                        }
                        return response.json();
                    })
                    .then(planes => {
                        const contenedor = document.getElementById('planesContainer');
                        contenedor.innerHTML = '';

                        planes.forEach(plan => {
                            const nombre = plan.nombre || "Sin nombre";
                            const descripcion = (plan.descripcion || "").replace(/\n/g, "<br>");
                            const duracion = plan.duracionMeses || 0;
                            const precio = plan.precio !== undefined ? parseFloat(plan.precio).toFixed(2) : "0.00";

                            let html = `
                    <div class="plan">
                        <h3>\${nombre}</h3>
                        <p>\${descripcion}</p>
                        <p><strong>Duración:</strong> \${duracion} mes(es)</p>
                        <p><strong>Precio:</strong> S/ \${precio}</p>
                    </div>
                `;
                            html = html
                                    .replace('${nombre}', nombre)
                                    .replace('${descripcion}', descripcion)
                                    .replace('${duracion}', duracion)
                                    .replace('${precio}', precio);

                            contenedor.innerHTML += html;

                        });
                    })
                    .catch(error => {
                        document.getElementById('planesContainer').innerText = '❌ Error: ' + error.message;
                    });
        </script>
    </body>
</html>
