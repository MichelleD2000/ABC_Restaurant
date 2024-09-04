package com.abc.dao;

import com.abc.model.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StaffDAO {
    
   

	public void registerStaff(Staff staff) {
	    String query = "INSERT INTO staff (name, email, address, phoneNumber, password) VALUES (?, ?, ?, ?, ?)";
	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {
	        statement.setString(1, staff.getName());
	        statement.setString(2, staff.getEmail());
	        statement.setString(3, staff.getAddress());
	        statement.setString(4, staff.getPhoneNumber());
	        statement.setString(5, staff.getPassword());

	        statement.executeUpdate();  // Execute the update
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

    public Staff loginStaff(String email, String password) {
        String query = "SELECT * FROM staff WHERE email = ? AND password = ?";
        try (Connection connection = DBConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setString(1, email);
        	statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
              int id = resultSet.getInt("id");
              String name = resultSet.getString("name");
              String phoneNumber = resultSet.getString("phoneNumber");
              String address = resultSet.getString("address");
              
              return new Staff(id, name, email, address, phoneNumber, password);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
