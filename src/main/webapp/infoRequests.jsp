<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShareCare - Request Info</title>
    <link rel="stylesheet" href="styleProfile.css">
</head>
<body>
<div class="container">
    <header>
        <div class="logo">
            <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
            <a href="index.jsp">
                <h1>ShareCare</h1>
            </a>
        </div>
        <nav>
            <a href="index.jsp" class="nav-link">Home</a>
            <a href="request.jsp" class="nav-link">Help someone</a>
            <% if (session.getAttribute("userName") == null) { %>
            <a href="login.jsp" class="log-in">Log In</a>
            <a href="registro.jsp" class="register">Register</a>
            <% } else { %>
            <a class="log-in" style="background-color: blue" href="profile.jsp">Hola, <%= session.getAttribute("userName") %>!</a>
            <a href="logout.jsp" class="log-in" style="background-color: red">Cerrar Sesión</a> <!-- Botón de cierre de sesión -->
            <% } %>
        </nav>
    </header>
    <h2>Detalles de la solicitud</h2>
    <div id="main">
        <%
            // Obtener el ID de la solicitud enviado desde la página anterior
            int requestID = Integer.parseInt(request.getParameter("requestID"));

            try {
                // Establecer conexión a la base de datos SQLite
                Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

                // Preparar y ejecutar la consulta para obtener los detalles de la solicitud
                String sql = "SELECT * FROM Requests WHERE ID = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, requestID);
                ResultSet resultSet = statement.executeQuery();

                // Mostrar los detalles de la solicitud
                if (resultSet.next()) {
                    int skill = resultSet.getInt("skill");
                    String user = resultSet.getString("User");
                    String requestDescription = resultSet.getString("Description");
                    String date = resultSet.getString("Date");
                    boolean accepted = resultSet.getBoolean("accepted");
                    String contributor = resultSet.getString("contributor");

                    String skillString = "";
                    switch (skill) {
                        case 1:
                            skillString = "Carpinteria";
                            break;
                        case 2:
                            skillString = "Electricidad";
                            break;
                        case 3:
                            skillString = "Fontaneria";
                            break;
                        case 4:
                            skillString = "Jardineria";
                            break;
                    }

                    // Mostrar los detalles de la solicitud en la página
                    out.println("<p><strong>Categoría:</strong> " + skillString + "</p>");
                    out.println("<p><strong>Usuario:</strong> " + user + "</p>");
                    out.println("<p><strong>Descripción:</strong> " + requestDescription + "</p>");
                    out.println("<p><strong>Fecha:</strong> " + date + "</p>");
                    out.println("<p><strong>Estado:</strong> " + (accepted ? "Aceptada" : "Pendiente") + "</p>");
                    out.println("<p><strong>Contribuidor:</strong> " + contributor + "</p>");

                    // Si la solicitud está aceptada, mostrar el botón para finalizar la solicitud
                    if (accepted) {
                        out.println("<form action=\"deleteRequests.jsp\" method=\"post\">");
                        out.println("<input type=\"hidden\" name=\"requestID\" value=\"" + requestID + "\">");
                        out.println("<input type=\"submit\" value=\"Finalizar Solicitud\" class=\"finish-request-button\">");
                        out.println("</form>");
                    }
                } else {
                    out.println("<p>No se encontraron detalles para la solicitud.</p>");
                }

                // Cerrar la conexión y liberar los recursos
                resultSet.close();
                statement.close();
                connection.close();
            } catch (SQLException e) {
                out.println("Error al conectar a la base de datos: " + e.getMessage());
            }
        %>
    </div>
    <br>
    <a href="request.jsp" style="padding: 1em; width: 100%; background-color: lightblue">Volver a Mis Solicitudes</a>
</div>
</body>
</html>