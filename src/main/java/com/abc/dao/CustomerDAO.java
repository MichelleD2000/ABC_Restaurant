package com.abc.dao;

import com.abc.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    // Method to retrieve all customers from the database
    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        String query = "SELECT * FROM customers";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customerId");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String phoneNumber = resultSet.getString("phoneNumber");
                String password = resultSet.getString("password"); // Fetch password

                Customer customer = new Customer(customerId, name, email, address, phoneNumber, password);
                customerList.add(customer);
            }
        }
        return customerList;
    }

    // Method to retrieve a customer by their ID
    public Customer getCustomerById(int id) throws SQLException {
        Customer customer = null;
        String query = "SELECT * FROM customers WHERE customerId = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");
                    String phoneNumber = resultSet.getString("phoneNumber");
                    String password = resultSet.getString("password"); // Fetch password

                    customer = new Customer(id, name, email, address, phoneNumber, password);
                }
            }
        }
        return customer;
    }

    // Method to add a new customer to the database
    public void addCustomer(Customer customer) throws SQLException {
        String query = "INSERT INTO customers (name, email, address, phoneNumber, password) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getAddress());
            statement.setString(4, customer.getPhoneNumber());
            statement.setString(5, customer.getPassword()); // Insert password
            statement.executeUpdate();
        }
    }

    // Method to update an existing customer in the database
    public void updateCustomer(Customer customer) throws SQLException {
        String query = "UPDATE customers SET name = ?, email = ?, address = ?, phoneNumber = ?, password = ? WHERE customerId = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getAddress());
            statement.setString(4, customer.getPhoneNumber());
            statement.setString(5, customer.getPassword()); // Update password
            statement.setInt(6, customer.getCustomerId());
            statement.executeUpdate();
        }
    }

    // Method to delete a customer by their ID
    public void deleteCustomer(int id) throws SQLException {
        String query = "DELETE FROM customers WHERE customerId = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Method to retrieve a customer by their email and password (for login)
    public Customer getCustomerByEmailAndPassword(String email, String password) throws SQLException {
        Customer customer = null;
        String query = "SELECT * FROM customers WHERE email = ? AND password = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int customerId = resultSet.getInt("customerId");
                    String name = resultSet.getString("name");
                    String address = resultSet.getString("address");
                    String phoneNumber = resultSet.getString("phoneNumber");

                    customer = new Customer(customerId, name, email, address, phoneNumber, password);
                }
            }
        }
        return customer;
    }
}
