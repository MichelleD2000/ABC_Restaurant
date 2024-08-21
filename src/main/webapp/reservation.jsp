<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Reservation</title>
    <link rel="stylesheet" type="text/css" href="./CSS/reservation.css">
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
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px 5%;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 10;
        }

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
            margin-top: 20px;
            font-size: 24px;
            font-family: 'Dancing Script', cursive;
        }

        .search-bar {
            flex-grow: 1;
            margin: 0 20px;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 40px 10px 15px;
            background-color: rgba(0, 0, 0, 0.5);
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
            color: #D0A24E;
            font-size: 20px;
        }

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

        .auth-links {
            margin-left: 20px;
            display: flex;
            align-items: center;
            position: relative;
        }

        .auth-icon {
            color: #D0A24E;
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
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 5px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            padding: 10px;
            z-index: 100;
        }

        .dropdown a {
            text-decoration: none;
            color: #D0A24E;
            padding: 10px 15px;
            display: block;
            background-color: transparent;
        }

        .dropdown a:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .auth-icon:hover + .dropdown,
        .dropdown:hover {
            display: block;
        }

        .reservation-header {
            background-image: url('./images/reservation2.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
            height: 300px;
            color: white;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        h1 {
            font-size: 48px;
            font-weight: bold;
            color: #D0A24E;
            margin-top: 70px;
        }

        .breadcrumb {
            list-style: none;
            display: flex;
            justify-content: center;
            margin-top: 15px;
        }

        .breadcrumb li {
            margin: 0 10px;
            font-size: 16px;
        }

        .breadcrumb a {
            color: white;
            text-decoration: none;
        }

        .breadcrumb .las {
            margin-right: 5px;
        }

        .reservation-details {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 50px 10%;
            background-color: #fff;
            color: #333;
        }

        .reservation-text {
            max-width: 50%;
            text-align: center;
        }

        .reservation-text h2 {
            font-family: 'Dancing Script', cursive;
            font-size: 36px;
            color: #ccc;
            margin-bottom: 10px;
        }

        .reservation-text h3 {
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .divider {
            width: 50px;
            height: 2px;
            background-color: #ccc;
            margin: 20px auto;
        }

        .reservation-text p {
            font-size: 16px;
            color: #666;
            margin-bottom: 10px;
        }

        .reserve-by-phone {
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }

        .phone-number {
            font-size: 24px;
            color: #D0A24E;
            font-weight: bold;
        }

        .open-timing {
            background-color: #333;
            padding: 20px;
            color: #D0A24E;
            text-align: center;
            border-radius: 10px;
        }

        .open-timing h3 {
            font-family: 'Dancing Script', cursive;
            font-size: 24px;
            color: #D0A24E;
            margin-bottom: 20px;
        }

        .open-timing p {
            font-size: 16px;
            color: #D0A24E;
            margin: 5px 0;
        }

        .open-timing .divider {
            width: 50px;
            height: 1px;
            background-color: #D0A24E;
            margin: 10px auto 20px auto;
        }
        
        /* Reservation Form */
        .reservation-form {
            padding: 50px 10%;
            background-color: #fff;
            color: #333;
            text-align: center;
        }

        .reservation-form h3 {
            font-family: 'Dancing Script', cursive;
            font-size: 36px;
            color: #ccc;
            margin-bottom: 10px;
        }

        .reservation-form p {
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .reservation-form .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .reservation-form input,
        .reservation-form select {
            width: 30%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .reservation-form input::placeholder {
            color: #999;
        }

        .reservation-form button {
            padding: 15px 30px;
            background-color: #D0A24E;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .reservation-form button:hover {
            background-color: #b88a3b;
        }

        .reservation-form .powered-by {
            margin-top: 20px;
            font-size: 14px;
            color: #999;
        }
        
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <img src="./images/logo.png" alt="Restaurant Logo">
            <h1>ABC Restaurant</h1>
        </div>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="menu">Menu</a></li>
            <li><a href="#">Our Services</a></li>
            <li><a href="reservation.jsp">Reservations</a></li>
            <li><a href="#">Quarries</a></li>
            <li><a href="#">Gallery</a></li>
        </ul>
        <div class="auth-links">
            <a href="#" class="auth-icon"><i class="fas fa-user"></i></a>
            <div class="dropdown">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </div>
    </nav>
    <div class="reservation-header">
        <div class="overlay">
            <h1>Reservations</h1>
        </div>
    </div>
    <div class="reservation-details">
        <div class="reservation-text">
            <h2>Make a Reservation</h2>
            <h3>Private Dining & Events</h3>
            <hr class="divider">
            <p>
               "I am afflicted by love, pleasure, and work. I use my own reasoning, and I am committed to my responsibilities. I am free from pain, and I avoid trivial matters. I strive for a rational mindset, and I hold onto what is essential. I move toward higher thinking, and I listen to what is possible."
            </p>
            <p class="reserve-by-phone">Reserved By Phone</p>
            <p class="phone-number">(00) 123 456 789</p>
        </div>
        <div class="open-timing">
            <h3>Open Timing</h3>
            <hr class="divider">
            <p>Mon-Thu: 10:00 AM - 11:00 PM</p>
            <p>Fri-Sat: 10:00 AM - 12:00 AM</p>
            <p>Sun: 10:00 AM - 10:00 PM</p>
        </div>
    </div>
    
     <section class="reservation-form">
        <h3>Online Reservation</h3>
        <p>No Need To Wait For Table</p>
        <form action="reservation" method="post">
            <div class="form-group">
                <input type="date" name="date" required placeholder="Date">
                <input type="time" name="time" required placeholder="Time">
                <select name="guests" required>
                    <option value="" disabled selected>Guests</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" name="name" required placeholder="Your Name">
                <input type="tel" name="phone" required placeholder="Your Phone">
                <input type="email" name="email" required placeholder="Your Email">
            </div>
            <button type="submit">Make a Reservation</button>
            <p class="powered-by">Powered by ABC Restaurant</p>
        </form>
    </section>


     <footer>
        <jsp:include page="./footer.jsp" />
    </footer>
</body>
</html>
