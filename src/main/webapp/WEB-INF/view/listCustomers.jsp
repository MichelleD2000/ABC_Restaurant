<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="css/styles.css">
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
        .product-image {
            width: 100px; /* Adjust as needed */
            height: auto; /* Maintain aspect ratio */
            border: 2px solid #D4AF37; /* Gold border around images */
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
        <h2>Customer List</h2>
        <a href="customer?action=add">Add New Customer</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Restaurant Outlet</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.customerId}</td>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>${customer.phoneNumber}</td>
                    <td>${customer.restaurantOutlet}</td>
                    <td>
                        <a href="customer?action=edit&id=${customer.customerId}">Edit</a>
                        <a href="customer?action=delete&id=${customer.customerId}" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
