package com.abc.controller;

import com.abc.model.Staff;
import com.abc.service.StaffService;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/staff")
public class StaffController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffService staffService;

    @Override
    public void init() throws ServletException {
        super.init();
        staffService = StaffService.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "login";
        }

        switch (action) {
            case "register":
                registerStaff(request, response);
                break;
            case "login":
                loginStaff(request, response);
                break;
            case "showRegisterForm":
                showRegisterForm(request, response);
                break;
            default:
                loginStaff(request, response);
                break;
        }
    }

    private void registerStaff(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        Staff newStaff = new Staff();
        newStaff.setName(name);
        newStaff.setEmail(email);
        newStaff.setAddress(address);
        newStaff.setPhoneNumber(phoneNumber);
        newStaff.setPassword(password);

        staffService.registerStaff(newStaff);
        response.sendRedirect("Staff/Staff_login.jsp");
    }

    private void loginStaff(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Staff staff = staffService.loginStaff(email, password);

        if (staff != null) {
            request.getSession().setAttribute("staff", staff);
            response.sendRedirect("Staff/Staff_Dashboard.jsp");  // Correct redirect
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("Staff/Staff_login.jsp").forward(request, response);
        }
    }


    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Staff/Staff_register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
