package com.abc.service;

import com.abc.dao.ProductDAO;
import com.abc.model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    // Singleton instance of ProductService
    private static ProductService instance;

    // DAO instance for interacting with the database
    private ProductDAO productDAO;

    // Private constructor to prevent instantiation from outside
    private ProductService() {
        productDAO = new ProductDAO();
    }

    // Public method to get the single instance of ProductService
    public static ProductService getInstance() {
        if (instance == null) {
            synchronized (ProductService.class) {
                if (instance == null) {
                    instance = new ProductService();
                }
            }
        }
        return instance;
    }

    // Method to retrieve all products from the database
    public List<Product> getAllProducts() throws SQLException {
        return productDAO.getAllProducts();
    }

    // Method to retrieve a specific product by its ID
    public Product getProductById(int id) throws SQLException {
        return productDAO.getProductById(id);
    }

    // Method to add a new product to the database
    public void addProduct(Product product) throws SQLException {
        productDAO.addProduct(product);
    }

    // Method to update an existing product in the database
    public void updateProduct(Product product) throws SQLException {
        productDAO.updateProduct(product);
    }

    // Method to delete a product by its ID from the database
    public void deleteProduct(int id) throws SQLException {
        productDAO.deleteProduct(id);
    }
}
