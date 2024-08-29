package com.abc.dao;

import com.abc.model.Query;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QueryDAO {
    private static QueryDAO instance;
    private Connection connection;

    private QueryDAO() {
        // Initialize connection using Singleton DBConnection class
        connection = DBConnection.getInstance().getConnection();
    }

    public static QueryDAO getInstance() {
        if (instance == null) {
            instance = new QueryDAO();
        }
        return instance;
    }

    public void saveQuery(Query query) throws SQLException {
        String querySql = "INSERT INTO queries (customer_name, customer_email, question) VALUES (?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(querySql);
        stmt.setString(1, query.getCustomerName());
        stmt.setString(2, query.getCustomerEmail());
        stmt.setString(3, query.getQuestion());
        stmt.executeUpdate();
    }

    public List<Query> getAllQueries() throws SQLException {
        List<Query> queries = new ArrayList<>();
        String querySql = "SELECT * FROM queries";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(querySql);

        while (rs.next()) {
            Query query = new Query();
            query.setId(rs.getInt("id"));
            query.setCustomerName(rs.getString("customer_name"));
            query.setCustomerEmail(rs.getString("customer_email"));
            query.setQuestion(rs.getString("question"));
            query.setResponse(rs.getString("response"));
            query.setCreatedAt(rs.getTimestamp("created_at"));
            query.setUpdatedAt(rs.getTimestamp("updated_at"));
            queries.add(query);
        }
        return queries;
    }

    public void updateResponse(int queryId, String response) throws SQLException {
        String updateSql = "UPDATE queries SET response = ? WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(updateSql);
        stmt.setString(1, response);
        stmt.setInt(2, queryId);
        stmt.executeUpdate();
    }
}
