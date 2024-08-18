<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ABC Restaurant</title>
    <link rel="stylesheet" href="./CSS/LRstyles.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="user" method="post">
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
        <% if(request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </div>
    <script src="js/scripts.js"></script>
</body>
</html>
