package com.abc.dao;

import com.abc.model.StaffReservation;
import com.abc.dao.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffReservationDAO {
    private Connection connection;

    public StaffReservationDAO() {
        connection = DBConnection.getInstance().getConnection();
    }

    /**
     * Save a staff reservation to the database.
     * @param reservation The reservation to save.
     * @return true if the reservation was successfully saved, otherwise false.
     */
    public boolean addStaffReservation(StaffReservation reservation) {
        String query = "INSERT INTO reservations(name, email, phone, guests, date, time) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, reservation.getName());
            preparedStatement.setString(2, reservation.getEmail());
            preparedStatement.setString(3, reservation.getPhone());
            preparedStatement.setInt(4, reservation.getGuests());
            preparedStatement.setDate(5, new java.sql.Date(reservation.getDate().getTime()));
            preparedStatement.setString(6, reservation.getTime());

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Update an existing staff reservation in the database.
     * @param reservation The reservation to update.
     */
    public void updateStaffReservation(StaffReservation reservation) {
        String query = "UPDATE reservations SET name=?, email=?, phone=?, guests=?, date=?, time=? WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, reservation.getName());
            preparedStatement.setString(2, reservation.getEmail());
            preparedStatement.setString(3, reservation.getPhone());
            preparedStatement.setInt(4, reservation.getGuests());
            preparedStatement.setDate(5, new java.sql.Date(reservation.getDate().getTime()));
            preparedStatement.setString(6, reservation.getTime());
            preparedStatement.setInt(7, reservation.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Delete a staff reservation from the database.
     * @param id The ID of the reservation to delete.
     */
    public void deleteStaffReservation(int id) {
        String query = "DELETE FROM reservations WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Retrieve a staff reservation by its ID.
     * @param id The ID of the reservation to retrieve.
     * @return The reservation with the specified ID, or null if not found.
     */
    public StaffReservation getStaffReservationById(int id) {
        StaffReservation reservation = null;
        String query = "SELECT * FROM reservations WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                reservation = new StaffReservation(
                        resultSet.getInt("id"),
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

    /**
     * Retrieve a list of staff reservations from the database.
     * @return A list of staff reservations.
     */
    public List<StaffReservation> getAllStaffReservations() {
        List<StaffReservation> reservations = new ArrayList<>();
        String query = "SELECT * FROM reservations";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                StaffReservation reservation = new StaffReservation(
                        resultSet.getInt("id"),
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
     * Retrieve the total number of staff reservations in the database.
     * @return The total number of staff reservations.
     */
    public int getNoOfRecords() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM reservations";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
