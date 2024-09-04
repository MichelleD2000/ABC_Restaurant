<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Staff List</title>
    <link rel="stylesheet" href="path/to/your/bootstrap.css">
</head>
<body>
    <div class="container">
        <h2>Staff List</h2>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="staff" items="${staff}">
                <tr>
                    <td>${staff.id}</td>
                    <td>${staff.name}</td>
                    <td>${staff.email}</td>
                    <td>${staff.address}</td>
                    <td>${staff.phoneNumber}</td>
                    <td>
                        <a href="staff?action=edit&id=${staff.id}" class="btn btn-primary">Edit</a>
                        <a href="staff?action=delete&id=${staff.id}" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="staff?action=add" class="btn btn-success">Add New Staff</a>
    </div>
</body>
</html>
