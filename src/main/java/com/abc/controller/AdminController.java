package com.abc.controller;

import com.abc.model.Admin;
import com.abc.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        adminService = AdminService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("list")) {
                listAdmins(request, response);
            } else if (action.equals("add")) {
                showAddForm(request, response);
            } else if (action.equals("edit")) {
                showEditForm(request, response);
            } else if (action.equals("delete")) {
                deleteAdmin(request, response);
            } else if (action.equals("logout")) {
                logoutAdmin(request, response);
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
                addAdmin(request, response);
            } else if (action.equals("update")) {
                updateAdmin(request, response);
            } else if (action.equals("register")) {
                registerAdmin(request, response);
            } else if (action.equals("login")) {
                loginAdmin(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listAdmins(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Admin> adminList = adminService.getAllAdmins();
        request.setAttribute("admins", adminList);
        request.getRequestDispatcher("WEB-INF/view/listAdmins.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addAdmin.jsp").forward(request, response);
    }

    private void addAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = new Admin();
        admin.setName(name);
        admin.setEmail(email);
        admin.setPassword(password);

        adminService.addAdmin(admin);
        response.sendRedirect("admin?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Admin existingAdmin = adminService.getAdminById(id);
        request.setAttribute("admin", existingAdmin);
        request.getRequestDispatcher("WEB-INF/view/editAdmin.jsp").forward(request, response);
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = new Admin(id, name, email, password);
        adminService.updateAdmin(admin);
        response.sendRedirect("admin?action=list");
    }

    private void deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminService.deleteAdmin(id);
        response.sendRedirect("admin?action=list");
    }

    private void registerAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = new Admin();
        admin.setName(name);
        admin.setEmail(email);
        admin.setPassword(password);

        adminService.addAdmin(admin);
        response.sendRedirect("Admin_Area/adminLogin.jsp");
    }

    private void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = adminService.getAdminByEmailAndPassword(email, password);
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("admin?action=list");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("Admin_Area/dashboard.jsp").forward(request, response);
        }
    }

    private void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("Admin_Area/adminLogin.jsp");
    }
}
