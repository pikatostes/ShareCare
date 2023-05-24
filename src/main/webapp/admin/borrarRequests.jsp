<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
  Connection conexion = HelloServlet.connect();
  Statement s = conexion.createStatement();
  s.execute ("DELETE FROM requests WHERE ID=" + request.getParameter("ID"));

  s.close();
%>
<script>document.location = "requests.jsp"</script>
</body>
</html>
