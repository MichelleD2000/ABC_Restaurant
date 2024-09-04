<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ABC Restaurant</title>
    <link rel="stylesheet" href="./CSS/LRstyles.css">
    
    <style>
        .login-message {
            display: none;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            color: #fff;
        }

        .login-message.success {
            background-color: #4CAF50;
        }

        .login-message.error {
            background-color: #f44336;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Login</h2>
        <% 
            // Retrieve the success message from session
            String loginSuccessMessage = (String) session.getAttribute("loginSuccessMessage");
            if (loginSuccessMessage != null) {
        %>
            <div class="login-message success" id="loginMessage">
                <%= loginSuccessMessage %>
            </div>
            <% 
                // Remove the message from the session after displaying
                session.removeAttribute("loginSuccessMessage");
            }
        %>
        <form action="customer" method="post">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </form>
        
        <form action="customer" method="get" style="margin-top: 20px;">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="btn btn-secondary">Logout</button>
        </form>
        
        <script>
        // Function to display login message
        function showLoginMessage() {
            var message = document.getElementById("loginMessage");
            if (message) {
                message.style.display = "block";
                setTimeout(function() {
                    message.style.display = "none";
                }, 3000); // Hide the message after 3 seconds
            }
        }

        // Show the message if it's in the DOM
        document.addEventListener('DOMContentLoaded', function() {
            showLoginMessage();
        });
        </script>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </div>
    <script src="js/scripts.js"></script>
</body>
</html>
