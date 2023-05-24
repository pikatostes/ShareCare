<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../estilo.css">

    <title>ShareCare - Requests</title>
</head>
<body>
<div class="container">
    <header>
        <div class="logo">
            <a href="../index.jsp"><img src="../imagen/solidarity.avif" alt=""></a>
            <a href="../index.jsp">
                <h1>ShareCare</h1>
            </a>
        </div>
        <nav>
            <a href="../index.jsp" class="nav-link">Home</a>
            <a href="../request.jsp" class="nav-link">Help someone</a>
            <% if (session.getAttribute("userName") == null) { %>
            <a href="../login.jsp" class="log-in">Log In</a>
            <a href="../registro.jsp" class="register">Register</a>
            <% } else { %>
            <a class="log-in" style="background-color: blue" href="../profile.jsp">Hola, <%= session.getAttribute("userName") %>!</a>
            <a href="../logout.jsp" class="log-in" style="background-color: red">Cerrar Sesión</a> <!-- Botón de cierre de sesión -->
            <% } %>
        </nav>
    </header>
    <br><br>
    <div class="panel panel-primary">
        <!-- cambio de titulo provisional y test -->
        <div class="panel-heading text-center"><h2>ShareCare - Requests</h2></div>
        <%
            Connection conexion = HelloServlet.connect();
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery ("SELECT * FROM requests ORDER BY 1");
        %>
        <table class="table table-striped">
            <tr><th>ID</th><th>Skill</th><th>Usuario</th><th>Descripción</th><th>Fecha</th><th>Aceptado?</th><th>Contribuidor</th></tr>
            <form method="get" action="grabarRequests.jsp">
                <tr><td><input type="text" name="ID" size="4"></td>
                    <td><input type="text" name="skill" size="4"></td>
                    <td><input type="text" name="User" size="12"></td>
                    <td><input type="text" name="Description" size="18"></td>
                    <td><input type="text" name="Date" size="8"></td>
                    <td><input type="text" name="accepted" size="4"></td>
                    <td><input type="text" name="contributor" size="8"></td>
                    <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>
            </form>
            <%
                while (listado.next()) {
                    out.println("<tr><td>");
                    out.println(listado.getString("ID") + "</td>");
                    out.println("<td>" + listado.getString("skill") + "</td>");
                    out.println("<td>" + listado.getString("User") + "</td>");
                    out.println("<td>" + listado.getString("Description") + "</td>");
                    out.println("<td>" + listado.getString("Date") + "</td>");
                    out.println("<td>" + listado.getString("accepted") + "</td>");
                    out.println("<td>" + listado.getString("contributor") + "</td>");
            %>
            <td>
                <form method="get" action="modificarRequests.jsp">
                    <input type="hidden" name="ID" value="<%=listado.getString("ID") %>">
                    <input type="hidden" name="skill" value="<%=listado.getString("skill") %>">
                    <input type="hidden" name="User" value="<%=listado.getString("User") %>">
                    <input type="hidden" name="Description" value="<%=listado.getString("Description") %>">
                    <input type="hidden" name="Date" value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
                    <input type="hidden" name="accepted" value="<%=listado.getString("accepted") %>">
                    <input type="hidden" name="contributor" value="<%=listado.getString("contributor") %>">
                    <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                </form>
            </td>
            <td>
                <form method="get" action="borrarRequests.jsp">
                    <input type="hidden" name="ID" value="<%=listado.getString("ID") %>"/>
                    <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                </form>
            </td></tr>
            <%
                } // while
                conexion.close();
            %>
        </table>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>