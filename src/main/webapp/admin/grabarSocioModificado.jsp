<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

  <title>ShareCare - Administration</title>
</head>
<body>
<%
  Connection conexion = HelloServlet.connect();
  Statement s = conexion.createStatement();
  request.setCharacterEncoding("UTF-8");

  String actualizacion = "UPDATE user SET "
          + "userName='" + request.getParameter("userName")
          + "', password='" + request.getParameter("password")
          + "', name='" + request.getParameter("name")
          + "', phone='" + request.getParameter("phone")
          + "', email='" + request.getParameter("email")
          + "', skill=" + Integer.valueOf(request.getParameter("skill"))
          + ", contributor='" + request.getParameter("contributor")
          + "' WHERE id=" + Integer.valueOf(request.getParameter("id"));
  s.execute(actualizacion);
  out.println("Socio actualizado correctamente.");
  response.sendRedirect("admin.jsp");
  conexion.close();
%>
<br>
<a href="admin.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
