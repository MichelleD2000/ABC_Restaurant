package com.abc.dao;

import com.abc.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Retrieve all products
    public List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM products";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int productId = resultSet.getInt("productId");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String category = resultSet.getString("category");
                String imageUrl = resultSet.getString("imageUrl"); // Correct column name

                Product product = new Product(productId, name, description,category, price, imageUrl);
                productList.add(product);
            }
        }
        return productList;
    }

    // Retrieve a product by ID
    public Product getProductById(int id) throws SQLException {
        Product product = null;
        String query = "SELECT * FROM products WHERE productId = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    double price = resultSet.getDouble("price");
                    String description = resultSet.getString("description");
                    String category = resultSet.getString("category");
                    String imageUrl = resultSet.getString("imageUrl"); // Correct column name

                    product = new Product(id, name, description,category, price, imageUrl);
                }
            }
        }
        return product;
    }

    // Add a new product
    public void addProduct(Product product) throws SQLException {
        String query = "INSERT INTO products (name, price, description,category, imageUrl) VALUES (?, ?, ?, ?,?)"; // Correct column name
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setString(4, product.getCategory());
            statement.setString(5, product.getImageUrl()); // Correct column name
            statement.executeUpdate();
        }
    }

    // Update an existing product
    public void updateProduct(Product product) throws SQLException {
        String query = "UPDATE products SET name = ?, price = ?, description = ?, category = ?, imageUrl = ? WHERE productId = ?"; // Correct column name
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setString(4,product.getCategory());
            statement.setString(5, product.getImageUrl()); // Correct column name
            statement.setInt(6, product.getProductId());
            statement.executeUpdate();
        }
    }

    // Delete a product by ID
    public void deleteProduct(int id) throws SQLException {
        String query = "DELETE FROM products WHERE productId = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
}
