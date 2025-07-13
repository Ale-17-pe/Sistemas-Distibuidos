<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.apiweb.aresfitnes.Model.Usuario"%>
<%@page import="com.apiweb.aresfitnes.Model.Cliente"%>
<%@page import="com.apiweb.aresfitnes.Model.Pago"%>
<%@page import="com.apiweb.aresfitnes.Model.Membresia"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page session="true"%>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogeado");
    if (usuario == null || !usuario.getRol().equals("ADMIN")) {
        response.sendRedirect("login.jsp?error=no_autenticado");
        return;
    }
    
    // Obtener datos reales
    List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
    List<Pago> pagos = (List<Pago>) request.getAttribute("pagos");
    List<Membresia> membresias = (List<Membresia>) request.getAttribute("membresias");
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AresFitness - Admin</title>
    <link rel="stylesheet" href="Css/admin.css">
    <link rel="icon" href="Imagenes/logo.png" type="image/png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="admin-container">
        <!-- Sidebar -->
        <aside class="admin-sidebar">
            <div class="sidebar-header">
                <img src="Imagenes/logo.png" alt="Logo AresFitness" class="admin-logo">
                <h2>Panel de Admin</h2>
            </div>

            <nav class="sidebar-nav">
                <ul>
                    <li class="active">
                        <a href="#dashboard">
                            <i class="fas fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#usuarios">
                            <i class="fas fa-users"></i>
                            <span>Usuarios</span>
                            <span class="badge"><%= clientes != null ? clientes.size() : 0 %></span>
                        </a>
                    </li>
                    <li>
                        <a href="#membresias">
                            <i class="fas fa-id-card"></i>
                            <span>Membresías</span>
                        </a>
                    </li>
                    <li>
                        <a href="#reportes">
                            <i class="fas fa-chart-bar"></i>
                            <span>Reportes</span>
                        </a>
                    </li>
                    <li>
                        <a href="#configuracion">
                            <i class="fas fa-cog"></i>
                            <span>Configuración</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <div class="sidebar-footer">
                <div class="admin-profile">
                    <img src="Imagenes/admin-avatar.png" alt="Admin Avatar">
                    <div class="profile-info">
                        <strong><%= usuario.getNombre() %></strong>
                        <small>Administrador</small>
                    </div>
                </div>
                <a href="LogoutServlet" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Cerrar Sesión</span>
                </a>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="admin-main">
            <header class="admin-header">
                <div class="header-left">
                    <button class="menu-toggle">
                        <i class="fas fa-bars"></i>
                    </button>
                    <h1>Dashboard</h1>
                </div>

                <div class="header-right">
                    <div class="search-box">
                        <input type="text" placeholder="Buscar..." id="globalSearch">
                        <button><i class="fas fa-search"></i></button>
                    </div>
                    <div class="notifications">
                        <button class="notification-btn">
                            <i class="fas fa-bell"></i>
                            <span class="badge danger"><%= contarMembresiasPorVencer(membresias) %></span>
                        </button>
                    </div>
                </div>
            </header>

            <div class="admin-content">
                <!-- Estadísticas Rápidas -->
                <section class="stats-section">
                    <div class="stat-card">
                        <div class="stat-icon primary">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <h3><%= clientes != null ? clientes.size() : 0 %></h3>
                            <p>Usuarios Registrados</p>
                        </div>
                        <div class="stat-trend">
                            <i class="fas fa-arrow-up"></i>
                            <span><%= calcularCrecimientoClientes(clientes) %>% este mes</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon success">
                            <i class="fas fa-id-card"></i>
                        </div>
                        <div class="stat-info">
                            <h3><%= contarMembresiasActivas(clientes) %></h3>
                            <p>Membresías Activas</p>
                        </div>
                        <div class="stat-trend">
                            <i class="fas fa-arrow-up"></i>
                            <span><%= calcularCrecimientoMembresias(membresias) %>% este mes</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon warning">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <div class="stat-info">
                            <h3><%= contarAsistenciasHoy(pagos) %></h3>
                            <p>Asistencias Hoy</p>
                        </div>
                        <div class="stat-trend">
                            <i class="fas fa-arrow-up"></i>
                            <span><%= calcularCrecimientoAsistencias(pagos) %>% este mes</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon danger">
                            <i class="fas fa-exclamation-circle"></i>
                        </div>
                        <div class="stat-info">
                            <h3><%= contarPagosPendientes(pagos) %></h3>
                            <p>Pagos Pendientes</p>
                        </div>
                        <div class="stat-trend">
                            <i class="fas fa-arrow-down"></i>
                            <span><%= calcularReduccionPendientes(pagos) %>% este mes</span>
                        </div>
                    </div>
                </section>

                <!-- Tabla de Últimos Usuarios -->
                <section class="table-section">
                    <div class="section-header">
                        <h3>Últimos Usuarios Registrados</h3>
                        <a href="#usuarios" class="view-all">Ver Todos</a>
                    </div>
                    <div class="table-responsive">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Email</th>
                                    <th>Membresía</th>
                                    <th>Fecha Registro</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if(clientes != null && !clientes.isEmpty()) { %>
                                    <% for(int i = 0; i < Math.min(clientes.size(), 5); i++) { %>
                                        <% Cliente cliente = clientes.get(i); %>
                                        <tr>
                                            <td>#<%= cliente.getId() %></td>
                                            <td>
                                                <div class="user-info">
                                                    <img src="Imagenes/user-avatar.png" alt="<%= cliente.getNombre() %>">
                                                    <span><%= cliente.getNombre() %> <%= cliente.getApellido() %></span>
                                                </div>
                                            </td>
                                            <td><%= cliente.getCorreo() %></td>
                                            <td><%= cliente.getMembresia() != null ? cliente.getMembresia().getNombre() : "Sin membresía" %></td>
                                            <td><%= dateFormat.format(cliente.getFechaRegistro()) %></td>
                                            <td>
                                                <span class="status-badge <%= cliente.getEstado().equalsIgnoreCase("activo") ? "active" : "inactive" %>">
                                                    <%= cliente.getEstado() %>
                                                </span>
                                            </td>
                                            <td>
                                                <button class="action-btn view" onclick="verDetalleUsuario(<%= cliente.getId() %>)">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn edit" onclick="editarUsuario(<%= cliente.getId() %>)">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    <% } %>
                                <% } else { %>
                                    <tr>
                                        <td colspan="7" class="no-data">No hay usuarios registrados</td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </section>

                <!-- Actividad Reciente -->
                <section class="activity-section">
                    <div class="section-header">
                        <h3>Actividad Reciente</h3>
                    </div>
                    <div class="activity-list">
                        <% if(pagos != null && !pagos.isEmpty()) { %>
                            <% for(int i = 0; i < Math.min(pagos.size(), 3); i++) { %>
                                <% Pago pago = pagos.get(i); %>
                                <div class="activity-item">
                                    <div class="activity-icon">
                                        <i class="fas fa-money-bill-wave"></i>
                                    </div>
                                    <div class="activity-content">
                                        <p>
                                            <strong>Pago registrado</strong> - 
                                            <%= obtenerNombreCliente(pago.getClienteId(), clientes) %> pagó S/<%= pago.getMonto() %>
                                        </p>
                                        <small><%= dateFormat.format(pago.getFechaPago()) %></small>
                                    </div>
                                </div>
                            <% } %>
                        <% } else { %>
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-info-circle"></i>
                                </div>
                                <div class="activity-content">
                                    <p><strong>No hay actividad reciente</strong></p>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </section>
            </div>
        </main>
    </div>

    <script src="JS/admin.js"></script>
    <script>
        function verDetalleUsuario(id) {
            window.location.href = 'DetalleUsuarioServlet?id=' + id;
        }
        
        function editarUsuario(id) {
            window.location.href = 'EditarUsuarioServlet?id=' + id;
        }
        
        // Búsqueda global
        document.getElementById('globalSearch').addEventListener('keyup', function(e) {
            if(e.key === 'Enter') {
                const query = this.value.trim();
                if(query.length > 2) {
                    window.location.href = 'BusquedaServlet?q=' + encodeURIComponent(query);
                }
            }
        });
    </script>
</body>
</html>

<%!
    // Métodos de ayuda para el JSP
    
    private int contarMembresiasPorVencer(List<Membresia> membresias) {
        if(membresias == null) return 0;
        int count = 0;
        long ahora = System.currentTimeMillis();
        long unaSemana = 7 * 24 * 60 * 60 * 1000;
        
        for(Membresia m : membresias) {
            if(m.getFechaVencimiento() != null && 
               m.getFechaVencimiento().getTime() > ahora && 
               m.getFechaVencimiento().getTime() < (ahora + unaSemana)) {
                count++;
            }
        }
        return count;
    }
    
    private int contarMembresiasActivas(List<Cliente> clientes) {
        if(clientes == null) return 0;
        int count = 0;
        long ahora = System.currentTimeMillis();
        
        for(Cliente c : clientes) {
            if(c.getMembresia() != null && 
               c.getMembresia().getFechaVencimiento() != null && 
               c.getMembresia().getFechaVencimiento().getTime() > ahora) {
                count++;
            }
        }
        return count;
    }
    
    private int contarAsistenciasHoy(List<Pago> pagos) {
        if(pagos == null) return 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String hoy = sdf.format(new Date());
        int count = 0;
        
        for(Pago p : pagos) {
            if(sdf.format(p.getFechaPago()).equals(hoy) {
                count++;
            }
        }
        return count;
    }
    
    private int contarPagosPendientes(List<Pago> pagos) {
        if(pagos == null) return 0;
        int count = 0;
        
        for(Pago p : pagos) {
            if("PENDIENTE".equalsIgnoreCase(p.getEstado())) {
                count++;
            }
        }
        return count;
    }
    
    private int calcularCrecimientoClientes(List<Cliente> clientes) {
        // Implementación simplificada - deberías comparar con el mes anterior
        return clientes != null ? Math.min(20, clientes.size()) : 0;
    }
    
    private int calcularCrecimientoMembresias(List<Membresia> membresias) {
        // Implementación simplificada
        return membresias != null ? Math.min(15, membresias.size()) : 0;
    }
    
    private int calcularCrecimientoAsistencias(List<Pago> pagos) {
        // Implementación simplificada
        return pagos != null ? Math.min(25, pagos.size()) : 0;
    }
    
    private int calcularReduccionPendientes(List<Pago> pagos) {
        // Implementación simplificada
        return pagos != null ? Math.min(10, pagos.size()) : 0;
    }
    
    private String obtenerNombreCliente(int clienteId, List<Cliente> clientes) {
        if(clientes == null) return "Cliente";
        for(Cliente c : clientes) {
            if(c.getId() == clienteId) {
                return c.getNombre() + " " + c.getApellido();
            }
        }
        return "Cliente";
    }
%>