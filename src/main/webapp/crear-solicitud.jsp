<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<% Class.forName("org.sqlite.JDBC"); %>

<%
  // Obtener los parámetros enviados desde el formulario
  String categoria = request.getParameter("categoria");
  String usuario = request.getParameter("usuario");
  String descripcion = request.getParameter("descripcion");

  try {
    // Establecer conexión a la base de datos SQLite
    Connection connection = HelloServlet.connect();

    // Insertar la solicitud en la tabla Requests
    String sql = "INSERT INTO Requests (skill, User, Description, Date) VALUES (?, ?, ?, ?)";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setString(1, categoria);
    statement.setString(2, usuario);
    statement.setString(3, descripcion);
    statement.setString(4, new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));

    int rowsInserted = statement.executeUpdate();

    // Cerrar la conexión y liberar los recursos
    statement.close();
    connection.close();

    if (rowsInserted > 0) {
      out.println("<h3>Solicitud creada correctamente.</h3>");
      response.sendRedirect("request.jsp");
    } else {
      out.println("<h3>Error al crear la solicitud.</h3>");
    }
  } catch (SQLException e) {
    out.println("<h3>Error al conectar a la base de datos: " + e.getMessage() + "</h3>");
  }
%>