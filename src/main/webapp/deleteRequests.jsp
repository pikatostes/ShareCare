<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.daw1.ong01.HelloServlet" %>

<%
  // Obtener el ID de la solicitud a eliminar
  int requestID = Integer.parseInt(request.getParameter("id"));

  try {
    // Establecer conexión a la base de datos SQLite
    Connection connection = HelloServlet.connect();

    // Preparar y ejecutar la consulta de eliminación
    String sql = "DELETE FROM Requests WHERE ID = ?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setInt(1, requestID);
    statement.executeUpdate();

    // Cerrar la conexión y liberar los recursos
    statement.close();
    connection.close();

    // Redirigir de vuelta a la página del perfil
    response.sendRedirect("profile.jsp");
  } catch (SQLException e) {
    out.println("Error al conectar a la base de datos: " + e.getMessage());
  }
%>
