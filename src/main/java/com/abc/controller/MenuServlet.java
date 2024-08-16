package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.model.Product;
import com.abc.service.ProductService;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Product> products = productService.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("WEB-INF/view/Menu.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Unable to retrieve products", e);
        }
    }
}
