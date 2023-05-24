<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page import="com.daw1.ong01.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>ShareCare - Administration</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="../estiloProfile.css">
</head>
<body>
<header>
  <div class="logo">
    <a href="../index.jsp"><img src="../imagen/solidarity.avif" alt=""></a>
    <a href="../index.jsp">
      <h1>ShareCare</h1>
    </a>
  </div>
  <nav>
    <a href="index.jsp" class="nav-link">Home</a>
    <a href="" class="nav-link">Help someone</a>
    <a href="" class="nav-link">Quam?</a>
    <a href="" class="nav-link">Placeat!</a>
    <a href="login.jsp" class="log-in">Log In</a>
    <a href="registro.jsp" class="register">Register</a>
  </nav>
</header>
<%
  // meter parameters
  User alex = new User(
          request.getParameter("userName"),
          request.getParameter("password"),
          request.getParameter("phone"),
          request.getParameter("email"),
          request.getParameter("skill"),
          Integer.parseInt(request.getParameter("contributor"))
  );
  ResultSet numeroDeSocios = null;
  try {
    if (numeroDeSocios.next()) {
      out.println("Lo siento, no se ha podido dar de alta, ya existe un socio con el nombre de usuario '" + request.getParameter("userName") + "'.");
    } else {
      try {
        alex.saveUser();
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
      out.println("Socio dado de alta correctamente.");
    }
  } catch (SQLException e) {
    throw new RuntimeException(e);
  }
%>

<br>
<a href="../index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</a>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>