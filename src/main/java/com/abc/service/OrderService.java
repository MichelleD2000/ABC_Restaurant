package com.abc.service;

import java.sql.SQLException;
import java.util.List;
import com.abc.dao.OrderDAO;
import com.abc.model.Order;

public class OrderService {
    private static OrderService instance;
    private OrderDAO orderDAO;

    // Private constructor to prevent instantiation
    private OrderService() {
        this.orderDAO = new OrderDAO();
    }

    // Public method to get the single instance of the service
    public static OrderService getInstance() {
        if (instance == null) {
            synchronized (OrderService.class) {
                if (instance == null) {
                    instance = new OrderService();
                }
            }
        }
        return instance;
    }

    // Method to delete an order by ID
    public void deleteOrder(int orderId) {
        orderDAO.deleteOrder(orderId);
    }

    // Method to get all orders
    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }
}
