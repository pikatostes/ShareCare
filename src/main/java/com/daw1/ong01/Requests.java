package com.daw1.ong01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Requests {
    private static final String DB_URL = "jdbc:sqlite:C:\\Users\\Alejandro\\IdeaProjects\\ShareCare\\project.db";

    public static boolean acceptRequest(int requestID, String acceptedBy) {
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE Requests SET accepted = 1, contributor = ? WHERE ID = ?")) {

            stmt.setString(1, acceptedBy);
            stmt.setInt(2, requestID);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean createRequest(String category, String user, String description) {
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO Requests (skill, User, Description, Date) VALUES (?, ?, ?, ?)")) {

            stmt.setString(1, category);
            stmt.setString(2, user);
            stmt.setString(3, description);
            stmt.setString(4, new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Request> getAllRequests() {
        List<Request> requests = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Requests");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("ID");
                int skill = rs.getInt("skill");
                String user = rs.getString("User");
                String description = rs.getString("Description");
                String date = rs.getString("Date");
                boolean accepted = rs.getBoolean("accepted");
                String contributor = rs.getString("contributor");

                Request request = new Request(id, skill, user, description, date, accepted, contributor);
                requests.add(request);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return requests;
    }

    public static String getCategoryName(int categoryId) {
        String categoryName = "";
        switch (categoryId) {
            case 1:
                categoryName = "Carpintería";
                break;
            case 2:
                categoryName = "Electricidad";
                break;
            case 3:
                categoryName = "Fontanería";
                break;
            case 4:
                categoryName = "Jardinería";
                break;
        }
        return categoryName;
    }
}