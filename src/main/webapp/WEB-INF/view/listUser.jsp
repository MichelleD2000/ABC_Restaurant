<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
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
            background-color: #333;
            color: #fff;
        }
        .table th, .table td {
            color: #fff;
        }
        .btn-primary {
            background-color: #D4AF37;
            border-color: #D4AF37;
        }
        .btn-primary:hover {
            background-color: #b09f3f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">User List</h1>
        <table class="table table-dark table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="user?action=add" class="btn btn-primary">Add New User</a>
    </div>
</body>
</html>
