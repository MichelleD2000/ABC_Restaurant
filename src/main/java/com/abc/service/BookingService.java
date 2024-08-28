package com.abc.service;

import com.abc.dao.BookingDAO;
import com.abc.model.Booking;

import java.sql.SQLException;
import java.util.List;

public class BookingService {
    private static BookingService instance;
    private BookingDAO bookingDAO;

    private BookingService() {
        bookingDAO = new BookingDAO();
    }

    public static synchronized BookingService getInstance() {
        if (instance == null) {
            instance = new BookingService();
        }
        return instance;
    }

    public List<Booking> getAllBookings(int offset, int limit) throws SQLException {
        return bookingDAO.getAllBookings(offset, limit);
    }

    public Booking getBookingById(int id) throws SQLException {
        return bookingDAO.getBookingById(id);
    }

    public boolean addBooking(Booking booking) throws SQLException {
        bookingDAO.addBooking(booking);
        return true;
    }

    public void updateBooking(Booking booking) throws SQLException {
        bookingDAO.updateBooking(booking);
    }

    public void deleteBooking(int id) throws SQLException {
        bookingDAO.deleteBooking(id);
    }

    public int getNoOfRecords() throws SQLException {
        return bookingDAO.getNoOfRecords();
    }
}
