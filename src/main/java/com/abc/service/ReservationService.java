package com.abc.service;


import com.abc.dao.ReservationDAO;
import com.abc.model.Reservation;

public class ReservationService {
    private ReservationDAO reservationDAO;

    public ReservationService() {
        this.reservationDAO = new ReservationDAO();
    }

    public boolean addReservation(Reservation reservation) {
        return reservationDAO.saveReservation(reservation);
    }
}
