package com.abc.controller;

import com.abc.model.Booking;
import com.abc.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/booking")
public class BookingController extends HttpServlet {
    private BookingService bookingService;

    @Override
    public void init() {
        bookingService = BookingService.getInstance();  // Using Singleton pattern
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            try {
                switch (action) {
                    case "createBooking":
                    case "add":
                        addBooking(request, response);
                        break;
                    case "update":
                        updateBooking(request, response);
                        break;
                    default:
                        response.sendRedirect("WEB-INF/view/listBookings.jsp");
                        break;
                }
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "list":
                    listBookings(request, response);
                    break;
                case "add":
                    showAddForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteBooking(request, response);
                    break;
                default:
                    listBookings(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listBookings(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int page = 1;
        int recordsPerPage = 10;

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1; // Default to the first page if there's an issue with the page parameter
            }
        }

        // Retrieve bookings and pagination information
        List<Booking> bookings = bookingService.getAllBookings((page - 1) * recordsPerPage, recordsPerPage);
        int noOfRecords = bookingService.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("bookings", bookings);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

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
        boolean isBooked = bookingService.addBooking(booking);

        if (isBooked) {
            request.setAttribute("booking", booking);
            request.getRequestDispatcher("booking-success.jsp").forward(request, response);
        } else {
            response.sendRedirect("booking-error.jsp");
        }
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
}
