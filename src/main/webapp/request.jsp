<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
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
                    try {
                        // Establecer conexión a la base de datos SQLite
                        Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

                        // Obtener la categoría de las solicitudes a mostrar
                        String categoryParam = request.getParameter("category");
                        int category = 0;  // Valor predeterminado

                        if (categoryParam != null && !categoryParam.isEmpty()) {
                            category = Integer.parseInt(categoryParam);
                        }

                        // Preparar y ejecutar la consulta para obtener las solicitudes de la categoría especificada
                        String sql = "SELECT * FROM Requests";
                        PreparedStatement statement;

                        if (category > 0) {
                            sql += " WHERE skill = ?";
                            statement = connection.prepareStatement(sql);
                            statement.setInt(1, category);
                        } else {
                            statement = connection.prepareStatement(sql);
                        }

                        ResultSet resultSet = statement.executeQuery();

                        // Recorrer el conjunto de resultados y mostrar las solicitudes de ayuda que no han sido aceptadas
                        while (resultSet.next()) {
                            int requestID = resultSet.getInt("ID");
                            String skill = resultSet.getString("Skill");
                            String usuario = resultSet.getString("User");
                            String descripcion = resultSet.getString("Description");
                            String fecha = resultSet.getString("Date");
                            boolean accepted = resultSet.getBoolean("Accepted");

                            // Mostrar la solicitud solo si no ha sido aceptada
                            if (!accepted) {
                                // Mostrar cada solicitud en una fila de la tabla
                                out.println("<tr>");
                                switch (skill) {
                                    case "1":
                                        skill = "Carpinteria";
                                        break;
                                    case "2":
                                        skill = "Electricidad";
                                        break;
                                    case "3":
                                        skill = "Fontaneria";
                                        break;
                                    case "4":
                                        skill = "Jardineria";
                                        break;
                                }
                                out.println("<td>" + skill + "</td>");
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

                        // Cerrar la conexión y liberar los recursos
                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (SQLException e) {
                        out.println("Error al conectar a la base de datos: " + e.getMessage());
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