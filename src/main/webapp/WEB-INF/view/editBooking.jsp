<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Booking</title>
    <link rel="stylesheet" href="path/to/bootstrap.css">
</head>
<body>
<h2>Edit Booking</h2>
<form action="booking" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${booking.id}">
    <div class="form-group">
        <label for="eventType">Event Type:</label>
        <input type="text" id="eventType" name="eventType" class="form-control" value="${booking.eventType}" required>
    </div>
    <div class="form-group">
        <label for="eventName">Event Name:</label>
        <input type="text" id="eventName" name="eventName" class="form-control" value="${booking.eventName}" required>
    </div>
    <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" class="form-control" value="${booking.date}" required>
    </div>
    <div class="form-group">
        <label for="time">Time:</label>
        <input type="time" id="time" name="time" class="form-control" value="${booking.time}" required>
    </div>
    <div class="form-group">
        <label for="guests">Number of Guests:</label>
        <input type="number" id="guests" name="guests" class="form-control" value="${booking.guests}" required>
    </div>
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" class="form-control" value="${booking.name}" required>
    </div>
    <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" class="form-control" value="${booking.phone}" required>
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="form-control" value="${booking.email}" required>
    </div>
    <button type="submit" class="btn btn-primary">Update Booking</button>
</form>
</body>
</html>
