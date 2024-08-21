<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="css/styles.css">
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
