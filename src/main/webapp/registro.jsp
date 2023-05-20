<%@ page import="com.daw1.ong01.UserDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>ShareCare - Register</title>
    <link rel="stylesheet" href="estiloReg.css">
</head>
<body>
<%
    // Obtener los parámetros del formulario
    String email = request.getParameter("email");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");

    // Verificar si se han enviado los datos del formulario
    if (email != null && userName != null && password != null) {
        // Insertar el nuevo usuario en la base de datos
        if (UserDB.insertUser(userName, password, name, phone, email, 0)) {
            // Redireccionar al inicio de sesión si la inserción fue exitosa
            response.sendRedirect("login.jsp");
        } else {
            out.println("Error al registrar el usuario.");
        }
    }
%>

<div id="contenedor">
    <div class="logo">
        <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
        <a href="index.jsp">
            <h1>ShareCare</h1>
        </a>
    </div>
    <form method="get" action="admin/grabarSocio.jsp">
        <h1 style="text-align: center;">Register</h1>
        <label for="id"><input type="number" id="id" name="id" required placeholder="Id"></label>
        <label for="email"><input type="email" id="email" name="email" required placeholder="Email"></label>
        <label for="username"><input type="text" id="username" name="userName" required placeholder="User"></label>
        <label for="password"><input type="password" id="password" name="password" required placeholder="Password"></label>
        <label for="name"><input type="text" name="name" id="name" placeholder="Name"></label>
        <label for="phone"><input type="tel" name="phone" id="phone" placeholder="Phone"></label>
        <label for="skill"><input type="number" id="skill" name="skill" required placeholder="Skill"></label>
        <a href="login.jsp" style="text-align: center">Already have an account?</a>
        <input type="submit" value="Register">
    </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
