package com.daw1.ong01;

        import java.sql.Connection;
        import java.sql.DriverManager;
        import java.sql.PreparedStatement;
        import java.sql.SQLException;

public class UserDB {

    private static final String DB_URL = "jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db";

    public static boolean insertUser(String userName, String password, String name, String phone, String email, int skill) {
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO User (userName, password, name, phone, email, skill) VALUES (?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, userName);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setInt(6, skill);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}