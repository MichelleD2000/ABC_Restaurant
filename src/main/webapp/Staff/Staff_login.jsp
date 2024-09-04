<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Login</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h2>Staff Login</h2>

    <!-- Display any messages from the server -->
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

    <!-- Login Form -->
  <form action="Staff_Dashboard.jsp" method="post">
    <input type="hidden" name="action" value="login">
    <!-- Form fields -->
    <input type="email" id="email" name="email" required>
    <input type="password" id="password" name="password" required>
    <input type="submit" value="Login">
</form>
<p>Don't have an account? <a href="Staff_register.jsp">Register here</a>.</p>

</body>
</html>
