<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShareCare - Profile</title>
    <link rel="stylesheet" href="styleProfile.css">
    <script>
        function showRequests() {
            document.getElementById("myRequests").style.display = "block";
            document.getElementById("acceptedRequests").style.display = "none";
        }

        function showAcceptedRequests() {
            document.getElementById("myRequests").style.display = "none";
            document.getElementById("acceptedRequests").style.display = "block";
        }
    </script>
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

    <div class="main">
        <div class="profile">
            <div class="profilePic">
                <img src="imagen/gus.webp" alt="imagen de prueba">
            </div>
            <div class="info">
                <h2>Edit info</h2>
                <form action="profileChange.jsp" method="post">
                    <label for="email"><input type="email" name="email" id="email" placeholder="email"></label>
                    <label for="user"><input type="text" name="user" id="user" placeholder="user"></label>
                    <label for="password"><input type="password" name="password" id="password" placeholder="<%= session.getAttribute("userName") %>"></label>
                    <label for="role">Role:</label>
                    <select name="role" id="role">
                        <option value="0">Solicitante</option>
                        <option value="1">Contribuidor</option>
                    </select>
                    <div class="options">
                        <input type="submit" value="Change">
                        <input type="reset" value="Revert">
                    </div>
                </form>

            </div>
        </div>
        <table id="myRequests" class="styled-table">
            <thead>
            <tr>
                <th>Category</th>
                <th>User</th>
                <th>Description</th>
                <th>Date</th>
                <th>Estate</th>
                <th>Contributor</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                // Obtener el nombre de usuario de la sesión
                String userName = (String) session.getAttribute("userName");

                try {
                    // Establecer conexión a la base de datos SQLite
                    Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

                    // Preparar y ejecutar la consulta para obtener las solicitudes del usuario actual
                    String sql = "SELECT * FROM Requests WHERE User = ?";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, userName);
                    ResultSet resultSet = statement.executeQuery();

                    // Mostrar las solicitudes del usuario
                    while (resultSet.next()) {
                        // Obtener los detalles de la solicitud
                        int requestID = resultSet.getInt("ID");
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

                        // Mostrar los detalles de la solicitud en la tabla
                        out.println("<tr>");
                        out.println("<td>" + skillString + "</td>");
                        out.println("<td>" + user + "</td>");
                        out.println("<td>" + requestDescription + "</td>");
                        out.println("<td>" + date + "</td>");
                        out.println("<td>" + (accepted ? "Aceptada" : "Pendiente") + "</td>");
                        out.println("<td>" + contributor + "</td>");
                        out.println("<td>");
                        out.println("<button class=\"chat-button\">Chat</button>");
                        out.println("<form action=\"deleteRequests.jsp\" method=\"post\">");
                        out.println("<input type=\"hidden\" name=\"id\" value=\"" + requestID + "\">");
                        out.println("<input type=\"submit\" value=\"Eliminar\" class=\"delete-button\">");
                        out.println("</form>");
                        out.println("</td>");
                        out.println("</tr>");
                    }

                    // Cerrar la conexión y liberar los recursos
                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (SQLException e) {
                    out.println("Error al conectar a la base de datos: " + e.getMessage());
                }
            %>
            </tbody>
        </table>

        <table id="acceptedRequests" class="styled-table" style="display: none;">
            <thead>
            <tr>
                <th>Category</th>
                <th>User</th>
                <th>Description</th>
                <th>Date</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                try {
                    // Establecer conexión a la base de datos SQLite
                    Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

                    // Preparar y ejecutar la consulta para obtener las solicitudes aceptadas por el usuario actual
                    String acceptedSql = "SELECT * FROM Requests WHERE accepted = true AND contributor = ?";
                    PreparedStatement acceptedStatement = connection.prepareStatement(acceptedSql);
                    acceptedStatement.setString(1, userName);
                    ResultSet acceptedResultSet = acceptedStatement.executeQuery();

                    // Mostrar las solicitudes aceptadas por el usuario
                    while (acceptedResultSet.next()) {
                        // Obtener los detalles de la solicitud aceptada
                        int requestID = acceptedResultSet.getInt("ID");
                        int skill = acceptedResultSet.getInt("skill");
                        String user = acceptedResultSet.getString("User");
                        String requestDescription = acceptedResultSet.getString("Description");

                        String skillString = String.valueOf(skill);

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

                        // Mostrar los detalles de la solicitud aceptada en la tabla
                        out.println("<tr>");
                        out.println("<td>" + skillString + "</td>");
                        out.println("<td>" + user + "</td>");
                        out.println("<td>" + requestDescription + "</td>");
                        out.println("<td>");
                        out.println("<button class=\"chat-button\">Chat</button>");
                        out.println("<form action=\"deleteAcceptedRequests.jsp\" method=\"post\">");
                        out.println("<input type=\"hidden\" name=\"id\" value=\"" + requestID + "\">");
                        out.println("<input type=\"submit\" value=\"Eliminar\" class=\"delete-button\">");
                        out.println("</form>");
                        out.println("</td>");
                        out.println("</tr>");
                    }

                    // Cerrar la conexión y liberar los recursos
                    acceptedResultSet.close();
                    acceptedStatement.close();
                    connection.close();
                } catch (SQLException e) {
                    out.println("Error al conectar a la base de datos: " + e.getMessage());
                }
            %>
            </tbody>
        </table>
        <div>
            <button onclick="showRequests()">My Requests</button>
            <button onclick="showAcceptedRequests()">Accepted Requests</button>
        </div>
    </div>
</div>
</body>
</html>