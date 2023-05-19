<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    // Establecer la conexión a la base de datos SQLite
    String dbFilePath = "project.db"; // Reemplaza con la ruta de tu archivo de base de datos SQLite

    // Variables para almacenar el usuario y la contraseña enviados desde el formulario
    String usernameInput = request.getParameter("username");
    String passwordInput = request.getParameter("password");

    // Mensaje de error en caso de credenciales inválidas
    String errorMessage = "";

    try {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        // Cargar el driver de SQLite
        Class.forName("org.sqlite.JDBC");

        // Establecer la conexión a la base de datos SQLite
        con = DriverManager.getConnection("jdbc:sqlite:" + dbFilePath);

        // Consulta para verificar las credenciales del usuario en la tabla "User"
        String query = "SELECT * FROM User WHERE username = ? AND password = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, usernameInput);
        pstmt.setString(2, passwordInput);
        rs = pstmt.executeQuery();

        // Verificar si se encontró un usuario con las credenciales proporcionadas
        if (rs.next()) {
            // Credenciales válidas, mostrar mensaje de éxito
            // out.println("<h2>Login successful!</h2>");
            // out.println("<p>Welcome, " + rs.getString("username") + "!</p>");
            response.sendRedirect("index.jsp");
        } else {
            // Credenciales inválidas, mostrar mensaje de error
            errorMessage = "Invalid username or password. Please try again.";
        }

        // Cerrar la conexión y liberar recursos
        rs.close();
        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
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
<div id="container">
    <div class="logo">
        <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
        <a href="index.jsp">
            <h1>ShareCare</h1>
        </a>
    </div>
    <form>
        <h1 style="text-align: center;">Log In</h1>
        <label for="username"></label>
        <input type="text" id="username" name="username" required placeholder="User">
        <label for="password"></label>
        <input type="password" id="password" name="password" required placeholder="Password">
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
