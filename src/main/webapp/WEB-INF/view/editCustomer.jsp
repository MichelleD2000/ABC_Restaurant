<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background */
            color: #FFD700; /* Gold text color */
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
            background-color: #333; /* Dark grey background for the form container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.5); /* Gold shadow for the container */
        }
        .form-label {
            color: #FFD700; /* Gold color for form labels */
        }
        .form-control {
            background-color: #000; /* Black background for form controls */
            color: #FFD700; /* Gold text color for form controls */
            border: 1px solid #444; /* Dark grey border */
            border-radius: 5px;
        }
        .form-control:focus {
            border-color: #FFD700; /* Gold border on focus */
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.5); /* Gold shadow on focus */
        }
        .btn-primary {
            background-color: #FFD700; /* Gold color for the submit button */
            border-color: #FFD700; /* Gold border */
            color: #000; /* Black text color */
        }
        .btn-primary:hover {
            background-color: #E6BE8A; /* Slightly darker gold for hover */
        }
        h2 {
            color: #FFD700; /* Gold color for the header */
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Customer</h2>
        <form action="customer?action=update" method="post">
            <input type="hidden" name="id" value="${customer.customerId}">

            <div class="form-group">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${customer.name}" required>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="${customer.email}" required>
            </div>

            <div class="form-group">
                <label for="address" class="form-label">Address:</label>
                <input type="text" id="address" name="address" class="form-control" value="${customer.address}" required>
            </div>

            <div class="form-group">
                <label for="phoneNumber" class="form-label">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" value="${customer.phoneNumber}" required>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" value="${customer.password}" required>
            </div>

            <div class="form-group">
                <label for="restaurantOutlet" class="form-label">Restaurant Outlet:</label>
                <input type="text" id="restaurantOutlet" name="restaurantOutlet" class="form-control" value="${customer.restaurantOutlet}">
            </div>

            <button type="submit" class="btn btn-primary">Update Customer</button>
        </form>
    </div>
</body>
</html>
