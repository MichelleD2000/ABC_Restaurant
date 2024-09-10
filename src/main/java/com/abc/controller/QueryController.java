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

    private static final long serialVersionUID = 1L;
    private QueryService queryService;

    public void init() {
        try {
            queryService = QueryService.getInstance();
        } catch (SQLException e) {
            log("Error initializing QueryService: " + e.getMessage(), e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action != null) {
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
            } else {
                listQueries(request, response);
            }
        } catch (SQLException ex) {
            log("SQL Exception in doGet: " + ex.getMessage(), ex);
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Forward all POST actions to doGet for simplicity
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
        
        System.out.println("Customer Name: " + customerName);
        System.out.println("Customer Email: " + customerEmail);
        System.out.println("Query Text: " + queryText);

        Query newQuery = new Query();
        newQuery.setCustomerName(customerName);
        newQuery.setCustomerEmail(customerEmail);
        newQuery.setQueryText(queryText);

        queryService.createQuery(newQuery);

        // Set success message in session
        request.getSession().setAttribute("successMessage", "Your query has been successfully submitted!");

        // Redirect to avoid form resubmission
        response.sendRedirect(request.getContextPath() + "/queries");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Query existingQuery = queryService.getQueryById(id);
        request.setAttribute("query", existingQuery);
        request.getRequestDispatcher("WEB-INF/view/query-form.jsp").forward(request, response);
    }

    private void updateQuery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        Query query = new Query();
        query.setId(id);
        query.setStatus(status);

        queryService.updateQuery(query);
        response.sendRedirect(request.getContextPath() + "/queries?action=list");
    }


    private void deleteQuery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        queryService.deleteQuery(id);
        response.sendRedirect(request.getContextPath() + "/queries?action=list");
    }

    private void sendEmailResponse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");

        // Send email to customer
        sendEmail("Thank you for reaching out. We have reviewed your query.", email);

        // Update query status
        Query query = new Query();
        query.setId(id);
        query.setStatus("Responded");

        queryService.updateQuery(query);

        response.sendRedirect(request.getContextPath() + "/queries?action=list");
    }

    // Helper method to send email
    private void sendEmail(String message, String recipient) {
        String sender = "your-email@example.com"; // Replace with your email
        String host = "smtp.example.com"; // Replace with your SMTP server

        // Set properties for the mail session
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "587"); // Use appropriate port
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");

        // Get the session object
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("your-email@example.com", "your-password"); // Use proper credentials
            }
        });

        try {
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(sender));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            mimeMessage.setSubject("Response to Your Query");
            mimeMessage.setText(message);

            Transport.send(mimeMessage);
            log("Email sent successfully to " + recipient);
        } catch (MessagingException e) {
            log("Error sending email: " + e.getMessage(), e);
        }
    }
}
