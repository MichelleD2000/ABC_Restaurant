package com.abc.controller;

import com.abc.model.Reservation;
import com.abc.service.ReservationService;

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
    private ReservationService reservationService;

    @Override
    public void init() {
        reservationService = ReservationService.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            
            // Forward to reservation-success.jsp to show the reservation details
            request.getRequestDispatcher("reservation-success.jsp").forward(request, response);

            // Additionally redirect to listReservation.jsp and listStaffReservation.jsp after a short delay (this is optional and more complex, depending on the behavior you want)
            response.sendRedirect("WEB-INF/view/listReservation.jsp");
            response.sendRedirect("WEB-INF/view/listStaffReservation.jsp");
        } else {
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

        // Retrieve reservations and pagination information
        List<Reservation> reservations = reservationService.getReservations((page - 1) * recordsPerPage, recordsPerPage);
        int noOfRecords = reservationService.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("reservations", reservations);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("WEB-INF/view/listReservation.jsp").forward(request, response);
    }
}
