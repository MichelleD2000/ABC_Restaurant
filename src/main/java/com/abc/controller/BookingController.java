package com.abc.controller;

import com.abc.model.Booking;
import com.abc.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/booking")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    @Override
    public void init() throws ServletException {
        bookingService = BookingService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("list")) {
                listBookings(request, response);
            } else if (action.equals("add")) {
                showAddForm(request, response);
            } else if (action.equals("edit")) {
                showEditForm(request, response);
            } else if (action.equals("delete")) {
                deleteBooking(request, response);
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
                addBooking(request, response);
            } else if (action.equals("update")) {
                updateBooking(request, response);
            } 
            else {
            	response.sendRedirect("booking?action=list");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listBookings(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Booking> bookingList = bookingService.getAllBookings();
        request.setAttribute("bookings", bookingList);
        request.getRequestDispatcher("WEB-INF/view/listBookings.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addBooking.jsp").forward(request, response);
    }

    private void addBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String eventType = request.getParameter("eventType");
        String eventName = request.getParameter("eventName");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        Booking booking = new Booking(0, eventType, eventName, date, time, guests, name, phone, email);
        bookingService.addBooking(booking);
        response.sendRedirect("booking?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Booking existingBooking = bookingService.getBookingById(id);
        request.setAttribute("booking", existingBooking);
        request.getRequestDispatcher("WEB-INF/view/editBooking.jsp").forward(request, response);
    }

    private void updateBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String eventType = request.getParameter("eventType");
        String eventName = request.getParameter("eventName");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        Booking booking = new Booking(id, eventType, eventName, date, time, guests, name, phone, email);
        bookingService.updateBooking(booking);
        response.sendRedirect("booking?action=list");
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookingService.deleteBooking(id);
        response.sendRedirect("booking?action=list");
    }

    private void handleBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String eventType = request.getParameter("eventType");
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventTime = request.getParameter("eventTime");
        String guests = request.getParameter("guests");
        String customerName = request.getParameter("customerName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_rest", "root", "");

            // SQL query
            String query = "INSERT INTO bookings (eventType, eventName, eventDate, eventTime, guests, customerName, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, eventType);
            ps.setString(2, eventName);
            ps.setString(3, eventDate);
            ps.setString(4, eventTime);
            ps.setString(5, guests);
            ps.setString(6, customerName);
            ps.setString(7, phone);
            ps.setString(8, email);

            // Execute query
           

            // Redirect to success page
            response.sendRedirect("WEB-INF/view/listBooking.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
