package com.abc.controller;

import com.abc.model.Cart;
import com.abc.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = CartService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("view")) {
                viewCart(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action.equals("add")) {
                addToCart(request, response);
            } else if (action.equals("update")) {
                updateCartItem(request, response);
            } else if (action.equals("remove")) {
                removeFromCart(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        // Assuming you have user authentication and can get userId
        int userId = 1; // Replace with actual user ID retrieval
        Cart cart = cartService.getCart(userId);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/WEB-INF/view/viewCart.jsp").forward(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int userId = 1; // Replace with actual user ID retrieval
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartService.addToCart(userId, productId, quantity);
        response.sendRedirect(request.getContextPath() + "/cart?action=view");
    }

    private void updateCartItem(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartService.updateCartItem(cartId, productId, quantity);
        response.sendRedirect(request.getContextPath() + "/cart?action=view");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        cartService.removeFromCart(cartId, productId);
        response.sendRedirect(request.getContextPath() + "/cart?action=view");
    }
}
