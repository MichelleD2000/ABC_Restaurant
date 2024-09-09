package com.abc.controller;

import com.abc.model.Staff;
import com.abc.service.StaffService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/staff")
public class StaffController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffService staffService;

    @Override
    public void init() throws ServletException {
        staffService = StaffService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("list")) {
                listStaffs(request, response);
            } else if (action.equals("add")) {
                showAddForm(request, response);
            } else if (action.equals("edit")) {
                showEditForm(request, response);
            } else if (action.equals("delete")) {
                deleteStaff(request, response);
            } else if (action.equals("logout")) {
                logoutStaff(request, response);
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
                addStaff(request, response);
            } else if (action.equals("update")) {
                updateStaff(request, response);
            } else if (action.equals("register")) {
                registerStaff(request, response);
            } else if (action.equals("login")) {
                loginStaff(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listStaffs(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Staff> staffList = staffService.getAllStaff();
        request.setAttribute("staffs", staffList);
        request.getRequestDispatcher("WEB-INF/view/listStaff.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addStaff.jsp").forward(request, response);
    }

    private void addStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        Staff staff = new Staff();
        staff.setName(name);
        staff.setEmail(email);
        staff.setAddress(address);
        staff.setPhoneNumber(phoneNumber);
        staff.setPassword(password);

        staffService.addStaff(staff);
        response.sendRedirect("staff?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Staff existingStaff = staffService.getStaffById(id);
        request.setAttribute("staff", existingStaff);
        request.getRequestDispatcher("WEB-INF/view/editStaff.jsp").forward(request, response);
    }

    private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        Staff staff = new Staff(id, name, email, address, phoneNumber, password);
        staffService.updateStaff(staff);
        response.sendRedirect("staff?action=list");
    }

    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        staffService.deleteStaff(id);
        response.sendRedirect("staff?action=list");
    }

    private void registerStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        Staff staff = new Staff();
        staff.setName(name);
        staff.setEmail(email);
        staff.setAddress(address);
        staff.setPhoneNumber(phoneNumber);
        staff.setPassword(password);

        staffService.addStaff(staff);
        response.sendRedirect("Staff/Staff_login.jsp");
    }

    private void loginStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Staff staff = staffService.loginStaff(email, password);
        if (staff != null) {
            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);
            response.sendRedirect("staff?action=list");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("Staff/Staff_dashboard.jsp").forward(request, response);
        }
    }

    private void logoutStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("Staff/Staff_login.jsp");
    }
}
