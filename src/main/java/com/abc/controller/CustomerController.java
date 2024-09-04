package com.abc.controller;

import com.abc.model.Customer;
import com.abc.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/customer")
public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    @Override
    public void init() throws ServletException {
        customerService = CustomerService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("list")) {
                listCustomers(request, response);
            } else if (action.equals("add")) {
                showAddForm(request, response);
            } else if (action.equals("edit")) {
                showEditForm(request, response);
            } else if (action.equals("delete")) {
                deleteCustomer(request, response);
            } else if (action.equals("logout")) {
                logoutCustomer(request, response);
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
                addCustomer(request, response);
            } else if (action.equals("update")) {
                updateCustomer(request, response);
            } else if (action.equals("register")) {
                registerCustomer(request, response);
            } else if (action.equals("login")) {
                loginCustomer(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Customer> customerList = customerService.getAllCustomers();
        request.setAttribute("customers", customerList);
        request.getRequestDispatcher("WEB-INF/view/listCustomers.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addCustomer.jsp").forward(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String restaurantOutlet = request.getParameter("restaurantOutlet");

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setAddress(address);
        customer.setPhoneNumber(phoneNumber);
        customer.setPassword(password);
        customer.setRestaurantOutlet(restaurantOutlet);

        customerService.addCustomer(customer);
        response.sendRedirect("customer?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("id"));
        Customer existingCustomer = customerService.getCustomerById(customerId);
        request.setAttribute("customer", existingCustomer);
        request.getRequestDispatcher("WEB-INF/view/editCustomer.jsp").forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String restaurantOutlet = request.getParameter("restaurantOutlet");

        Customer customer = new Customer(customerId, name, email, address, phoneNumber, password, restaurantOutlet);
        customerService.updateCustomer(customer);
        response.sendRedirect("customer?action=list");
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int customerId = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(customerId);
        response.sendRedirect("customer?action=list");
    }

    private void registerCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String restaurantOutlet = request.getParameter("restaurantOutlet");

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setAddress(address);
        customer.setPhoneNumber(phoneNumber);
        customer.setPassword(password);
        customer.setRestaurantOutlet(restaurantOutlet);

        customerService.addCustomer(customer);
        request.setAttribute("message", "Registration successful! Please log in.");
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }


    private void loginCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = customerService.getCustomerByEmailAndPassword(email, password);
        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            session.setAttribute("loginSuccessMessage", "Login successful! Welcome back, " + customer.getName() + ".");

            response.sendRedirect("index.jsp");  // Redirect to customer list or another page
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void logoutCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
}
