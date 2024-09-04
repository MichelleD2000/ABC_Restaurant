package com.abc.dao;

import com.abc.model.Query;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class QueryDAO {
    private static QueryDAO instance;
    private Connection connection;

    private QueryDAO() throws SQLException {
        // Assume DBConnection is a Singleton class handling DB connection
        connection = DBConnection.getInstance().getConnection();
    }

    public static QueryDAO getInstance() throws SQLException {
        if (instance == null) {
            instance = new QueryDAO();
        }
        return instance;
    }

    public void createQuery(Query query) throws SQLException {
        String sql = "INSERT INTO queries (customer_name, customer_email, query_text) VALUES (?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, query.getCustomerName());
        statement.setString(2, query.getCustomerEmail());
        statement.setString(3, query.getQueryText());
        statement.executeUpdate();
    }

    public List<Query> getAllQueries() throws SQLException {
        List<Query> queries = new ArrayList<>();
        String sql = "SELECT * FROM queries";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            Query query = new Query();
            query.setId(resultSet.getInt("id"));
            query.setCustomerName(resultSet.getString("customer_name"));
            query.setCustomerEmail(resultSet.getString("customer_email"));
            query.setQueryText(resultSet.getString("query_text"));
            query.setResponseText(resultSet.getString("response_text"));
            query.setStatus(resultSet.getString("status"));
            query.setCreatedAt(resultSet.getTimestamp("created_at"));
            queries.add(query);
        }

        return queries;
    }

    public Query getQueryById(int id) throws SQLException {
        String sql = "SELECT * FROM queries WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            Query query = new Query();
            query.setId(resultSet.getInt("id"));
            query.setCustomerName(resultSet.getString("customer_name"));
            query.setCustomerEmail(resultSet.getString("customer_email"));
            query.setQueryText(resultSet.getString("query_text"));
            query.setResponseText(resultSet.getString("response_text"));
            query.setStatus(resultSet.getString("status"));
            query.setCreatedAt(resultSet.getTimestamp("created_at"));
            return query;
        }

        return null;
    }

    public void updateQuery(Query query) throws SQLException {
        String sql = "UPDATE queries SET response_text = ?, status = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, query.getResponseText());
        statement.setString(2, query.getStatus());
        statement.setInt(3, query.getId());
        statement.executeUpdate();

        // After updating the query in the database, send an email to the customer
        sendEmail(query.getCustomerEmail(), "Response to Your Query", query.getResponseText());
    }

    public void deleteQuery(int id) throws SQLException {
        String sql = "DELETE FROM queries WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
    }

    // Helper method to send email
    private void sendEmail(String recipient, String subject, String messageText) {
        String sender = "your-email@example.com"; // replace with your email
        String host = "smtp.example.com"; // replace with your SMTP server

        // Set properties for the mail session
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "587"); // Use the appropriate port for your SMTP server
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");

        // Get the default session object
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("your-email@example.com", "your-password"); // replace with your email and password
            }
        });

        try {
            // Create a default MimeMessage object
            MimeMessage mimeMessage = new MimeMessage(session);

            // Set the sender's address
            mimeMessage.setFrom(new InternetAddress(sender));

            // Set the recipient's address
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

            // Set the subject and message text
            mimeMessage.setSubject(subject);
            mimeMessage.setText(messageText);

            // Send the message
            Transport.send(mimeMessage);
            System.out.println("Email sent successfully...");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
