<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Delete Accepted Requests</title>
</head>
<body>
<%
  // Obtener el nombre de usuario de la sesión
  String userName = (String) session.getAttribute("userName");

  // Obtener el ID específico desde la solicitud de parámetros
  int requestID = Integer.parseInt(request.getParameter("id"));

  try {
    // Establecer conexión a la base de datos SQLite
    Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

    // Preparar y ejecutar la consulta para actualizar la solicitud aceptada por el usuario actual con el ID específico
    String sql = "UPDATE Requests SET accepted = false, contributor = null WHERE accepted = true AND contributor = ? AND ID = ?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setString(1, userName);
    statement.setInt(2, requestID);
    int rowsAffected = statement.executeUpdate();

    // Cerrar la conexión y liberar los recursos
    statement.close();
    connection.close();

    // Mostrar el número de filas afectadas
    response.sendRedirect("profile.jsp");
  } catch (SQLException e) {
    out.println("Error al conectar a la base de datos: " + e.getMessage());
  }
%>
</body>
</html>