<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Staff</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
            background-color: #222; /* Dark grey background for form container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(212, 175, 55, 0.5); /* Gold shadow for container */
        }
        h2 {
            text-align: center;
            color: #D4AF37; /* Gold color for heading */
            margin-bottom: 30px;
        }
        .form-group label {
            color: #D4AF37; /* Gold color for form labels */
        }
        .form-control {
            background-color: #333; /* Dark grey background for form controls */
            color: #fff; /* White text color for form controls */
            border: 1px solid #444; /* Dark grey border */
        }
        .form-control:focus {
            border-color: #D4AF37; /* Gold border on focus */
            box-shadow: 0 0 0 0.2rem rgba(212, 175, 55, 0.25); /* Gold shadow on focus */
        }
        .btn-primary {
            background-color: #D4AF37; /* Gold color for primary button */
            border-color: #D4AF37; /* Gold border */
        }
        .btn-primary:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
        }
        .btn-secondary {
            background-color: #444; /* Dark grey background for secondary button */
            border-color: #444; /* Dark grey border */
        }
        .btn-secondary:hover {
            background-color: #333; /* Even darker grey for hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Staff</h2>
        <form action="staff?action=update" method="post">
            <input type="hidden" name="id" value="${staff.id}">
            <div class="form-group mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${staff.name}" required>
            </div>
            <div class="form-group mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${staff.email}" required>
            </div>
            <div class="form-group mb-3">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="${staff.address}" required>
            </div>
            <div class="form-group mb-3">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${staff.phoneNumber}" required>
            </div>
            <div class="form-group mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="${staff.password}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="staff?action=list" class="btn btn-secondary">Back to List</a>
        </form>
    </div>
</body>
</html>
