package com.abc.dao;

import com.abc.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    // Retrieve all customers
    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        String query = "SELECT * FROM customers";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String phoneNumber = resultSet.getString("phoneNumber");  // Adjusted to match DB column
                String password = resultSet.getString("password");
                String restaurantOutlet = resultSet.getString("restaurantOutlet");  // Adjusted to match DB column

                Customer customer = new Customer(id, name, email, address, phoneNumber, password, restaurantOutlet);
                customerList.add(customer);
            }
        }
        return customerList;
    }

    // Retrieve a customer by ID
    public Customer getCustomerById(int id) throws SQLException {
        Customer customer = null;
        String query = "SELECT * FROM customers WHERE id = ?";
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
                    String restaurantOutlet = resultSet.getString("restaurantOutlet");

                    customer = new Customer(id, name, email, address, phoneNumber, password, restaurantOutlet);
                }
            }
        }
        return customer;
    }

    // Add a new customer
    public void addCustomer(Customer customer) throws SQLException {
        String query = "INSERT INTO customers (name, email, address, phoneNumber, password, restaurantOutlet) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getAddress());
            statement.setString(4, customer.getPhoneNumber());
            statement.setString(5, customer.getPassword());
            statement.setString(6, customer.getRestaurantOutlet());
            statement.executeUpdate();
        }
    }

    // Update an existing customer
    public void updateCustomer(Customer customer) throws SQLException {
        String query = "UPDATE customers SET name = ?, email = ?, address = ?, phoneNumber = ?, password = ?, restaurantOutlet = ? WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getAddress());
            statement.setString(4, customer.getPhoneNumber());
            statement.setString(5, customer.getPassword());
            statement.setString(6, customer.getRestaurantOutlet());
            statement.setInt(7, customer.getCustomerId());
            statement.executeUpdate();
        }
    }

    // Delete a customer by ID
    public void deleteCustomer(int id) throws SQLException {
        String query = "DELETE FROM customers WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Retrieve a customer by email and password
    public Customer getCustomerByEmailAndPassword(String email, String password) throws SQLException {
        Customer customer = null;
        String query = "SELECT * FROM customers WHERE email = ? AND password = ?";
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
                    String restaurantOutlet = resultSet.getString("restaurantOutlet");

                    customer = new Customer(id, name, email, address, phoneNumber, password, restaurantOutlet);
                }
            }
        }
        return customer;
    }
}
