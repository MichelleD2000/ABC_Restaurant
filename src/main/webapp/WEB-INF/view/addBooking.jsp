<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Booking</title>
    <link rel="stylesheet" href="path/to/bootstrap.css">
    <style>
        body {
            background-color: #000000;
            color: #FFD700;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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

        .form-group label {
            color: #FFD700;
        }

        .form-group input {
            background-color: #000000;
            border: 1px solid #FFD700;
            color: #FFD700;
        }

        .form-group input:focus {
            border-color: #FFD700;
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.8);
        }

        .btn-primary {
            background-color: #FFD700;
            border: none;
            color: #000000;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #FFC700;
            color: #000000;
        }
    </style>
</head>
<body>
    <form action="booking" method="post">
        <input type="hidden" name="action" value="createBooking">
        
        <h2>Add Booking</h2>
        
        <div class="form-group">
            <label for="eventType">Event Type:</label>
            <input type="text" name="eventType" id="eventType" required class="form-control">
        </div>
        
        <div class="form-group">
            <label for="eventName">Event Name:</label>
            <input type="text" name="eventName" id="eventName" required class="form-control">
        </div>
        
        <div class="form-group">
            <label for="date">Date:</label>
            <input type="date" name="date" id="date" required class="form-control">
        </div>
        
        <div class="form-group">
            <label for="time">Time:</label>
            <input type="time" name="time" id="time" required class="form-control">
        </div>
        
        <div class="form-group">
            <label for="guests">Number of Guests:</label>
            <input type="number" name="guests" id="guests" required class="form-control">
        </div>
        
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required class="form-control">
        </div>
        
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="tel" name="phone" id="phone" required class="form-control">
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required class="form-control">
        </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</body>
</html>
