package com.abc.controller;

import com.abc.model.Query;
import com.abc.service.QueryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

@WebServlet("/queries")
public class QueryController extends HttpServlet {
    private QueryService queryService;

    public void init() {
        try {
            queryService = QueryService.getInstance();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertQuery(request, response);
                    break;
                case "delete":
                    deleteQuery(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateQuery(request, response);
                    break;
                case "sendEmail":
                    sendEmailResponse(request, response);
                    break;
                default:
                    listQueries(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "insert":
                    insertQuery(request, response);
                    break;
                case "sendEmail":
                    sendEmailResponse(request, response);
                    break;
                default:
                    listQueries(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listQueries(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Query> listQuery = queryService.getAllQueries();
        request.setAttribute("listQuery", listQuery);
        request.getRequestDispatcher("WEB-INF/view/query-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/query-form.jsp").forward(request, response);
    }

    private void insertQuery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String customerName = request.getParameter("customerName");
        String customerEmail = request.getParameter("customerEmail");
        String queryText = request.getParameter("queryText");

        Query newQuery = new Query();
        newQuery.setCustomerName(customerName);
        newQuery.setCustomerEmail(customerEmail);
        newQuery.setQueryText(queryText);

        queryService.createQuery(newQuery);

        // Forward back to the Queries.jsp with a success message
        request.setAttribute("successMessage", "Your query has been successfully submitted!");
        request.getRequestDispatcher("Queries.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Query existingQuery = queryService.getQueryById(id);
        request.setAttribute("query", existingQuery);
        request.getRequestDispatcher("query-form.jsp").forward(request, response);
    }

    private void updateQuery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String responseText = request.getParameter("responseText");
        String status = request.getParameter("status");

        Query query = new Query();
        query.setId(id);
        query.setResponseText(responseText);
        query.setStatus(status);

        queryService.updateQuery(query);
        response.sendRedirect("queries?action=list");
    }

    private void deleteQuery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        queryService.deleteQuery(id);
        response.sendRedirect("queries?action=list");
    }

    // New method to send email response
    private void sendEmailResponse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String responseText = request.getParameter("responseText");

        // Send email to customer
        sendEmail(responseText, email);

        // Update query with response and status
        Query query = new Query();
        query.setId(id);
        query.setResponseText(responseText);
        query.setStatus("Responded");

        queryService.updateQuery(query);

        // Redirect to the queries list
        response.sendRedirect("queries?action=list");
    }

    // Helper method to send email
    private void sendEmail(String message, String recipient) {
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
            mimeMessage.setSubject("Response to Your Query");
            mimeMessage.setText(message);

            // Send the message
            Transport.send(mimeMessage);
            System.out.println("Email sent successfully...");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
