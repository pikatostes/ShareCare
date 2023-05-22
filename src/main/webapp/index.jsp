<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<% Class.forName("org.sqlite.JDBC"); %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>ShareCare - Index</title>
    <link rel="stylesheet" href="styleIndex.css">
</head>
<body>
<div id="container">
    <div class="logo">
        <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
        <a href="index.jsp">
            <h1>ShareCare</h1>
        </a>
        <div id="login">
            <a href="login.jsp" class="log-in">Log In</a>
            <a href="registro.jsp" class="register">Register</a>
        </div>
    </div>
    <div class="nav-link">
        <a href="request.jsp?category=1" id="hammer"><img src="imagen/hammerSaw.png" alt="" height="75px">Carpinteria</a>
        <a href="request.jsp?category=2" id="lightning"><img src="imagen/lightning.png" alt="" height="75px">Electricidad</a>
        <a href="request.jsp?category=3" id="water"><img src="imagen/water.png" alt="" height="75px">Fontaneria</a>
        <a href="request.jsp?category=4" id="garden"><img src="imagen/scissors.png" alt="" height="75px">Jardineria</a>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>