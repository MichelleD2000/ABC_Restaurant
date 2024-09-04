<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
        }
        .container {
            margin-top: 50px;
        }
        h2 {
            margin-bottom: 20px;
            color: #D4AF37; /* Gold color for the heading */
        }
        .table {
            background-color: #1c1c1c; /* Dark grey for the table background */
            color: #fff; /* White text color for the table */
            border-collapse: collapse; /* Make borders collapse into one another */
        }
        .table th, .table td {
            padding: 10px;
            border: 1px solid #444; /* Dark grey border for table cells */
        }
        .table thead th {
            background-color: #D4AF37; /* Gold header background */
            color: #000; /* Black text color for header */
        }
        .table tbody tr:nth-child(even) {
            background-color: #333; /* Dark grey background for even rows */
        }
        .table tbody tr:nth-child(odd) {
            background-color: #444; /* Slightly lighter grey for odd rows */
        }
        .product-image {
            width: 100px; /* Adjust as needed */
            height: auto; /* Maintain aspect ratio */
            border: 2px solid #D4AF37; /* Gold border around images */
        }
        .btn {
            margin: 2px; /* Add some spacing between buttons */
            text-decoration: none; /* Remove underline from links */
        }
        .btn-primary {
            background-color: #D4AF37; /* Gold color for primary button */
            border-color: #D4AF37; /* Gold border */
        }
        .btn-primary:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
            border-color: #b09f3f; /* Slightly darker gold border */
        }
        .btn-warning {
            background-color: #FFC107; /* Warning color */
            border-color: #FFC107; /* Border color */
        }
        .btn-warning:hover {
            background-color: #e0a800; /* Darker yellow for hover */
            border-color: #e0a800; /* Darker yellow border */
        }
        .btn-danger {
            background-color: #DC3545; /* Danger color */
            border-color: #DC3545; /* Border color */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker red for hover */
            border-color: #c82333; /* Darker red border */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer List</h2>
        <a href="customer?action=add" class="btn btn-primary mb-3">Add New Customer</a>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone Number</th>
                    <th>Restaurant Outlet</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.customerId}</td>
                        <td>${customer.name}</td>
                        <td>${customer.email}</td>
                        <td>${customer.address}</td>
                        <td>${customer.phoneNumber}</td>
                        <td>${customer.restaurantOutlet}</td>
                        <td>
                            <a href="customer?action=edit&id=${customer.customerId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="customer?action=delete&id=${customer.customerId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
