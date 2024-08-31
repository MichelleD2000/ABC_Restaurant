package com.abc.service;

import com.abc.dao.CartDAO;
import com.abc.model.Cart;
import com.abc.model.CartItem;

import java.sql.SQLException;

public class CartService {
    private static CartService instance;
    private CartDAO cartDAO;

    private CartService() {
        cartDAO = new CartDAO();
    }

    public static CartService getInstance() {
        if (instance == null) {
            synchronized (CartService.class) {
                if (instance == null) {
                    instance = new CartService();
                }
            }
        }
        return instance;
    }

    public Cart getCart(int userId) throws SQLException {
        return cartDAO.getCart(userId);
    }

    public void addToCart(int userId, int productId, int quantity) throws SQLException {
        cartDAO.addToCart(userId, productId, quantity);
    }

    public void updateCartItem(int cartId, int productId, int quantity) throws SQLException {
        cartDAO.updateCartItem(cartId, productId, quantity);
    }

    public void removeFromCart(int cartId, int productId) throws SQLException {
        cartDAO.removeFromCart(cartId, productId);
    }
}
