<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ABC Restaurant</title>
    <link rel="stylesheet" href="./CSS/LRstyles.css">
    <style>
        .message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            color: #fff;
        }

        .message.success {
            background-color: #4CAF50;
        }

        .message.error {
            background-color: #f44336;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="customer" method="post">
            <input type="hidden" name="action" value="register">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="restaurantOutlet">Restaurant Outlet:</label>
                <input type="text" id="restaurantOutlet" name="restaurantOutlet" required>
            </div>
            <button type="submit">Register</button>
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </form>

        <% 
            // Display the registration message if present
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="message success">
                <%= message %>
            </div>
        <% 
            }
        %>
    </div>
</body>
</html>
