<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.daw1.ong01.HelloServlet" %>
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
  Connection conexion = HelloServlet.connect();
  Statement s = conexion.createStatement();

  request.setCharacterEncoding("UTF-8");

  // Comprueba la existencia del número de socio introducido
  String consultaNumSocio = "SELECT * FROM User WHERE userName='" + request.getParameter("userName") + "'";

  ResultSet numeroDeSocios = s.executeQuery(consultaNumSocio);

  if (numeroDeSocios.next()) {
    out.println("Lo siento, no se ha podido dar de alta, ya existe un socio con el nombre de usuario '" + request.getParameter("userName") + "'.");
  } else {
    String insercion = "INSERT INTO User (userName, password, name, phone, email, skill) VALUES ('"
            + request.getParameter("userName")
            + "', '" + request.getParameter("password")
            + "', '" + request.getParameter("name")
            + "', '" + request.getParameter("phone")
            + "', '" + request.getParameter("email")
            + "', " + Integer.parseInt(request.getParameter("skill")) + ")";
    s.execute(insercion);
    out.println("Socio dado de alta correctamente.");
  }
  conexion.close();
%>

<br>
<a href="../index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</a>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
