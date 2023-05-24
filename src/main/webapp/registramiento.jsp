<%@ page import="java.sql.Connection" %>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%
  Connection conexion = HelloServlet.connect();
  Statement s = conexion.createStatement();

  request.setCharacterEncoding("UTF-8");

  String userName = request.getParameter("userName");
  String password = request.getParameter("password");
  String name = request.getParameter("name");
  String phone = request.getParameter("phone");
  String email = request.getParameter("email");
  int skill = Integer.parseInt(request.getParameter("skill"));

// Insertar el nuevo registro sin el ID específico
  String insercion = "INSERT INTO user (userName, password, name, phone, email, skill) VALUES ('"
          + userName + "', '" + password + "', '" + name + "', '" + phone + "', '"
          + email + "', " + skill + ")";
  s.execute(insercion);

  ResultSet generatedKeys = s.getGeneratedKeys();
  int nuevoId = 0;

  if (generatedKeys.next()) {
    nuevoId = generatedKeys.getInt(1);
  }

  if (nuevoId != 0) {
    response.sendRedirect("login.jsp");
  } else {
    out.println("Error al dar de alta al socio.");
  }

  conexion.close();
%>
