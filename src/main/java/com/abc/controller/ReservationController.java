package com.abc.controller;

import com.abc.model.Reservation;
import com.abc.service.ReservationService;
import com.abc.util.EmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationService reservationService;

    @Override
    public void init() {
        reservationService = ReservationService.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "add"; // Default action
        }

        switch (action) {
            case "add":
                addReservation(request, response);
                break;
            case "accept":
                updateReservationStatus(request, response, "Accepted");
                break;
            case "reject":
                updateReservationStatus(request, response, "Rejected");
                break;
            case "delete":
                deleteReservation(request, response);
                break;
            default:
                response.sendRedirect("reservation-error.jsp");
                break;
        }
    }

    private void addReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dateStr = request.getParameter("date");
        String time = request.getParameter("time");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = dateFormat.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Reservation reservation = new Reservation(date, time, guests, name, phone, email);
        boolean isReserved = reservationService.addReservation(reservation);

        if (isReserved) {
            request.setAttribute("reservation", reservation);
            request.getRequestDispatcher("reservation-success.jsp").forward(request, response);
        } else {
            response.sendRedirect("reservation-error.jsp");
        }
    }

    private void updateReservationStatus(HttpServletRequest request, HttpServletResponse response, String status) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Updating reservation with ID: " + id + " to status: " + status);  // Log for debugging
        boolean isUpdated = reservationService.updateReservationStatus(id, status);

        // Get reservation details to include in the email
        Reservation reservation = reservationService.getReservationById(id);
        String reservationDetails = "Date: " + reservation.getDate() + "<br>"
                                    + "Time: " + reservation.getTime() + "<br>"
                                    + "Guests: " + reservation.getGuests();

        if (isUpdated) {
            if ("Accepted".equals(status)) {
                // Send acceptance email
                EmailUtil.sendReservationAcceptedEmail(reservation.getEmail(), reservation.getName(), reservationDetails);
            } else if ("Rejected".equals(status)) {
                // Send rejection email
                EmailUtil.sendReservationRejectedEmail(reservation.getEmail(), reservation.getName(), reservationDetails);
            }

            System.out.println("Update and email sending successful.");
            response.sendRedirect("reservation?action=list");
        } else {
            System.out.println("Update failed.");
            response.sendRedirect("reservation-error.jsp");
        }
    }


    private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Deleting reservation with ID: " + id);
        boolean isDeleted = reservationService.deleteReservation(id);
        if (isDeleted) {
            System.out.println("Delete successful.");
            response.sendRedirect("reservation?action=list");
        } else {
            System.out.println("Delete failed.");
            response.sendRedirect("reservation-error.jsp");
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
                    listReservations(request, response);
                    break;
                default:
                    listReservations(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listReservations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 10;

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1; // Default to the first page if there's an issue with the page parameter
            }
        }

        List<Reservation> reservations = reservationService.getReservations((page - 1) * recordsPerPage, recordsPerPage);
        int noOfRecords = reservationService.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("reservations", reservations);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("WEB-INF/view/listReservation.jsp").forward(request, response);
    }
}
