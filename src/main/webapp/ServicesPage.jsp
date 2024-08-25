<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Services</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./CSS/menu.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="styles.css">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap');

    event-body {
        font-family: 'Playfair Display', serif; /* Using Playfair Display */
        background-color: black;
        color: white; /* Changed to white for readability on a black background */
        margin: 0;
        padding: 0;
    }

    .private-events {
        text-align: center;
        padding: 50px 20px;
    }

    .sub-heading {
        font-size: 28px; /* Font size as in image */
        font-style: italic;
        font-weight: 400;
        color: #a9a9a9; /* Light grey for sub-heading */
        margin: 0;
        letter-spacing: 0.05em; /* Slight letter spacing */
    }

    .main-heading {
        font-size: 42px; /* Larger font size for the main heading */
        font-weight: 700; /* Bold for emphasis */
        color: gold; /* Gold color for emphasis */
        margin: 10px 0;
    }

    .divider {
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 20px 0;
    }

    .line {
        width: 60px;
        height: 1px;
        background-color: #cccccc; /* Light grey line */
        margin: 0 15px;
    }

    .icon {
        font-size: 20px; /* Smaller icon size */
        color: #cccccc; /* Light grey icon */
    }

    .description {
        font-size: 18px; /* Font size for description */
        line-height: 1.8; /* Increased line height for readability */
        max-width: 800px;
        margin: 0 auto;
        color: white; /* White for description text */
        font-family: 'Arial', sans-serif; /* Arial for body text */
    }

    .event-image {
        margin-top: 30px; /* Space above the image */
        width: 100%; /* Make the image responsive */
        height: auto; /* Maintain aspect ratio */
        display: block;
        margin-left: auto;
        margin-right: auto;
        border-radius: 10px; /* Add some rounding to the corners */
    }

    /* New styles for the interface below the event image */
    .event-details {
        padding: 30px 20px;
        font-family: 'Playfair Display', serif; /* Ensure consistent font */
        color: gold; /* Matching text color */
    }

    .event-details h2 {
        font-size: 28px; /* Font size matching image */
        font-style: italic;
        font-weight: 400;
        color: #a9a9a9; /* Light grey color */
        margin-bottom: 10px;
    }

    .event-details h1 {
        font-size: 36px; /* Slightly smaller than main heading */
        font-weight: 700;
        color: gold; /* Gold color */
        margin-bottom: 20px;
    }

    .event-details p {
        font-size: 16px; /* Description font size */
        color: #a9a9a9; /* Lighter grey color */
        max-width: 600px;
        margin: 0 auto 20px auto;
    }

    .event-info {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 30px;
        font-size: 16px; /* Font size for details */
        color: white; /* Text color matching headings */
    }

    .event-info div {
        margin-top: 10px;
        font-weight: 500;
    }

    .event-info div span {
        font-weight: 700; /* Bold labels */
    }
    
    body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f8f8;
    margin: 0;
    padding: 0;
}

.reservation-container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    text-align: center;
}

.reservation-title {
    font-size: 28px;
    color: #2c3e50;
    margin-bottom: 20px;
}

.subtitle {
    font-size: 18px;
    font-style: italic;
    color: #aaa;
    display: block;
}

.reservation-form {
    margin-top: 20px;
}

.form-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
}

input[type="text"],
input[type="date"],
input[type="time"],
input[type="number"],
input[type="tel"],
input[type="email"] {
    width: 48%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

.submit-btn {
    padding: 10px 20px;
    background-color: #d4a76a;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.submit-btn:hover {
    background-color: #b08c5a;
}

.powered-by {
    margin-top: 10px;
    font-size: 14px;
    color: #aaa;
}
    
    
</style>
</head>
<body>

<jsp:include page="./navigationbar.jsp" />

<header class="header-section">
    <div class="overlay">
        <div class="container text-center text-white">
            <h1 class="display-4">Events Or Celebration</h1>
            <p class="lead">Find a Party Area</p>
        </div>
    </div>
</header>

<section class="private-events">
    <h2 class="sub-heading">Arrangements and Arrange</h2>
    <h1 class="main-heading">Private Events</h1>
    <div class="divider">
        <span class="line"></span>
        <span class="icon">✧</span>
        <span class="line"></span>
    </div>
    <p class="description">
        At ABC Restaurant, we believe that every occasion is worth celebrating in style. Whether you're planning an intimate gathering, a corporate event, or a grand celebration, our team is dedicated to making your event unforgettable. With our elegant venue, gourmet cuisine, and personalized service, we tailor every detail to match your vision. From birthdays and anniversaries to weddings and business meetings, we create the perfect atmosphere for any special moment. Let us turn your event into a cherished memory.
    </p>

    <img src="images/luxury-dining-candlelit-table-elegant-decor-exquisite-food-wine-generated-by-artificial-intelligence_188544-127348.jpg" alt="Event Image" class="event-image">

    <!-- New Interface Section -->
    <div class="event-details text-center mt-4">
        <h2 class="sub-heading">Family Party</h2>
        <h1 class="main-heading">Birthday Celebration</h1>
        <div class="divider">
            <span class="line"></span>
            <span class="icon">✧</span>
            <span class="line"></span>
        </div>
        <p class="description">
            Dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati.
        </p>

        <div class="event-info">
            <div><span>Hall Info:</span> 2452 Sq Feet Free Space</div>
            <div><span>Guest Count:</span> Up to 200 people</div>
            <div><span>Food Items:</span> Menu with soft drinks</div>
            <div><span>Activities:</span> Musical Instruments</div>
        </div>
    </div>

    <!-- New Section for Official Meetings -->
    <div class="event-details text-center mt-4">
        <h2 class="sub-heading">Party Celebration</h2>
        <h1 class="main-heading">Official Meetings</h1>
        <div class="divider">
            <span class="line"></span>
            <span class="icon">✧</span>
            <span class="line"></span>
        </div>
        <p class="description">
            Dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati.
        </p>
        
        
        
        <div class="reservation-container">
        <h2 class="reservation-title">
            <span class="subtitle">Event Reservation</span>
            
        </h2>
        <form action="EventBookingServlet" method="POST" class="reservation-form">
            <div class="form-row">
                <input type="text" name="eventType" placeholder="Event Type" required>
                <input type="text" name="eventName" placeholder="Event Name" required>
            </div>
            <div class="form-row">
                <input type="date" name="eventDate" placeholder="Date" required>
                <input type="time" name="eventTime" placeholder="Time" required>
            </div>
            <div class="form-row">
                <input type="number" name="guests" placeholder="Guests" required>
                <input type="text" name="customerName" placeholder="Name" required>
            </div>
            <div class="form-row">
                <input type="tel" name="phone" placeholder="Phone" required>
                <input type="email" name="email" placeholder="Email" required>
            </div>
            <div class="form-row">
                <button type="submit" class="submit-btn">Book Event</button>
            </div>
        </form>
        <p class="powered-by">Powered by Your Service</p>
    </div>
        

        <div class="event-info">
            <div><span>Hall Info:</span> 2452 Sq Feet Free Space</div>
            <div><span>Guest Count:</span> Up to 200 people</div>
            <div><span>Food Items:</span> Menu with soft drinks</div>
            <div><span>Activities:</span> Musical Instruments</div>
        </div>
        <p class="call">
        Reserved By Phone
(00) 123 456 789
        </p>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<footer>
    <jsp:include page="./footer.jsp" />
</footer>

</body>
</html>
