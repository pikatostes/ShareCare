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
<% request.setCharacterEncoding("UTF-8"); %>
<div class="container">
  <br><br>
  <div class="panel panel-info">
    <div class="panel-heading text-center">Modificación de Ayuda</div>
    <form method="get" action="grabarHelpModificado.jsp">
      <div class="form-group">
        <label>&nbsp;&nbsp;ID Solicitante:&nbsp;</label><input type="text" size="5" name="ids" value="<%= request.getParameter("ids") %>" readonly>
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Fecha de creacion:&nbsp;</label><input type="text" size="15" name="dateCreated" value="<%= request.getParameter("dateCreated") %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Skill:&nbsp;</label><input type="text" size="5" name="skill" value="<%= request.getParameter("skill") %>">
        <label>&nbsp;&nbsp;Estado:&nbsp;</label><input type="text" size="15" name="state" value="<%= request.getParameter("state") %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;ID Contribuidor:&nbsp;</label><input type="text" size="5" name="idc" value="<%= request.getParameter("idc") %>">
      </div>
      <div class="form-group">
        <label>&nbsp;&nbsp;Fecha de inicio:&nbsp;</label><input type="text" size="15" name="dateStart" value="<%= request.getParameter("dateStart") %>">
        <label>&nbsp;&nbsp;Fecha de finalización:&nbsp;</label><input type="text" size="15" name="dateEnd" value="<%= request.getParameter("dateEnd") %>">
      </div>

      <hr>
      <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button>
      &nbsp;&nbsp;<a href="help.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
      <br><br>
    </form>
  </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
