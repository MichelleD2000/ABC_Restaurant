<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link rel="stylesheet" href="path/to/bootstrap.css">
    <style>
        body {
            background-color: #000000;
            color: #FFD700;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h2 {
            color: #FFD700;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            background-color: #333333;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.7);
            width: 100%;
            max-width: 600px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #FFD700;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            background-color: #000000;
            border: 1px solid #FFD700;
            color: #FFD700;
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
            border-color: #FFD700;
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.8);
        }

        input[type="submit"] {
            background-color: #FFD700;
            border: none;
            color: #000000;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #FFC700;
            color: #000000;
        }
    </style>
</head>
<body>
    <form action="customer?action=add" method="post">
        <h2>Add Customer</h2>
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="restaurantOutlet">Restaurant Outlet:</label>
        <input type="text" id="restaurantOutlet" name="restaurantOutlet">

        <input type="submit" value="Add Customer">
    </form>
</body>
</html>
