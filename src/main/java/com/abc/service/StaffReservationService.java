package com.abc.service;

import com.abc.dao.StaffReservationDAO;
import com.abc.model.StaffReservation;

import java.util.List;

public class StaffReservationService {
    private StaffReservationDAO staffReservationDAO;

    public StaffReservationService() {
        staffReservationDAO = new StaffReservationDAO();
    }

    public void addStaffReservation(StaffReservation reservation) {
        staffReservationDAO.addStaffReservation(reservation);
    }

    public void updateStaffReservation(StaffReservation reservation) {
        staffReservationDAO.updateStaffReservation(reservation);
    }

    public void deleteStaffReservation(int id) {
        staffReservationDAO.deleteStaffReservation(id);
    }

    public StaffReservation getStaffReservationById(int id) {
        return staffReservationDAO.getStaffReservationById(id);
    }

    public List<StaffReservation> getAllStaffReservations() {
        return staffReservationDAO.getAllStaffReservations();
    }
}
