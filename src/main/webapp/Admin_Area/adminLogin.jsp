<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/LRstyles.css">

    <style>
        body {
            background-color: #2b2b2b; /* Dark background color as per the image */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #444444; /* Dark grey background for the login container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            color: #D0A24E; /* Gold color for the text */
        }
        .login-container h2 {
            margin-bottom: 20px;
            font-weight: bold;
            color: #D0A24E; /* Gold color for the header */
        }
        .form-group label {
            color: #D0A24E; /* Gold color for labels */
            text-align: left;
            width: 100%;
        }
        .form-control {
            background-color: #666666; /* Darker input fields */
            color: white; /* White text inside the input fields */
            border: none;
        }
        .form-control::placeholder {
            color: #cccccc; /* Light grey placeholder text */
        }
        .btn-primary {
            background-color: #D0A24E; /* Gold button color */
            border-color: #D0A24E; /* Gold border color */
            color: black; /* Black text on button */
        }
        .btn-primary:hover {
            background-color: #e6b800; /* Slightly darker gold on hover */
            border-color: #e6b800;
        }
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
        .additional-links {
            margin-top: 20px;
            color: #ffcc00; /* Gold color for additional links */
        }
        .additional-links a {
            color: #ffcc00; /* Gold color for links */
        }
        .additional-links a:hover {
            color: #e6b800; /* Slightly darker gold on hover */
      
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>

        <% 
            // Retrieve the success message from session
            String SuccessMessage = (String) session.getAttribute("SuccessMessage");
            if (SuccessMessage != null) {
        %>
            <div class="login-message success" id="loginMessage">
                <%= SuccessMessage %>
            </div>
        <% 
            // Remove the message from the session after displaying
            session.removeAttribute("SuccessMessage");
            }
        %>

        <form action="dashboard.jsp" method="post">
            <input type="hidden" name="action" value="login">
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>

        <div class="additional-links">
            <p>Don't have an account? <a href="adminregister.jsp">Register here</a></p>
        </div>

       

        <% if(request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </div>

    <script>
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
</body>
</html>
