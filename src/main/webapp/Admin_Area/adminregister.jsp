<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ABC Restaurant</title>
    <style>
        body {
            background-color: #2b2b2b; /* Dark background color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #3e3e3e; /* Dark grey background for the container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            color: #ffcc00; /* Gold color for the text */
            width: 300px; /* Width of the container */
        }
        h2 {
            color: #D0A24E; /* Gold color for the heading */
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            color: #D0A24E; /* Gold color for labels */
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: none;
            border-radius: 5px;
            background-color: #666666; /* Darker input fields */
            color: white; /* White text inside input fields */
        }
        .form-group input::placeholder {
            color: #cccccc; /* Light grey placeholder text */
        }
        button[type="submit"] {
            background-color: #D0A24E; /* Gold button color */
            color: black; /* Black text on button */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #e6b800; /* Slightly darker gold on hover */
        }
        p {
            color: #D0A24E; /* Gold color for additional text */
        }
        p a {
            color: #D0A24E; /* Gold color for links */
        }
        p a:hover {
            color: #D0A24E; /* Slightly darker gold on hover */
        }
        .message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            color: #fff;
            text-align: center;
        }
        .message.success {
            background-color: #4CAF50; /* Green for success */
        }
        .message.error {
            background-color: #f44336; /* Red for error */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="admin" method="post">
            <input type="hidden" name="action" value="register">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
           
           
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit">Register</button>
            <p>Already have an account? <a href="adminLogin.jsp">Login here</a></p>
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
