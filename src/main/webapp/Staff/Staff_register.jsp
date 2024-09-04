<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Registration</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h2>Staff Registration</h2>

    

    <!-- Registration Form -->
    <form action="staff" method="post">
    <input type="hidden" name="action" value="register">
    <!-- Form fields -->
    <input type="text" id="name" name="name" required>
    <input type="email" id="email" name="email" required>
    <input type="text" id="address" name="address" required>
    <input type="text" id="phoneNumber" name="phoneNumber" required>
    <input type="password" id="password" name="password" required>
    <input type="submit" value="Register">
</form>
<p>Already have an account? <a href="Staff_login.jsp">Login here</a>.</p>

</body>
</html>
