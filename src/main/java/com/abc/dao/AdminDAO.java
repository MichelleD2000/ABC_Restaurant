package com.abc.dao;

import com.abc.model.Admin;
import com.abc.dao.DBConnection; // Ensure this import is correct based on your project structure

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // Retrieve all admins
    public List<Admin> getAllAdmins() throws SQLException {
        List<Admin> adminList = new ArrayList<>();
        String query = "SELECT * FROM admin";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");

                Admin admin = new Admin(id, name, email, password);
                adminList.add(admin);
            }
        }
        return adminList;
    }

    // Retrieve an admin by ID
    public Admin getAdminById(int id) throws SQLException {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");

                    admin = new Admin(id, name, email, password);
                }
            }
        }
        return admin;
    }

    // Add a new admin
    public void addAdmin(Admin admin) throws SQLException {
        String query = "INSERT INTO admin (name, email, password) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, admin.getName());
            statement.setString(2, admin.getEmail());
            statement.setString(3, admin.getPassword());
            statement.executeUpdate();
        }
    }

    // Update an existing admin
    public void updateAdmin(Admin admin) throws SQLException {
        String query = "UPDATE admin SET name = ?, email = ?, password = ? WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, admin.getName());
            statement.setString(2, admin.getEmail());
            statement.setString(3, admin.getPassword());
            statement.setInt(4, admin.getAdminId());
            statement.executeUpdate();
        }
    }

    // Delete an admin by ID
    public void deleteAdmin(int id) throws SQLException {
        String query = "DELETE FROM admin WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Retrieve an admin by email and password for login
    public Admin getAdminByEmailAndPassword(String email, String password) throws SQLException {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");

                    admin = new Admin(id, name, email, password);
                }
            }
        }
        return admin;
    }
}
