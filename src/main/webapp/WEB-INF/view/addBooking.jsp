<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Booking</title>
    <link rel="stylesheet" href="path/to/bootstrap.css">
</head>
<body>
<h2>Add Booking</h2>
<form action="booking" method="post">
    <input type="hidden" name="action" value="add">
    <div class="form-group">
        <label for="eventType">Event Type:</label>
        <input type="text" id="eventType" name="eventType" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="eventName">Event Name:</label>
        <input type="text" id="eventName" name="eventName" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="time">Time:</label>
        <input type="time" id="time" name="time" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="guests">Number of Guests:</label>
        <input type="number" id="guests" name="guests" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Add Booking</button>
</form>
</body>
</html>
