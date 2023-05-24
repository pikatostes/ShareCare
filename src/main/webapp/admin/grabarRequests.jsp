<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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

  <title>ShareCare - Requests</title>
</head>
<body>
<%
  Connection conexion = HelloServlet.connect();
  Statement s = conexion.createStatement();

  request.setCharacterEncoding("UTF-8");

  // Comprueba la existencia del número de socio introducido
  String consultaNumSocio = "SELECT * FROM requests WHERE ID="
          + Integer.valueOf(request.getParameter("ID"));

  ResultSet numeroDeSocios = s.executeQuery (consultaNumSocio);

  if (numeroDeSocios.getInt("ID") != 0) {
    out.println("Lo siento, no se ha podido dar de alta, ya existe una solicitud con el número "
            + request.getParameter("ID") + ".");
  } else {
    String insercion = "INSERT INTO requests VALUES (" + Integer.valueOf(request.getParameter("ID"))
            + ", " + Integer.valueOf(request.getParameter("skill"))
            + ", '" + request.getParameter("User")
            + "', '" + request.getParameter("Description")
            + "', '" + request.getParameter("Date")
            + "', " + Integer.valueOf(request.getParameter("accepted"))
            + ", '" + request.getParameter("contributor") + "')";
    s.execute(insercion);
    out.println("Solicitud dado de alta correctamente.");
  }
  conexion.close();
%>

<br>
<a href="requests.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</body>
</html>
