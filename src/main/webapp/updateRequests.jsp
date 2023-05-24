<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // Obtener los parámetros enviados desde el formulario
  int requestID = Integer.parseInt(request.getParameter("requestID"));
  String action = request.getParameter("action");

  try {
    // Establecer conexión a la base de datos SQLite
    Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

    if (action.equals("removeContributor")) {
      // Actualizar la solicitud para quitar al contribuidor y volver a ponerla en pendiente
      String sql = "UPDATE Requests SET contributor = '', accepted = 0 WHERE ID = ?";
      PreparedStatement statement = connection.prepareStatement(sql);
      statement.setInt(1, requestID);
      statement.executeUpdate();
      statement.close();
    } else if (action.equals("setPending")) {
      // Actualizar la solicitud para volver a ponerla en pendiente
      String sql = "UPDATE Requests SET accepted = 0 WHERE ID = ?";
      PreparedStatement statement = connection.prepareStatement(sql);
      statement.setInt(1, requestID);
      statement.executeUpdate();
      statement.close();
    }

    // Cerrar la conexión
    connection.close();

    // Redirigir de vuelta a la página de detalles de la solicitud
    response.sendRedirect("profile.jsp");
  } catch (SQLException e) {
    out.println("Error al conectar a la base de datos: " + e.getMessage());
  }
%>