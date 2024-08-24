<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Reservation List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000;
            color: #fff;
        }
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
            color: #fff;
        }
        .table thead {
            background-color: #D4AF37;
            color: #000;
        }
        .table tbody tr:nth-child(even) {
            background-color: #333;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #444;
        }
        .btn {
            margin: 2px;
        }
        .btn-primary {
            background-color: #D4AF37;
            border-color: #D4AF37;
        }
        .btn-primary:hover {
            background-color: #b09f3f;
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }
        .btn-warning:hover {
            background-color: #e0a800;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Staff Reservations</h2>
        

        <table class="table table-bordered">
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
                        <td><fmt:formatDate value="${reservation.date}" pattern="yyyy-MM-dd" /></td>
                        <td>${reservation.time}</td>
                        <td>${reservation.guests}</td>
                        <td>${reservation.phone}</td>
                        <td>${reservation.email}</td>
                        <td>
                            <a href="staffReservations?action=edit&id=${reservation.id}" class="btn btn-warning">Edit</a>
                            <a href="staffReservations?action=delete&id=${reservation.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this reservation?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
