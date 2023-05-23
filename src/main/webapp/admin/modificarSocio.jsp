<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../estilo.css">

    <title>ShareCare - Administration</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
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
            <a href="" class="nav-link">Help someone</a>
            <a href="" class="nav-link">Quam?</a>
            <a href="" class="nav-link">Placeat!</a>
            <a href="../login.jsp" class="log-in">Log In</a>
            <a href="../registro.jsp" class="register">Register</a>
        </nav>
    </header>
    <br><br>
    <div class="panel panel-info">
        <div class="panel-heading text-center">Modificación de socio</div>
        <form method="get" action="grabarSocioModificado.jsp">
            <div class="form-group">
                <label>&nbsp;&nbsp;ID:&nbsp;</label><input type="text" size="5" name="id" value="<%= request.getParameter("id") %>" readonly>
            </div>
            <div class="form-group">
                <label>&nbsp;&nbsp;Nombre de Usuario:&nbsp;</label><input type="text" size="15" name="userName" value="<%= request.getParameter("userName") %>">
                <label>&nbsp;&nbsp;Contraseña:&nbsp;</label><input type="text" size="10" name="password" value="<%= request.getParameter("password") %>">
            </div>
            <div class="form-group">
                <label>&nbsp;&nbsp;Nombre:&nbsp;</label><input type="text" size="20" name="name" value="<%= request.getParameter("name") %>">
            </div>
            <div class="form-group">
                <label>&nbsp;&nbsp;Telefono:&nbsp;</label><input type="text" size="15" name="phone" value="<%= request.getParameter("phone") %>">
            </div>
            <div class="form-group">
                <label>&nbsp;&nbsp;Correo:&nbsp;</label><input type="text" size="20" name="email" value="<%= request.getParameter("email") %>">
            </div>
            <div class="form-group">
                <label>&nbsp;&nbsp;Skill:&nbsp;</label><input type="text" size="5" name="skill" value="<%= request.getParameter("skill") %>">
            </div>

            <hr>
            <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button>
            &nbsp;&nbsp;<a href="admin.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
            <br><br>
        </form>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
