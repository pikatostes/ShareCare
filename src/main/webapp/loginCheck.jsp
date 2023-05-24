<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String user = request.getParameter("userName");
  String password = request.getParameter("password");

  if (user.equals("admin") && password.equals("admin")) {
    session.setAttribute("userName", user);
    session.setAttribute("password", password);
    response.sendRedirect("./admin/admin.jsp");
  } else {
    try {
      // Establecer conexión a la base de datos SQLite
      Connection connection = HelloServlet.connect();

      // Preparar y ejecutar la consulta para comprobar el usuario y contraseña
      String sql = "SELECT * FROM User WHERE userName = ? AND password = ?";
      PreparedStatement statement = connection.prepareStatement(sql);
      statement.setString(1, user);
      statement.setString(2, password);
      ResultSet resultSet = statement.executeQuery();

      // Si se encuentra una coincidencia en la base de datos, redirigir a la página principal
      if (resultSet.next()) {
        session.setAttribute("userName", user);
        response.sendRedirect("index.jsp");
      } else {
        response.sendRedirect("login.jsp");
      }

      // Cerrar la conexión y liberar los recursos
      resultSet.close();
      statement.close();
      connection.close();
    } catch (SQLException e) {
      out.println("Error al conectar a la base de datos: " + e.getMessage());
    }
  }
%>
