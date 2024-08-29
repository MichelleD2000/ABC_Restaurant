package com.abc.dao;

import com.abc.model.Query;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QueryDAO {
    private Connection connection;

    public QueryDAO() {
        connection = DBConnectionFactory.getConnection();
    }

    public void createQuery(Query query) throws SQLException {
        String sql = "INSERT INTO queries (name, email, message) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, query.getName());
            statement.setString(2, query.getEmail());
            statement.setString(3, query.getMessage());
            statement.executeUpdate();
        }
    }

    public List<Query> getAllQueries() throws SQLException {
        List<Query> queries = new ArrayList<>();
        String sql = "SELECT * FROM queries";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Query query = new Query(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("message")
                );
                queries.add(query);
            }
        }
        return queries;
    }

    public void deleteQuery(int id) throws SQLException {
        String sql = "DELETE FROM queries WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
}
