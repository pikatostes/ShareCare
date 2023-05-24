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
<% request.setCharacterEncoding("UTF-8"); %>
<div class="container">
  <br><br>
  <div class="panel panel-info">
    <div class="panel-heading text-center">Modificación de solicitación</div>
    <form method="get" action="grabarRequestsModificado.jsp">
      <div class="form-group">
        <label>&nbsp;&nbsp;ID:&nbsp;</label><input type="text" size="5" name="ID" value="<%= request.getParameter("ID") %>" readonly>
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Skill:&nbsp;</label><input type="text" size="5" name="skill" value="<%= request.getParameter("skill") %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Usuario:&nbsp;</label><input type="text" size="12" name="User" value="<%= request.getParameter("User") %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Descripción:&nbsp;</label><input type="text" size="50" name="Description" value="<%= request.getParameter("Description") %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Fecha:&nbsp;</label><input type="text" size="12" name="Date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Aceptado?:&nbsp;</label><input type="text" size="5" name="accepted" value="<%= request.getParameter("accepted") %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Contribuidor:&nbsp;</label><input type="text" size="10" name="contributor" value="<%= request.getParameter("contributor") %>">
      </div>

      <hr>
      <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button>
      &nbsp;&nbsp;<a href="requests.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
      <br><br>
    </form>
  </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
