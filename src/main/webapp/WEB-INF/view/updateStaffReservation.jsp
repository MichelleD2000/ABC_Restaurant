<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Staff Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000;
            color: #fff;
        }
        .container {
            margin-top: 50px;
        }
        .form-control {
            background-color: #333;
            color: #fff;
            border: 1px solid #555;
        }
        .form-control:focus {
            background-color: #444;
            border-color: #D4AF37;
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
        <h2>Update Staff Reservation</h2>
        <form action="staffReservations?action=update" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${reservation.id}">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${reservation.name}" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${reservation.email}" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${reservation.phone}" required>
            </div>
            <div class="mb-3">
                <label for="guests" class="form-label">Guests</label>
                <input type="number" class="form-control" id="guests" name="guests" value="${reservation.guests}" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Date</label>
                <input type="date" class="form-control" id="date" name="date" value="${reservation.date}" required>
            </div>
            <div class="mb-3">
                <label for="time" class="form-label">Time</label>
                <input type="time" class="form-control" id="time" name="time" value="${reservation.time}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Reservation</button>
            <a href="staffReservations?action=list" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
