package com.abc.service;

import com.abc.dao.ProductDAO;
import com.abc.model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private ProductDAO productDAO;
    private static ProductService instance;

    private ProductService() {
        productDAO = new ProductDAO();
    }

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

    public List<Product> getAllProducts() throws SQLException {
        return productDAO.getAllProducts();
    }

    public Product getProductById(int id) throws SQLException {
        return productDAO.getProductById(id);
    }

    public void addProduct(Product product) throws SQLException {
        productDAO.addProduct(product);
    }

    public void updateProduct(Product product) throws SQLException {
        productDAO.updateProduct(product);
    }

    public void deleteProduct(int id) throws SQLException {
        productDAO.deleteProduct(id);
    }
}
