<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant</title>
    <!-- Importing Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&family=Harry+Potter&display=swap" rel="stylesheet">
    <!-- Importing Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- CSS -->
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

        /* Search bar */
        .search-bar {
            flex-grow: 1;
            margin: 0 20px;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 40px 10px 15px;
            background-color: rgba(0, 0, 0, 0.5); /* Black and transparent */
            border: none;
            border-radius: 20px;
            color: white;
            font-size: 16px;
        }

        .search-bar .search-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #D0A24E; /* Gold color for search icon */
            font-size: 20px;
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
    </style>
</head>
<body>
    <nav>
        <!-- Logo Section -->
        <div class="logo">
            <img src="./images/logo.png" alt="Restaurant Logo">
            <h1>ABC Restaurant</h1>
        </div>

        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" placeholder="Search...">
            <span class="search-icon"><i class="fas fa-search"></i></span> <!-- Font Awesome search icon -->
        </div>

        <!-- Navigation Links -->
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="menu">Menu</a></li> <!-- Updated link to Menu.jsp -->
            <li><a href="#">Our Services</a></li>
            <li><a href="#">Reservations</a></li>
            <li><a href="#">Quarries</a></li>
            <li><a href="#">Gallery</a></li>
        </ul>

        <!-- Login/Registration Icon and Dropdown -->
        <div class="auth-links">
            <a href="#" class="auth-icon"><i class="fas fa-user"></i></a> <!-- Font Awesome user icon -->
            <div class="dropdown">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </div>
    </nav>
</body>
</html>
