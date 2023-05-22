<%@ page import="java.sql.Connection" %>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>ShareCare - Log In</title>
    <link rel="stylesheet" href="estiloLog.css">
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        // Establecer conexión a la base de datos SQLite
        Connection connection = HelloServlet.connect();

        // Verificar las credenciales del usuario
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM user WHERE userName = ? AND password = ?");
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();

        String userNameParam = null;
        if (resultSet.next()) {
            // Credenciales válidas, redirigir al usuario a la página de éxito
            response.sendRedirect("profile.jsp");
        }userNameParam = request.getParameter("userName");
        if (userNameParam != null && userNameParam.equals("admin")) {
            response.sendRedirect("./admin/admin.jsp");
        } else {
            // Credenciales inválidas, mostrar mensaje de error
            out.println("Credenciales inválidas. Por favor, intente nuevamente.");
        }

        // Cerrar la conexión y liberar los recursos
        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        // Manejar cualquier excepción
        out.println("Error: " + e.getMessage());
    }
%>

<div id="container">
    <div class="logo">
        <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
        <a href="index.jsp">
            <h1>ShareCare</h1>
        </a>
    </div>
    <form action="" method="post">
        <h1 style="text-align: center;">Log In</h1>
        <label for="userName"><input type="text" id="userName" name="userName" required placeholder="User"></label>
        <label for="password"><input type="password" id="password" name="password" required placeholder="Password"></label>
        <div class="links">
            <a href="registro.jsp">Don't have an account?</a>
            <a href="">Forgotten password</a>
        </div>
        <input type="submit" value="Log In">
    </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
