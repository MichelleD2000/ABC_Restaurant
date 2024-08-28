<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.abc.model.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Success</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        body {
            background-color: #1a1a1a;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            color: #ffd700;
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #333;
            color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #ffd700;
            color: #1a1a1a;
            font-weight: bold;
        }

        td {
            border-bottom: 1px solid #555;
        }

        a {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px 0;
            text-align: center;
            background-color: #ffd700;
            color: #1a1a1a;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #e6b800;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            background-color: #222;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const successMessage = document.querySelector('h1');
            successMessage.classList.add('fade-in');

            setTimeout(function () {
                successMessage.classList.remove('fade-in');
            }, 2000);
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Booking Successful!</h1>
        <p>Thank you for your reservation. Here are the details:</p>

        <%
        Booking booking = (Booking) request.getAttribute("booking");
            if (booking != null) {
        %>
        <table border="1">
            
            <tr>
                <th>EventType</th>
                <td><%= booking.getEventType() != null ? booking.getEventType() : "Not provided" %></td>
            </tr>
            <tr>
                <th>EventName</th>
                <td><%= booking.getEventName() %></td>
            </tr>
            <tr>
    <th>Date</th>
    <td>
        <c:choose>
            <c:when test="${not empty booking.date}">
                ${booking.date} <!-- Directly output the date string -->
            </c:when>
            <c:otherwise>
                Not provided
            </c:otherwise>
        </c:choose>
    </td>
</tr>

            <tr>
                <th>Time</th>
                <td><%= booking.getTime() != null ? booking.getTime() : "Not provided" %></td>
            </tr>
            <tr>
                <th>Guests</th>
                <td><%= booking.getGuests() %></td>
            </tr>
             <tr>
                <th>Name</th>
                <td><%= booking.getName() != null ? booking.getName() : "Not provided" %></td>
            </tr>
             <tr>
                <th>Phone</th>
                <td><%= booking.getPhone() != null ? booking.getPhone() : "Not provided" %></td>
            </tr>
             <tr>
                <th>Email</th>
                <td><%= booking.getEmail() != null ? booking.getEmail() : "Not provided" %></td>
            </tr>
            
        </table>

        <p>We look forward to serving you!</p>

        <a href="index.jsp">Return to Home</a>
        <%
            } else {
                out.println("Reservation object is null. Please check if it's being passed correctly.");
            }
        %>
    </div>
</body>
</html>
