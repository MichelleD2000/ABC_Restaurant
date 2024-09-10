<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Your Query</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: rgba(0, 0, 0, 0.7);
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.7); /* Black and transparent */
            padding: 20px 5%;
            position: fixed; /* Stays fixed when scrolling */
            width: 100%;
            top: 0;
            z-index: 10;
        }

        /* Logo section */
        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            width: 50px;
            margin-right: 10px;
        }

        .logo h1 {
            color: #D0A24E;
            font-weight: 600;
            font-size: 24px;
            font-family: 'Harry Potter', serif; /* Harry Potter style font */
        }

        /* Navigation links */
        .nav-links {
            display: flex;
            list-style: none;
            font-weight: 500;
        }

        .nav-links li {
            margin-left: 25px;
        }

        .nav-links a {
            text-decoration: none;
            color: #D0A24E;
            font-size: 16px;
        }

        /* Auth icon section */
        .auth-links {
            margin-left: 20px;
            display: flex;
            align-items: center;
            position: relative;
        }

        .auth-icon {
            color: #D0A24E; /* Gold color for login/registration icon */
            font-size: 24px;
            cursor: pointer;
            margin-left: 20px;
            text-decoration: none;
        }

        .dropdown {
            display: none;
            position: absolute;
            top: 35px;
            right: 0;
            background-color: rgba(0, 0, 0, 0.7); /* Transparent background */
            border-radius: 5px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            padding: 10px;
            z-index: 100;
        }

        .dropdown a {
            text-decoration: none;
            color: #D0A24E; /* Gold color for text */
            padding: 10px 15px;
            display: block;
            background-color: transparent;
        }

        .dropdown a:hover {
            background-color: rgba(255, 255, 255, 0.1); /* Slight white hover effect */
        }

        /* Show dropdown on hover */
        .auth-icon:hover + .dropdown,
        .dropdown:hover {
            display: block;
        }

        /* Cart icon specific styles */
        .cart-icon {
            position: relative;
            margin-left: 20px; /* Adjust spacing between icons */
            color: #D0A24E; /* Gold color for cart icon */
            font-size: 24px;
            cursor: pointer;
            text-decoration: none;
        }

        /* Optional: Show a hover effect for the cart icon */
        .cart-icon:hover {
            color: #f2b233; /* Slightly lighter gold for hover effect */
        }

        .text-center {
            margin-top: 130px;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav>
        <!-- Logo Section -->
        <div class="logo">
            <img src="./images/logo.png" alt="Restaurant Logo">
            <h1>ABC Restaurant</h1>
        </div>

        <!-- Navigation Links -->
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="menu">Menu</a></li> <!-- Updated link to Menu.jsp -->
            <li><a href="ServicesPage.jsp">Our Services</a></li>
            <li><a href="reservation.jsp">Reservations</a></li>
            <li><a href="Queries.jsp">Queries</a></li>
            <li><a href="image">Gallery</a></li>
        </ul>

        <!-- Login/Registration Icon and Dropdown -->
        <div class="auth-links">
            <a href="#" class="auth-icon"><i class="fas fa-user"></i></a> <!-- Font Awesome user icon -->
            <div class="dropdown">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
            <!-- Cart Icon -->
            <a href="cart.jsp" class="auth-icon cart-icon"><i class="fas fa-shopping-cart"></i></a> <!-- Font Awesome cart icon -->
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <h2 class="text-center">Submit Your Query</h2>

        <!-- Success message block -->
        
        <form action="queries?action=insert" method="post">
            <div class="form-group">
                <label for="customerName">Name:</label>
                <input type="text" class="form-control" id="customerName" name="customerName" required>
            </div>
            <div class="form-group">
                <label for="customerEmail">Email:</label>
                <input type="email" class="form-control" id="customerEmail" name="customerEmail" required>
            </div>
            <div class="form-group">
                <label for="queryText">Your Query:</label>
                <textarea class="form-control" id="queryText" name="queryText" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Query</button>
        </form>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Add event listener to the form
        const form = document.querySelector('form');
        form.addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the form from submitting traditionally

            // Create a new FormData object from the form
            const formData = new FormData(form);

            // Send an AJAX request
            fetch('queries?action=insert', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text()) // Get the response text
            .then(data => {
                // Show success message
                const successMessage = document.createElement('div');
                successMessage.classList.add('alert', 'alert-success');
                successMessage.textContent = "Your query has been successfully submitted!";
                
                // Insert the success message at the top of the form
                form.insertAdjacentElement('beforebegin', successMessage);

                // Clear form fields after submission
                form.reset();

                // Remove the success message after 5 seconds
                setTimeout(() => {
                    successMessage.remove();
                }, 5000);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    });
</script>
    
</body>
</html>
