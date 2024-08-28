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
    <input type="hidden" name="action" value="createBooking">
    
    <div class="form-group">
        <label for="eventType">Event Type:</label>
        <input type="text" name="eventType" id="eventType" required class="form-control">
    </div>
    
    <div class="form-group">
        <label for="eventName">Event Name:</label>
        <input type="text" name="eventName" id="eventName" required class="form-control">
    </div>
    
    <div class="form-group">
        <label for="date">Date:</label> <!-- Ensure correct lowercase 'date' -->
        <input type="date" name="date" id="date" required class="form-control">
    </div>
    
    <div class="form-group">
        <label for="time">Time:</label> <!-- Ensure correct lowercase 'time' -->
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
