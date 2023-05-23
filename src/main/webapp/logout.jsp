<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // Invalidar la sesión actual y redirigir a la página de inicio
  session.invalidate();
  response.sendRedirect("index.jsp");
%>
