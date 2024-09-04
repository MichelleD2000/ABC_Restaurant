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
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
        }
        .container {
            margin-top: 20px;
        }
        .table {
            background-color: #1c1c1c; /* Dark grey for the table */
        }
        .table thead th {
            background-color: #D4AF37; /* Gold color for table headers */
            color: #000; /* Black text color */
        }
        .table tbody tr:nth-child(odd) {
            background-color: #333; /* Slightly lighter grey for odd rows */
        }
        .table tbody tr:nth-child(even) {
            background-color: #444; /* Darker grey for even rows */
        }
        .btn-primary {
            background-color: #D4AF37; /* Gold color for primary button */
            border-color: #D4AF37; /* Gold border */
        }
        .btn-primary:hover {
            background-color: #b09f3f; /* Darker gold for hover */
            border-color: #b09f3f; /* Darker gold border */
        }
        .btn-warning {
            background-color: #FFC107; /* Warning color */
            border-color: #FFC107; /* Warning border */
        }
        .btn-warning:hover {
            background-color: #ffb300; /* Darker warning color for hover */
            border-color: #ffb300; /* Darker warning border */
        }
        .btn-danger {
            background-color: #DC3545; /* Danger color */
            border-color: #DC3545; /* Danger border */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker danger color for hover */
            border-color: #bd2130; /* Darker danger border */
        }
        .pagination .page-item.active .page-link {
            background-color: #D4AF37; /* Gold for active page */
            border-color: #D4AF37; /* Gold border for active page */
        }
        .pagination .page-item .page-link {
            color: #D4AF37; /* Gold color for page links */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">Booking List</h2>
        <table class="table table-dark table-striped">
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
                        <td><c:out value="${booking.id}"/></td>
                        <td><c:out value="${booking.eventType}"/></td>
                        <td><c:out value="${booking.eventName}"/></td>
                        <td><c:out value="${booking.date}"/></td>
                        <td><c:out value="${booking.time}"/></td>
                        <td><c:out value="${booking.guests}"/></td>
                        <td><c:out value="${booking.name}"/></td>
                        <td><c:out value="${booking.phone}"/></td>
                        <td><c:out value="${booking.email}"/></td>
                        <td>
                            <a href="booking?action=edit&id=${booking.id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="booking?action=delete&id=${booking.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:forEach var="i" begin="1" end="${noOfPages}">
                    <li class="page-item <c:if test="${i == currentPage}">active</c:if>">
                        <a class="page-link" href="booking?page=${i}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
        <a href="booking?action=add" class="btn btn-primary mt-4">Add New Booking</a>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
