<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Booking</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Booking</h2>
        <form action="booking" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${booking.id}">
            <div class="mb-3">
                <label for="eventType" class="form-label">Event Type:</label>
                <input type="text" id="eventType" name="eventType" class="form-control" value="${booking.eventType}" required>
            </div>
            <div class="mb-3">
                <label for="eventName" class="form-label">Event Name:</label>
                <input type="text" id="eventName" name="eventName" class="form-control" value="${booking.eventName}" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Date:</label>
                <input type="date" id="date" name="date" class="form-control" value="${booking.date}" required>
            </div>
            <div class="mb-3">
                <label for="time" class="form-label">Time:</label>
                <input type="time" id="time" name="time" class="form-control" value="${booking.time}" required>
            </div>
            <div class="mb-3">
                <label for="guests" class="form-label">Number of Guests:</label>
                <input type="number" id="guests" name="guests" class="form-control" value="${booking.guests}" required>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${booking.name}" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone:</label>
                <input type="text" id="phone" name="phone" class="form-control" value="${booking.phone}" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="${booking.email}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Booking</button>
        </form>
    </div>
</body>
</html>
