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

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {
    private ReservationService reservationService;

    public void init() {
        reservationService = new ReservationService();
    }

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
            request.setAttribute("reservation", reservation); // Set the reservation object as a request attribute
            request.getRequestDispatcher("reservation-success.jsp").forward(request, response); // Forward to the JSP page
        } else {
            response.sendRedirect("reservation-error.jsp");
        }
    }
}
