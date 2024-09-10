package com.abc.util;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailUtil {

    // Method to send email
    public static void sendEmail(String toEmail, String subject, String body) {
        // Outlook SMTP server configuration
        String host = "smtp-mail.outlook.com";  // Outlook SMTP host
        final String fromEmail = "abcrestaurantsl@outlook.com"; // Outlook email
        final String password = "Abc@9711@#$"; // Your email password

        Properties props = new Properties();
        props.put("mail.smtp.host", host); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // Enable authentication
        props.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS

        // Create Authenticator object to authenticate the SMTP session
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            // Create email message
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromEmail));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(subject);
            msg.setContent(body, "text/html");

            // Send email
            Transport.send(msg);
            System.out.println("Email sent successfully to " + toEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    // Helper method to send a welcome email after customer registration
    public static void sendWelcomeEmail(String toEmail, String customerName) {
        String subject = "Welcome to ABC Restaurant!";
        String body = "<h2>Welcome to ABC Restaurant, " + customerName + "!</h2>"
                + "<p>Thank you for registering with us. We are thrilled to have you onboard.</p>"
                + "<p>You can now explore our menu, make reservations, and enjoy exclusive offers!</p>"
                + "<br><p>Cheers,</p>"
                + "<p><strong>ABC Restaurant Team</strong></p>";

        sendEmail(toEmail, subject, body);
    }

    // Helper method to send a reservation acceptance email
    public static void sendReservationAcceptedEmail(String toEmail, String customerName, String reservationDetails) {
        String subject = "Your Reservation at ABC Restaurant has been Accepted!";
        String body = "<h2>Hi " + customerName + ",</h2>"
                + "<p>Your reservation has been accepted. Here are the details:</p>"
                + "<p>" + reservationDetails + "</p>"
                + "<br><p>We look forward to serving you!</p>"
                + "<p><strong>ABC Restaurant Team</strong></p>";

        sendEmail(toEmail, subject, body);
    }

    // Helper method to send a reservation rejection email
    public static void sendReservationRejectedEmail(String toEmail, String customerName, String reservationDetails) {
        String subject = "Your Reservation at ABC Restaurant has been Rejected";
        String body = "<h2>Hi " + customerName + ",</h2>"
                + "<p>We regret to inform you that your reservation has been rejected due to unavailability or other reasons.</p>"
                + "<p>" + reservationDetails + "</p>"
                + "<br><p>Please feel free to make another reservation at a different time.</p>"
                + "<p><strong>ABC Restaurant Team</strong></p>";

        sendEmail(toEmail, subject, body);
    }
}
