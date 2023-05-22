<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<% Class.forName("org.sqlite.JDBC"); %>

<%
  // Obtener los parámetros enviados desde el formulario
  String usuario = request.getParameter("usuario");
  String descripcion = request.getParameter("descripcion");

  try {
    // Establecer conexión a la base de datos SQLite
    Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

    // Insertar la solicitud en la tabla Requests
    String sql = "INSERT INTO Requests (User, Description, Date) VALUES (?, ?, ?)";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setString(1, usuario);
    statement.setString(2, descripcion);
    statement.setString(3, new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));

    int rowsInserted = statement.executeUpdate();

    // Cerrar la conexión y liberar los recursos
    statement.close();
    connection.close();

    if (rowsInserted > 0) {
      out.println("<h3>Solicitud creada correctamente.</h3>");
    } else {
      out.println("<h3>Error al crear la solicitud.</h3>");
    }
  } catch (SQLException e) {
    out.println("<h3>Error al conectar a la base de datos: " + e.getMessage() + "</h3>");
  }
%>
