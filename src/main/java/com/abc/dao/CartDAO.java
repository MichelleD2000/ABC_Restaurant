package com.abc.dao;

import com.abc.model.Cart;
import com.abc.model.CartItem;
import com.abc.dao.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    public Cart getCart(int userId) throws SQLException {
        Cart cart = new Cart();
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM carts WHERE user_id = ?")) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    cart.setCartId(resultSet.getInt("cart_id"));
                    cart.setUserId(resultSet.getInt("user_id"));
                    // Retrieve cart items and add to cart object
                    cart.setItems(getCartItems(cart.getCartId()));
                }
            }
        }
        return cart;
    }

    public void addToCart(int userId, int productId, int quantity) throws SQLException {
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?)")) {
            statement.setInt(1, userId);
            statement.setInt(2, productId);
            statement.setInt(3, quantity);
            statement.executeUpdate();
        }
    }

    public void updateCartItem(int cartId, int productId, int quantity) throws SQLException {
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND product_id = ?")) {
            statement.setInt(1, quantity);
            statement.setInt(2, cartId);
            statement.setInt(3, productId);
            statement.executeUpdate();
        }
    }

    public void removeFromCart(int cartId, int productId) throws SQLException {
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM cart_items WHERE cart_id = ? AND product_id = ?")) {
            statement.setInt(1, cartId);
            statement.setInt(2, productId);
            statement.executeUpdate();
        }
    }

    private List<CartItem> getCartItems(int cartId) throws SQLException {
        List<CartItem> items = new ArrayList<>();
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM cart_items WHERE cart_id = ?")) {
            statement.setInt(1, cartId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    CartItem item = new CartItem();
                    item.setCartItemId(resultSet.getInt("cart_item_id"));
                    item.setCartId(resultSet.getInt("cart_id"));
                    item.setProductId(resultSet.getInt("product_id"));
                    item.setQuantity(resultSet.getInt("quantity"));
                    items.add(item);
                }
            }
        }
        return items;
    }
}
