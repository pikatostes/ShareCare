<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // Obtener los parámetros enviados desde el formulario
  int requestID = Integer.parseInt(request.getParameter("requestID"));
  String acceptedBy = session.getAttribute("userName").toString();

  try {
    // Establecer conexión a la base de datos SQLite
    Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

    // Actualizar la solicitud aceptada en la base de datos
    String sql = "UPDATE Requests SET accepted = 1, contributor = ? WHERE ID = ?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setString(1, acceptedBy);
    statement.setInt(2, requestID);
    statement.executeUpdate();

    // Cerrar la conexión y liberar los recursos
    statement.close();
    connection.close();

    // Redireccionar al perfil del usuario después de aceptar la solicitud
    response.sendRedirect("request.jsp");
  } catch (SQLException e) {
    out.println("Error al conectar a la base de datos: " + e.getMessage());
  }
%>