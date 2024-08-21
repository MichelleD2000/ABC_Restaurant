package com.abc.dao;

import com.abc.model.Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDAO {
    private static final String INSERT_RESERVATION_SQL = "INSERT INTO reservations (date, time, guests, name, phone, email) VALUES (?, ?, ?, ?, ?, ?)";

    public boolean saveReservation(Reservation reservation) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESERVATION_SQL)) {
             
            preparedStatement.setDate(1, new java.sql.Date(reservation.getDate().getTime()));
            preparedStatement.setString(2, reservation.getTime());
            preparedStatement.setInt(3, reservation.getGuests());
            preparedStatement.setString(4, reservation.getName());
            preparedStatement.setString(5, reservation.getPhone());
            preparedStatement.setString(6, reservation.getEmail());

            int result = preparedStatement.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
