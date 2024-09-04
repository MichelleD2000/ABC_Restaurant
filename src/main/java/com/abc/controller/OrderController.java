package com.abc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.model.Order;
import com.abc.service.OrderService;

@WebServlet("/order")
public class OrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = OrderService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listOrders(request, response);
        } else if (action.equals("delete")) {
            deleteOrder(request, response);
        }
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = orderService.getAllOrders();
        request.setAttribute("orders", orderList);
        request.getRequestDispatcher("WEB-INF/view/listOrder.jsp").forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));
        orderService.deleteOrder(orderId);
        response.sendRedirect("order?action=list");
    }
}
