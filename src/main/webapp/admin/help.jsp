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
            ResultSet listado = s.executeQuery ("SELECT * FROM help ORDER BY 1");
        %>
        <table class="table table-striped">
            <tr><th>ID Solicitante</th><th>Fecha de creacion</th><th>Skill</th><th>Estado</th><th>ID Contribuidor</th><th>Fecha de inicio</th><th>Fecha de finalización</th></tr>
            <form method="get" action="grabarHelp.jsp">
                <tr><td><input type="text" name="ids" size="5"></td>
                    <td><input type="text" name="dateCreated" size="8"></td>
                    <td><input type="text" name="skill" size="5"></td>
                    <td><input type="text" name="state" size="10"></td>
                    <td><input type="text" name="idc" size="5"></td>
                    <td><input type="text" name="dateStart" size="8"></td>
                    <td><input type="text" name="dateEnd" size="8"></td>
                    <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>
            </form>
            <%
                while (listado.next()) {
                    out.println("<tr><td>");
                    out.println(listado.getString("ids") + "</td>");
                    out.println("<td>" + listado.getString("dateCreated") + "</td>");
                    out.println("<td>" + listado.getString("skill") + "</td>");
                    out.println("<td>" + listado.getString("state") + "</td>");
                    out.println("<td>" + listado.getString("idc") + "</td>");
                    out.println("<td>" + listado.getString("dateStart") + "</td>");
                    out.println("<td>" + listado.getString("dateEnd") + "</td>");
            %>
            <td>
                <form method="get" action="modificarHelp.jsp">
                    <input type="hidden" name="ids" value="<%=listado.getString("ids") %>">
                    <input type="hidden" name="dateCreated" value="<%=listado.getString("dateCreated") %>">
                    <input type="hidden" name="skill" value="<%=listado.getString("skill") %>">
                    <input type="hidden" name="state" value="<%=listado.getString("state") %>">
                    <input type="hidden" name="idc" value="<%=listado.getString("idc") %>">
                    <input type="hidden" name="dateStart" value="<%=listado.getString("dateStart") %>">
                    <input type="hidden" name="dateEnd" value="<%=listado.getString("dateEnd") %>">
                    <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                </form>
            </td>
            <td>
                <form method="get" action="borrarHelp.jsp">
                    <input type="hidden" name="ids" value="<%=listado.getString("ids") %>"/>
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
