<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.daw1.ong01.HelloServlet" %>
<%
    // Obtener los valores enviados desde el formulario
    String email = request.getParameter("email");
    String user = request.getParameter("user");
    String password = request.getParameter("password");
    int role = Integer.parseInt(request.getParameter("role"));

    // Obtener el nombre de usuario de la sesión
    String currentUserName = (String) session.getAttribute("userName");

    try {
        // Establecer conexión a la base de datos SQLite
        Connection connection = HelloServlet.connect();

        // Verificar si el usuario actual existe en la base de datos
        String checkUserSql = "SELECT * FROM User WHERE userName = ?";
        PreparedStatement checkUserStatement = connection.prepareStatement(checkUserSql);
        checkUserStatement.setString(1, currentUserName);
        ResultSet checkUserResult = checkUserStatement.executeQuery();

        if (checkUserResult.next()) {
            // Actualizar los datos del usuario en la base de datos
            String updateSql = "UPDATE User SET email = ?, name = ?, password = ?, contributor = ? WHERE userName = ?";
            PreparedStatement updateStatement = connection.prepareStatement(updateSql);
            updateStatement.setString(1, email);
            updateStatement.setString(2, user);
            updateStatement.setString(3, password);
            updateStatement.setInt(4, role);
            updateStatement.setString(5, currentUserName);
            updateStatement.executeUpdate();

            // Actualizar el nombre de usuario en la sesión
            session.setAttribute("userName", user);

            out.println("Datos de usuario actualizados exitosamente.");
        } else {
            out.println("No se encontró el usuario en la base de datos.");
        }

        // Cerrar la conexión y liberar los recursos
        checkUserResult.close();
        checkUserStatement.close();
        connection.close();
    } catch (SQLException e) {
        out.println("Error al conectar a la base de datos: " + e.getMessage());
    }
%>