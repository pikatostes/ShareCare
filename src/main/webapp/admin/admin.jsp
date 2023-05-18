<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
<div class="container">
    <br><br>
    <div class="panel panel-primary">
        <!-- cambio de titulo provisional y test -->
        <div class="panel-heading text-center"><h2>ShareCare - Administration</h2></div>
            <%
              Connection conexion = HelloServlet.connect();
              Statement s = conexion.createStatement();
              ResultSet listado = s.executeQuery ("SELECT * FROM user ORDER BY 1");
            %>
        <table class="table table-striped">
            <tr><th>ID</th><th>Username</th><th>Contraseña</th><th>Nombre</th><th>Telefono</th><th>Correo</th><th>Skill</th></tr>
            <form method="get" action="grabarSocio.jsp">
                <tr><td><input type="text" name="id" size="4"></td>
                    <td><input type="text" name="userName" size="8"></td>
                    <td><input type="text" name="password" size="8"></td>
                    <td><input type="text" name="name" size="12"></td>
                    <td><input type="text" name="phone" size="9"></td>
                    <td><input type="text" name="email" size="18"></td>
                    <td><input type="text" name="skill" size="4"></td>
                    <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>
            </form>
            <%
                while (listado.next()) {
                    out.println("<tr><td>");
                    out.println(listado.getString("id") + "</td>");
                    out.println("<td>" + listado.getString("userName") + "</td>");
                    out.println("<td>" + listado.getString("password") + "</td>");
                    out.println("<td>" + listado.getString("name") + "</td>");
                    out.println("<td>" + listado.getString("phone") + "</td>");
                    out.println("<td>" + listado.getString("email") + "</td>");
                    out.println("<td>" + listado.getString("skill") + "</td>");
            %>
            <td>
                <form method="get" action="modificarSocio.jsp">
                    <input type="hidden" name="id" value="<%=listado.getString("id") %>">
                    <input type="hidden" name="userName" value="<%=listado.getString("userName") %>">
                    <input type="hidden" name="password" value="<%=listado.getString("password") %>">
                    <input type="hidden" name="name" value="<%=listado.getString("name") %>">
                    <input type="hidden" name="phone" value="<%=listado.getString("phone") %>">
                    <input type="hidden" name="email" value="<%=listado.getString("email") %>">
                    <input type="hidden" name="skill" value="<%=listado.getString("skill") %>">
                    <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                </form>
            </td>
            <td>
                <form method="get" action="borrarSocio.jsp">
                    <input type="hidden" name="id" value="<%=listado.getString("id") %>"/>
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