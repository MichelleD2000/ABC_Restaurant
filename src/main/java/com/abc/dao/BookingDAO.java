package com.abc.dao;

import com.abc.model.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public List<Booking> getAllBookings(int offset, int limit) throws SQLException {
        List<Booking> bookingList = new ArrayList<>();
        String query = "SELECT * FROM bookings LIMIT ?, ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, offset);
            statement.setInt(2, limit);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String eventType = resultSet.getString("eventType");
                    String eventName = resultSet.getString("eventName");
                    String date = resultSet.getString("date");
                    String time = resultSet.getString("time");
                    int guests = resultSet.getInt("guests");
                    String name = resultSet.getString("name");
                    String phone = resultSet.getString("phone");
                    String email = resultSet.getString("email");
                    bookingList.add(new Booking(id, eventType, eventName, date, time, guests, name, phone, email));
                }
            }
        }
        return bookingList;
    }

    public Booking getBookingById(int id) throws SQLException {
        Booking booking = null;
        String query = "SELECT * FROM bookings WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String eventType = resultSet.getString("eventType");
                    String eventName = resultSet.getString("eventName");
                    String date = resultSet.getString("date");
                    String time = resultSet.getString("time");
                    int guests = resultSet.getInt("guests");
                    String name = resultSet.getString("name");
                    String phone = resultSet.getString("phone");
                    String email = resultSet.getString("email");
                    booking = new Booking(id, eventType, eventName, date, time, guests, name, phone, email);
                }
            }
        }
        return booking;
    }

    public void addBooking(Booking booking) throws SQLException {
        String query = "INSERT INTO bookings (eventType, eventName, date, time, guests, name, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, booking.getEventType());
            statement.setString(2, booking.getEventName());
            statement.setString(3, booking.getDate());
            statement.setString(4, booking.getTime());
            statement.setInt(5, booking.getGuests());
            statement.setString(6, booking.getName());
            statement.setString(7, booking.getPhone());
            statement.setString(8, booking.getEmail());
            statement.executeUpdate();
        }
    }

    public void updateBooking(Booking booking) throws SQLException {
        String query = "UPDATE bookings SET eventType = ?, eventName = ?, date = ?, time = ?, guests = ?, name = ?, phone = ?, email = ? WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, booking.getEventType());
            statement.setString(2, booking.getEventName());
            statement.setString(3, booking.getDate());
            statement.setString(4, booking.getTime());
            statement.setInt(5, booking.getGuests());
            statement.setString(6, booking.getName());
            statement.setString(7, booking.getPhone());
            statement.setString(8, booking.getEmail());
            statement.setInt(9, booking.getId());
            statement.executeUpdate();
        }
    }

    public void deleteBooking(int id) throws SQLException {
        String query = "DELETE FROM bookings WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    public int getNoOfRecords() throws SQLException {
        String query = "SELECT COUNT(*) FROM bookings";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        }
        return 0;
    }
}
