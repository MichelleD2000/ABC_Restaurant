package com.abc.controller;

import com.abc.model.Cart;
import com.abc.model.Customer;
import com.abc.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartService cartService;

    public void init() throws ServletException {
        cartService = CartService.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        try {
            if (action != null) {
                switch (action) {
                    case "add":
                        addProductToCart(request, cart);
                        break;
                    case "update":
                        updateProductInCart(request, cart);
                        break;
                    case "remove":
                        removeProductFromCart(request, cart);
                        break;
                    case "checkout":
                        proceedToCheckout(request, response);
                        return; // Ensure no further processing after checkout
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page if needed
            return;
        }

        if (!response.isCommitted()) {
            response.sendRedirect("Cart.jsp");
        }
    }

    private void addProductToCart(HttpServletRequest request, Cart cart) throws SQLException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = 1; // Default quantity

        // Optional: Retrieve quantity from request if provided
        String qtyParam = request.getParameter("quantity");
        if (qtyParam != null) {
            try {
                quantity = Integer.parseInt(qtyParam);
                if (quantity <= 0) {
                    quantity = 1;
                }
            } catch (NumberFormatException e) {
                quantity = 1;
            }
        }

        cartService.addToCart(cart, productId, quantity);
    }

    private void updateProductInCart(HttpServletRequest request, Cart cart) {
        String[] productIds = request.getParameterValues("productId");
        String[] quantities = request.getParameterValues("quantity");

        if (productIds != null && quantities != null && productIds.length == quantities.length) {
            for (int i = 0; i < productIds.length; i++) {
                try {
                    int productId = Integer.parseInt(productIds[i]);
                    int quantity = Integer.parseInt(quantities[i]);
                    cartService.updateCartItem(cart, productId, quantity);
                } catch (NumberFormatException e) {
                    // Ignore invalid input
                }
            }
        }
    }

    private void removeProductFromCart(HttpServletRequest request, Cart cart) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        cartService.removeCartItem(cart, productId);
    }

    private void proceedToCheckout(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Customer customer = (Customer) session.getAttribute("customer");
        String address = request.getParameter("address");

        if (cart == null || customer == null || address == null || address.isEmpty()) {
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page if inputs are invalid
            return;
        }

        cartService.checkoutCart(cart, customer, address);
        cart.clear();

        response.sendRedirect("orderConfirmation.jsp");
    }
}
