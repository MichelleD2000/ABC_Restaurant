package com.abc.dao;

import com.abc.model.Reservation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    private static final String INSERT_RESERVATION_SQL = "INSERT INTO reservations (date, time, guests, name, phone, email, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_RESERVATIONS_SQL = "SELECT * FROM reservations LIMIT ?, ?";
    private static final String SELECT_RESERVATION_BY_ID_SQL = "SELECT * FROM reservations WHERE id = ?";
    private static final String COUNT_RESERVATIONS_SQL = "SELECT COUNT(*) FROM reservations";
    private static final String UPDATE_RESERVATION_STATUS_SQL = "UPDATE reservations SET status = ? WHERE id = ?";
    private static final String DELETE_RESERVATION_SQL = "DELETE FROM reservations WHERE id = ?";
    private static final String SELECT_RESERVATIONS_BY_STATUS_SQL = "SELECT * FROM reservations WHERE status = ?";


    private Connection connection;

    public ReservationDAO() {
        connection = DBConnection.getInstance().getConnection();
    }

    public boolean saveReservation(Reservation reservation) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESERVATION_SQL)) {
            preparedStatement.setDate(1, new java.sql.Date(reservation.getDate().getTime()));
            preparedStatement.setString(2, reservation.getTime());
            preparedStatement.setInt(3, reservation.getGuests());
            preparedStatement.setString(4, reservation.getName());
            preparedStatement.setString(5, reservation.getPhone());
            preparedStatement.setString(6, reservation.getEmail());
            preparedStatement.setString(7, reservation.getStatus());

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Reservation getReservationById(int id) {
        Reservation reservation = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESERVATION_BY_ID_SQL)) {
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
                reservation.setId(resultSet.getInt("id"));
                reservation.setStatus(resultSet.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservation;
    }

    public List<Reservation> getReservations(int offset, int limit) {
        List<Reservation> reservations = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESERVATIONS_SQL)) {
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
                reservation.setId(resultSet.getInt("id"));
                reservation.setStatus(resultSet.getString("status"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }

    public int getNoOfRecords() {
        int count = 0;
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(COUNT_RESERVATIONS_SQL)) {

            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean updateReservationStatus(int id, String status) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RESERVATION_STATUS_SQL)) {
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, id);

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteReservation(int id) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESERVATION_SQL)) {
            preparedStatement.setInt(1, id);

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Reservation> getReservationsByStatus(String status) {
        List<Reservation> reservations = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESERVATIONS_BY_STATUS_SQL)) {
            preparedStatement.setString(1, status);

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
                reservation.setId(resultSet.getInt("id"));
                reservation.setStatus(resultSet.getString("status"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }
}
