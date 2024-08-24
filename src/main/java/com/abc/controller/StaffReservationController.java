package com.abc.controller;

import com.abc.model.StaffReservation;
import com.abc.service.StaffReservationService;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/staffReservations")
public class StaffReservationController extends HttpServlet {
    private StaffReservationService staffReservationService;

    @Override
    public void init() {
        staffReservationService = new StaffReservationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteReservation(request, response);
                break;
            case "list":
                listReservations(request, response);
                break;
            default:
                listReservations(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            createReservation(request, response);
        } else if ("update".equals(action)) {
            updateReservation(request, response);
        } else {
            response.sendRedirect("staffReservations?action=list");
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/addStaffReservation.jsp");
        dispatcher.forward(request, response);
    }

    private void createReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StaffReservation reservation = createReservationFromRequest(request);
        if (reservation != null) {
            staffReservationService.addStaffReservation(reservation);
        }
        response.sendRedirect("staffReservations?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            StaffReservation existingReservation = staffReservationService.getStaffReservationById(id);
            request.setAttribute("reservation", existingReservation);
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/updateStaffReservation.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("staffReservations?action=list");
        }
    }

    private void updateReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StaffReservation reservation = createReservationFromRequest(request);
        if (reservation != null) {
            reservation.setId(Integer.parseInt(request.getParameter("id")));
            staffReservationService.updateStaffReservation(reservation);
        }
        response.sendRedirect("staffReservations?action=list");
    }

    private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            staffReservationService.deleteStaffReservation(id);
        } catch (NumberFormatException e) {
            // Handle exception (e.g., log it or notify the user)
        }
        response.sendRedirect("staffReservations?action=list");
    }

    private void listReservations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<StaffReservation> reservations = staffReservationService.getAllStaffReservations();
        request.setAttribute("reservations", reservations);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/listStaffReservation.jsp");
        dispatcher.forward(request, response);
    }

    private StaffReservation createReservationFromRequest(HttpServletRequest request) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int guests = Integer.parseInt(request.getParameter("guests"));
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
        } catch (ParseException e) {
            e.printStackTrace();
            // Optionally log the error or set an error message
            return null;
        }
        String time = request.getParameter("time");

        return new StaffReservation(0, date, time, guests, name, phone, email);
    }
}
