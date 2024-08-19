package com.abc.controller;

import com.abc.model.User;
import com.abc.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user")
public class UserController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();  // Initialize UserService
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equalsIgnoreCase(action)) {
            registerUser(request, response);
        } else if ("login".equalsIgnoreCase(action)) {
            loginUser(request, response);
        } 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("list".equalsIgnoreCase(action)) {
            listUsers(request, response);
        } else if ("add".equalsIgnoreCase(action)) {
            // Redirect to addUser.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/addUser.jsp");
            dispatcher.forward(request, response);
        }
    }

    // Method to handle user registration
    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(username, password, email);

        userService.registerUser(user);

        request.setAttribute("message", "Registration successful!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    // Method to handle user login
    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.loginUser(email, password);

        if (user != null) {
            request.getSession().setAttribute("loggedUser", user);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }

    // Method to list all users
    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<User> userList = userService.getAllUsers();
            request.setAttribute("userList", userList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/listUser.jsp");
        dispatcher.forward(request, response);
    }
}
