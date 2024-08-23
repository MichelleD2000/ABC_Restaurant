package com.abc.dao;

import com.abc.model.Reservation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    private static final String INSERT_RESERVATION_SQL = "INSERT INTO reservations (date, time, guests, name, phone, email) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_RESERVATIONS_SQL = "SELECT * FROM reservations LIMIT ?, ?";
    private static final String COUNT_RESERVATIONS_SQL = "SELECT COUNT(*) FROM reservations";
    private static final String SELECT_RESERVATION_BY_ID_SQL = "SELECT * FROM reservations WHERE id = ?";

    /**
     * Save a reservation to the database.
     * @param reservation The reservation to save.
     * @return true if the reservation was successfully saved, otherwise false.
     */
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

    /**
     * Retrieve a list of reservations from the database with pagination.
     * @param offset The offset for pagination.
     * @param limit The maximum number of records to retrieve.
     * @return A list of reservations.
     */
    public List<Reservation> getReservations(int offset, int limit) {
        List<Reservation> reservations = new ArrayList<>();
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESERVATIONS_SQL)) {

            preparedStatement.setInt(1, offset);
            preparedStatement.setInt(2, limit);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Reservation reservation = new Reservation(
                        resultSet.getDate("date"),
                        resultSet.getString("time"),
                        resultSet.getInt("guests"),
                        resultSet.getString("name"),
                        resultSet.getString("phone"),
                        resultSet.getString("email")
                );
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }

    /**
     * Retrieve the total number of reservations in the database.
     * @return The total number of reservations.
     */
    public int getNoOfRecords() {
        int count = 0;
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(COUNT_RESERVATIONS_SQL)) {

            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    /**
     * Retrieve a reservation by its ID.
     * @param id The ID of the reservation to retrieve.
     * @return The reservation with the specified ID, or null if not found.
     */
    public Reservation getReservationById(int id) {
        Reservation reservation = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESERVATION_BY_ID_SQL)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                reservation = new Reservation(
                        resultSet.getDate("date"),
                        resultSet.getString("time"),
                        resultSet.getInt("guests"),
                        resultSet.getString("name"),
                        resultSet.getString("phone"),
                        resultSet.getString("email")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservation;
    }
}
