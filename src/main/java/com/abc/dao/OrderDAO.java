package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Order;

public class OrderDAO {

    // Method to get all orders
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders";
        
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                Order order = new Order();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setCustomerName(resultSet.getString("customer_name"));
                order.setOrderTime(resultSet.getTimestamp("order_time").toString());
                order.setOrderSummary(resultSet.getString("order_summary"));
                order.setCustomerAddress(resultSet.getString("customer_address"));
                order.setTotalPrice(resultSet.getDouble("total_price"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return orders;
    }

    // Method to delete an order by ID
    public void deleteOrder(int orderId) {
        String query = "DELETE FROM Orders WHERE order_id = ?";
        
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get the total number of orders
    public int getOrderCount() throws SQLException {
        String query = "SELECT COUNT(*) AS count FROM Orders";
        int count = 0;

        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            
            if (resultSet.next()) {
                count = resultSet.getInt("count");
            }
        }

        return count;
    }
}
