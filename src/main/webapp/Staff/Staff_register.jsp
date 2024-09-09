<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Registration</title>
    <style>
        body {
            background-color: #1c1c1c; /* Slightly darker background for contrast */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        .container {
            background-color: #2a2a2a; /* Dark grey container background */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            color: #ffcc00; /* Gold color for the text */
            width: 350px; /* Increased width for better spacing */
        }
        h2 {
            color: #ffd700; /* Brighter gold for the heading */
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            color: #ffcc00; /* Gold color for labels */
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 5px;
            background-color: #444444; /* Darker input fields */
            color: #fff; /* White text inside input fields */
            font-size: 14px;
        }
        .form-group input::placeholder {
            color: #bbbbbb; /* Light grey placeholder text */
        }
        button[type="submit"] {
            background-color: #ffd700; /* Gold button color */
            color: #000; /* Black text on button */
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }
        button[type="submit"]:hover {
            background-color: #e6b800; /* Slightly darker gold on hover */
        }
        p {
            color: #ffcc00; /* Gold color for additional text */
            margin-top: 20px;
        }
        p a {
            color: #ffd700; /* Brighter gold for links */
            text-decoration: none;
            font-weight: bold;
        }
        p a:hover {
            color: #e6b800; /* Slightly darker gold on hover */
        }
        .message {
            padding: 10px;
            margin-bottom: 20px;
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
        <h2>Staff Registration</h2>

        <% 
            // Display the registration message if present
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (successMessage != null) {
        %>
            <div class="message success">
                <%= successMessage %>
            </div>
        <% 
            } else if (errorMessage != null) {
        %>
            <div class="message error">
                <%= errorMessage %>
            </div>
        <% 
            }
        %>

        <!-- Registration Form -->
        <form action="staff" method="post">
            <input type="hidden" name="action" value="register">

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Enter your address" required>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit">Register</button>
        </form>

        <p>Already have an account? <a href="Staff_login.jsp">Login here</a>.</p>
    </div>
</body>
</html>
