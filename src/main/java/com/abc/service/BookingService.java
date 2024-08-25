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

    public List<Booking> getAllBookings() throws SQLException {
        return bookingDAO.getAllBookings();
    }

    public Booking getBookingById(int id) throws SQLException {
        return bookingDAO.getBookingById(id);
    }

    public void addBooking(Booking booking) throws SQLException {
        bookingDAO.addBooking(booking);
    }

    public void updateBooking(Booking booking) throws SQLException {
        bookingDAO.updateBooking(booking);
    }

    public void deleteBooking(int id) throws SQLException {
        bookingDAO.deleteBooking(id);
    }
}
