package com.abc.service;

import com.abc.dao.ReservationDAO;
import com.abc.model.Reservation;

import java.util.List;

public class ReservationService {
    private static ReservationService instance;
    private ReservationDAO reservationDAO;

    private ReservationService() {
        this.reservationDAO = new ReservationDAO();
    }

    public static ReservationService getInstance() {
        if (instance == null) {
            synchronized (ReservationService.class) {
                if (instance == null) {
                    instance = new ReservationService();
                }
            }
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
    
    public Reservation getReservationById(int id) {
        return reservationDAO.getReservationById(id);
    }
}
