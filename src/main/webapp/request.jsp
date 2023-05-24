<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.daw1.ong01.Requests" %>
<%@ page import="com.daw1.ong01.Request" %>
<%@ page import="java.util.List" %>
<% Class.forName("org.sqlite.JDBC"); %>

<html>
<head>
    <meta charset="UTF-8">
    <title>ShareCare - Solicitudes de Ayuda</title>
    <link rel="stylesheet" href="styleRequest.css">
</head>
<body>
<div id="container">
    <header>
        <div class="logo">
            <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
            <a href="index.jsp">
                <h1>ShareCare</h1>
            </a>
        </div>
        <nav>
            <a href="index.jsp" class="nav-link"><img src="imagen/home.png" alt="Home" style="height: 2em"></a>
            <a href="" class="nav-link"><img src="imagen/request.png" alt="Requests" style="height: 2em"></a>
            <% if (session.getAttribute("userName") == null) { %>
            <a href="login.jsp" class="log-in">Log In</a>
            <a href="registro.jsp" class="register">Register</a>
            <% } else { %>
            <a class="log-in" style="background-color: blue" href="profile.jsp">Hola, <%= session.getAttribute("userName") %>!</a>
            <a href="logout.jsp" class="log-in" style="background-color: red">Cerrar Sesión</a>
            <% } %>
        </nav>
    </header>

    <div id="filterButtons">
        <form action="request.jsp" method="get">
            <button type="submit" name="category" value="0" class="btn btn-default">All</button>
            <button type="submit" name="category" value="1" class="btn btn-carpinteria">Carpintería</button>
            <button type="submit" name="category" value="2" class="btn btn-electricidad">Electricidad</button>
            <button type="submit" name="category" value="3" class="btn btn-fontaneria">Fontanería</button>
            <button type="submit" name="category" value="4" class="btn btn-jardineria">Jardinería</button>
        </form>
    </div>

    <div id="main">
        <div id="helpRequest">
            <h2>Solicitudes de Ayuda</h2>
            <table class="styled-table">
                <tr>
                    <th>Categoría</th>
                    <th>Usuario</th>
                    <th>Descripción</th>
                    <th>Fecha</th>
                    <th>Acciones</th>
                </tr>
                <%
                    List<Request> requests = Requests.getAllRequests();
                    int filterCategory = 0; // Valor predeterminado para mostrar todas las solicitudes

// Verificar si se ha enviado el parámetro "category"
                    String categoryParam = request.getParameter("category");
                    if (categoryParam != null && !categoryParam.isEmpty()) {
                        try {
                            filterCategory = Integer.parseInt(categoryParam);
                        } catch (NumberFormatException e) {
                            // Manejar el error en caso de que el parámetro no sea un número válido
                            e.printStackTrace();
                        }
                    }

                    for (Request req : requests) {
                        // Obtener los detalles de la solicitud
                        int requestID = req.getId();
                        int skill = req.getSkill();
                        String usuario = req.getUser();
                        String descripcion = req.getDescription();
                        String fecha = req.getDate();
                        boolean accepted = req.isAccepted();

                        // Mostrar la solicitud solo si no ha sido aceptada
                        if (!accepted) {
                            // Aplicar el filtro según la categoría seleccionada
                            if (filterCategory == 0 || skill == filterCategory) {
                                // Mostrar cada solicitud en una fila de la tabla
                                out.println("<tr>");
                                out.println("<td>" + Requests.getCategoryName(skill) + "</td>");
                                out.println("<td>" + usuario + "</td>");
                                out.println("<td>" + descripcion + "</td>");
                                out.println("<td>" + fecha + "</td>");
                                out.println("<td>");
                                out.println("<form action=\"acceptRequest.jsp\" method=\"post\">");
                                out.println("<input type=\"hidden\" name=\"requestID\" value=\"" + requestID + "\">");
                                out.println("<input type=\"hidden\" name=\"acceptedBy\" value=\"" + session.getAttribute("userName") + "\">");
                                out.println("<input type=\"submit\" value=\"Aceptar\" class=\"accept-button\">");
                                out.println("</form>");
                                out.println("</td>");
                                out.println("</tr>");
                            }
                        }
                    }
                %>
            </table>
        </div>
        <div id="createHelp">
            <h2>Crear nueva solicitud de ayuda:</h2>
            <form action="crear-solicitud.jsp" method="post">
                <label for="categoria">Categoría:</label>
                <select name="categoria" id="categoria">
                    <option value="1">Carpintería</option>
                    <option value="2">Electricidad</option>
                    <option value="3">Fontanería</option>
                    <option value="4">Jardinería</option>
                </select><br>
                <label for="usuario">Usuario:</label>
                <input type="text" name="usuario" id="usuario" value="<%= session.getAttribute("userName") %>" required><br>
                <label for="descripcion">Descripción:</label>
                <textarea name="descripcion" id="descripcion" rows="3" required></textarea><br>
                <input type="submit" value="Enviar solicitud">
            </form>
        </div>
    </div>
</div>
</body>
</html>