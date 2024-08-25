<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000000;
            color: #ffffff;
        }
        .table {
            background-color: #333333;
        }
        .table thead th {
            background-color: #FFD700; /* Gold */
            color: #000000;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #444444;
        }
        .table tbody tr:nth-child(even) {
            background-color: #555555;
        }
        .btn-primary {
            background-color: #FFD700; /* Gold */
            border-color: #FFD700;
        }
        .btn-primary:hover {
            background-color: #FFC107;
            border-color: #FFC107;
        }
        .btn-warning {
            background-color: #FFC107; /* Warning color */
            border-color: #FFC107;
        }
        .btn-warning:hover {
            background-color: #FFA000;
            border-color: #FFA000;
        }
        .btn-danger {
            background-color: #DC3545; /* Danger color */
            border-color: #DC3545;
        }
        .btn-danger:hover {
            background-color: #C82333;
            border-color: #BD2130;
        }
        .container {
            margin-top: 20px;
        }
        .header {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Booking List</h2>
            <a href="booking?action=add" class="btn btn-primary">Add Booking</a>
        </div>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Event Type</th>
                    <th>Event Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Guests</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.id}</td>
                        <td>${booking.eventType}</td>
                        <td>${booking.eventName}</td>
                        <td>${booking.date}</td>
                        <td>${booking.time}</td>
                        <td>${booking.guests}</td>
                        <td>${booking.name}</td>
                        <td>${booking.phone}</td>
                        <td>${booking.email}</td>
                        <td>
                            <a href="booking?action=edit&id=${booking.id}" class="btn btn-warning">Edit</a>
                            <a href="booking?action=delete&id=${booking.id}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
