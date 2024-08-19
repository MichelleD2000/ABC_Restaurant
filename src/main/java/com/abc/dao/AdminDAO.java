package com.abc.dao;

import com.abc.model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    // Method to login an admin
    public Admin loginAdmin(String username, String password) {
        String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                int adminId = resultSet.getInt("admin_id");
                return new Admin(adminId, username, password);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
