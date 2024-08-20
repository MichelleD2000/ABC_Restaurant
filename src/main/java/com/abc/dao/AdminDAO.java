package com.abc.dao;

import com.abc.model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    // Method to login an admin
    public Admin loginAdmin(String email, String password) {
        String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";

        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("admin_id");
                String name = resultSet.getString("name");
                return new Admin(id, name, email, password);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
