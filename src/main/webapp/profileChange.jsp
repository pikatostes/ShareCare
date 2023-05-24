<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    // Obtener los valores enviados desde el formulario
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String roleString = request.getParameter("role");

    // Obtener el nombre de usuario de la sesión
    String currentUserName = (String) session.getAttribute("userName");

    try {
        // Establecer conexión a la base de datos SQLite
        Connection connection = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db");

        // Verificar si el usuario actual existe en la base de datos
        String checkUserSql = "SELECT * FROM User WHERE userName = ?";
        PreparedStatement checkUserStatement = connection.prepareStatement(checkUserSql);
        checkUserStatement.setString(1, currentUserName);
        ResultSet checkUserResult = checkUserStatement.executeQuery();

        if (checkUserResult.next()) {
            // Construir la consulta SQL de actualización
            StringBuilder updateSqlBuilder = new StringBuilder("UPDATE User SET");
            List<Object> updateParams = new ArrayList<>();

            // Verificar y agregar los campos no nulos a la consulta SQL
            if (email != null) {
                updateSqlBuilder.append(" email = ?,");
                updateParams.add(email);
            }
            if (password != null) {
                updateSqlBuilder.append(" password = ?,");
                updateParams.add(password);
            }
            if (roleString != null) {
                updateSqlBuilder.append(" contributor = ?,");
                updateParams.add(Integer.parseInt(roleString));
            }

            // Verificar si se encontraron campos para actualizar
            if (updateParams.size() > 0) {
                // Eliminar la coma final en la consulta SQL
                updateSqlBuilder.deleteCharAt(updateSqlBuilder.length() - 1);

                // Agregar el nombre de usuario y ejecutar la consulta
                updateSqlBuilder.append(" WHERE userName = ?");
                updateParams.add(currentUserName);

                PreparedStatement updateStatement = connection.prepareStatement(updateSqlBuilder.toString());

                // Asignar los valores de los parámetros
                for (int i = 0; i < updateParams.size(); i++) {
                    updateStatement.setObject(i + 1, updateParams.get(i));
                }

                updateStatement.executeUpdate();
                updateStatement.close();

                // Actualizar el nombre de usuario en la sesión si se actualizó el campo correspondiente
                if (password != null) {
                    session.setAttribute("userName", password);
                }

                out.println("Datos de usuario actualizados exitosamente.");
                connection.close();
                String jspToExecute = "logout.jsp";
                RequestDispatcher dispatcher = request.getRequestDispatcher(jspToExecute);

                // Llama al método forward para ejecutar el JSP
                dispatcher.forward(request, response);
            } else {
                out.println("No se encontraron datos para actualizar.");
            }
        } else {
            out.println("No se encontró el usuario en la base de datos.");
        }

        // Cerrar la conexión y liberar los recursos
        checkUserResult.close();
        checkUserStatement.close();
    } catch (SQLException e) {
        out.println("Error al conectar a la base de datos: " + e.getMessage());
    }
%>