<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.abc.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Success</title>
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
        <h1>Reservation Successful!</h1>
        <p>Thank you for your reservation. Here are the details:</p>

        <%
            Reservation reservation = (Reservation) request.getAttribute("reservation");
            if (reservation != null) {
        %>
        <table border="1">
            <tr>
                <th>Date</th>
                <td>
                    <c:choose>
                        <c:when test="${not empty reservation.date}">
                            <fmt:formatDate value="${reservation.date}" pattern="yyyy-MM-dd" />
                        </c:when>
                        <c:otherwise>
                            Not provided
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>Time</th>
                <td><%= reservation.getTime() != null ? reservation.getTime() : "Not provided" %></td>
            </tr>
            <tr>
                <th>Guests</th>
                <td><%= reservation.getGuests() %></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><%= reservation.getName() != null ? reservation.getName() : "Not provided" %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= reservation.getPhone() != null ? reservation.getPhone() : "Not provided" %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= reservation.getEmail() != null ? reservation.getEmail() : "Not provided" %></td>
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
