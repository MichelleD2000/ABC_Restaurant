<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- Added for date formatting -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
        }
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
            color: #fff; /* White text color for the table */
        }
        .table thead {
            background-color: #D4AF37; /* Gold header background */
            color: #000; /* Black text for the header */
        }
        .table tbody tr:nth-child(even) {
            background-color: #333; /* Dark grey background for even rows */
        }
        .table tbody tr:nth-child(odd) {
            background-color: #444; /* Slightly lighter grey for odd rows */
        }
        .btn {
            margin: 2px; /* Add some spacing between buttons */
        }
        .btn-primary {
            background-color: #D4AF37; /* Gold color for primary button */
            border-color: #D4AF37; /* Gold border */
        }
        .btn-primary:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
        }
        .btn-warning {
            background-color: #ffc107; /* Bootstrap warning button color */
            border-color: #ffc107; /* Border color */
        }
        .btn-warning:hover {
            background-color: #e0a800; /* Darker yellow for hover */
        }
        .btn-danger {
            background-color: #dc3545; /* Bootstrap danger button color */
            border-color: #dc3545; /* Border color */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker red for hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Reservations</h2>
        
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Guests</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservation" items="${reservations}">
                    <tr>
                        <td>${reservation.id}</td>
                        <td>${reservation.name}</td>
                        <td><fmt:formatDate value="${reservation.date}" pattern="yyyy-MM-dd" /></td> <!-- Date formatting -->
                        <td>${reservation.time}</td>
                        <td>${reservation.guests}</td>
                        <td>${reservation.phone}</td>
                        <td>${reservation.email}</td>
                        <td>
                            <a href="reservation?action=delete&id=${reservation.id}" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+Fsp3pXqIKPl9zz6csdB3znmCTw5p" crossorigin="anonymous"></script>
</body>
</html>
