package com.abc.dao;

import com.abc.model.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {

    // Retrieve all staff members
    public List<Staff> getAllStaff() throws SQLException {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM staff";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String phoneNumber = resultSet.getString("phoneNumber");
                String password = resultSet.getString("password");

                Staff staff = new Staff(id, name, email, address, phoneNumber, password);
                staffList.add(staff);
            }
        }
        return staffList;
    }

    // Retrieve a staff member by ID
    public Staff getStaffById(int id) throws SQLException {
        Staff staff = null;
        String query = "SELECT * FROM staff WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");
                    String phoneNumber = resultSet.getString("phoneNumber");
                    String password = resultSet.getString("password");

                    staff = new Staff(id, name, email, address, phoneNumber, password);
                }
            }
        }
        return staff;
    }

  

    public void addStaff(Staff staff) throws SQLException {
        String query = "INSERT INTO staff (name, email, address, phoneNumber, password) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, staff.getName());
            statement.setString(2, staff.getEmail());
            statement.setString(3, staff.getAddress());
            statement.setString(4, staff.getPhoneNumber());
            statement.setString(5, staff.getPassword());
            statement.executeUpdate();
        }
    }

    // Update an existing staff member
    public void updateStaff(Staff staff) throws SQLException {
        String query = "UPDATE staff SET name = ?, email = ?, address = ?, phoneNumber = ?, password = ? WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, staff.getName());
            statement.setString(2, staff.getEmail());
            statement.setString(3, staff.getAddress());
            statement.setString(4, staff.getPhoneNumber());
            statement.setString(5, staff.getPassword());
            statement.setInt(6, staff.getId());
            statement.executeUpdate();
        }
    }

    // Delete a staff member by ID
    public void deleteStaff(int id) throws SQLException {
        String query = "DELETE FROM staff WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Retrieve a staff member by email and password for login
    public Staff loginStaff(String email, String password) throws SQLException {
        Staff staff = null;
        String query = "SELECT * FROM staff WHERE email = ? AND password = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String address = resultSet.getString("address");
                    String phoneNumber = resultSet.getString("phoneNumber");

                    staff = new Staff(id, name, email, address, phoneNumber, password);
                }
            }
        }
        return staff;
    }
}
