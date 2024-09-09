package com.abc.service;

import com.abc.dao.ReservationDAO;
import com.abc.model.Reservation;

import java.util.List;

public class ReservationService {
    private static ReservationService instance;
    private ReservationDAO reservationDAO;

    private ReservationService() {
        reservationDAO = new ReservationDAO();
    }

    public static ReservationService getInstance() {
        if (instance == null) {
            instance = new ReservationService();
        }
        return instance;
    }

    public boolean addReservation(Reservation reservation) {
        return reservationDAO.saveReservation(reservation);
    }

    public List<Reservation> getReservations(int offset, int limit) {
        return reservationDAO.getReservations(offset, limit);
    }

    public int getNoOfRecords() {
        return reservationDAO.getNoOfRecords();
    }

    public boolean updateReservationStatus(int id, String status) {
        return reservationDAO.updateReservationStatus(id, status);
    }

    public boolean deleteReservation(int id) {
        return reservationDAO.deleteReservation(id);
    }
    
    public Reservation getReservationById(int id) {
        // Retrieve a specific reservation by ID
        return reservationDAO.getReservationById(id);
    }
    
    public List<Reservation> getReservationsByStatus(String status) {
        return reservationDAO.getReservationsByStatus(status);
    }
}
