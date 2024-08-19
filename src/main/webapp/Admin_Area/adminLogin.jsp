<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="path/to/your/css/styles.css">
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="admin" method="post">
            <input type="hidden" name="action" value="login">
            <div class="input-group">
                <label>Username:</label>
                <input type="text" name="username" required>
            </div>
            <div class="input-group">
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit">Login</button>
            
        </form>
    </div>
</body>
</html>
