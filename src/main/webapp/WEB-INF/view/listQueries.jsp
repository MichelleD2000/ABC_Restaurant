<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Queries</title>
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
        <h1 class="text-center">List of Queries</h1>
        <a href="addQuery.jsp" class="btn btn-primary">Add New Query</a>
        <table class="table table-striped table-hover mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="query" items="${queries}">
                    <tr>
                        <td>${query.id}</td>
                        <td>${query.name}</td>
                        <td>${query.email}</td>
                        <td>${query.message}</td>
                        <td>
                            <a href="queries?action=delete&id=${query.id}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
