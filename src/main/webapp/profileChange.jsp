<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String user = request.getParameter("user");
    String password = request.getParameter("password");
    int role = Integer.parseInt(request.getParameter("role"));

    try {
        // Establecer conexión con la base de datos
        Connection conn = DriverManager.getConnection("jdbc:mysql:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db", "username", "password");
        Statement stmt = conn.createStatement();

        // Actualizar los datos en la tabla User
        String sql = "UPDATE User SET email = '" + email + "', userName = '" + user + "', password = '" + password + "', contributor = " + role + " WHERE id = 1";
        stmt.executeUpdate(sql);

        // Cerrar la conexión con la base de datos
        stmt.close();
        conn.close();

        response.sendRedirect("index.jsp"); // Redireccionar a la página principal después de la actualización
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp"); // Redireccionar a una página de error en caso de error en la base de datos
    }
%>