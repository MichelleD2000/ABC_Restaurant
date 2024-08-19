package com.abc.controller;

import com.abc.model.Admin;
import com.abc.service.AdminService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        adminService = new AdminService();  // Initialize AdminService
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equalsIgnoreCase(action)) {
            adminLogin(request, response);
        } else if ("logout".equalsIgnoreCase(action)) {
            adminLogout(request, response);
        }
    }

    // Method to handle admin login
    private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = adminService.loginAdmin(username, password);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedAdmin", admin);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
            dispatcher.forward(request, response);
        }
    }

    // Method to handle admin logout
    private void adminLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();  // Invalidate the session
        }
        response.sendRedirect("adminLogin.jsp");
    }
}
