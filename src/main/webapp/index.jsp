<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Home</title>
    <link rel="stylesheet" href="./styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/css/line-awesome.min.css">
</head>
<body>
    <!-- Header -->
    <jsp:include page="./navigationbar.jsp" />

    <!-- Hero Section with Background Image -->
    <section class="hero">
        <div class="overlay"></div>
        <div class="hero-content">
            <h2>Welcome to ABC Restaurant</h2>
            <p>Experience fine dining with a variety of cuisines and excellent service.</p>
        </div>
    </section>

    <!-- About Section -->
    <section class="about">
        <div class="container">
            <h2>About Us</h2>
            <p>ABC Restaurant is a leading chain in Sri Lanka offering premium dining experiences across the country. Known for our top-notch hospitality and delicious cuisines, we strive to provide an unforgettable experience for all our guests.</p>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services">
        <div class="container">
            <h2>Our Services</h2>
            <div class="services-grid">
                <div class="service-item">
                    <span class="las la-utensils"></span>
                    <h3>Dine-In</h3>
                    <p>Enjoy a cozy dining experience at our restaurants with a variety of cuisines to choose from.</p>
                </div>
                <div class="service-item">
                    <span class="las la-truck"></span>
                    <h3>Delivery</h3>
                    <p>We bring the restaurant experience to your home with our fast and reliable delivery services.</p>
                </div>
                <div class="service-item">
                    <span class="las la-glass-cheers"></span>
                    <h3>Special Events</h3>
                    <p>Book our venue for your special occasions with customized menus and decor.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Facilities Section -->
    <section class="facilities">
        <div class="container">
            <h2>Our Facilities</h2>
            <div class="facilities-grid">
                <div class="facility-item">
                    <span class="las la-wifi"></span>
                    <h3>Free Wi-Fi</h3>
                </div>
                <div class="facility-item">
                    <span class="las la-parking"></span>
                    <h3>Parking</h3>
                </div>
                <div class="facility-item">
                    <span class="las la-chair"></span>
                    <h3>Outdoor Seating</h3>
                </div>
            </div>
        </div>
    </section>

    <!-- Reservation Section -->
    <section class="reservation">
        <div class="container">
            <h2>Check Rates & Availability</h2>
            <a href="reservation.jsp" class="cta-btn">Make a Reservation</a>
        </div>
    </section>


    <!-- Gallery Section -->
    <section class="gallery">
        <div class="container">
            <h2>Gallery</h2>
            <div class="gallery-grid">
                <img src="images/gallery1.jpg" alt="Gallery Image 1">
                <img src="images/gallery2.jpg" alt="Gallery Image 2">
                <img src="images/gallery3.jpg" alt="Gallery Image 3">
                <img src="images/gallery4.jpg" alt="Gallery Image 4">
            </div>
        </div>
    </section>

    <!-- Contact Information and Quick Links Section -->
    <section class="contact-info">
        <div class="container">
            <div class="contact-info-grid">
                <!-- Contact Information -->
                <div class="contact-details">
                    <img src="./images/logo.png" alt="ABC Restaurant" style="width: 150px; margin-bottom: 20px;">
                    <address>
                        No 25 Kensington Garden, Colombo 00400<br>
                        Email: reservations@abcrestaurant.lk<br>
                        Phone: (+94) 77 442 2448
                    </address>
                </div>
                
                <!-- Quick Links -->
                <div class="quick-links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Menu</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Reservation</a></li>
                        <li><a href="#">Querries</a></li>
                        <li><a href="#">Gallery</a></li>
                    </ul>
                </div>
                
                <!-- Opening Hours -->
                <div class="opening-hours">
                    <h3>Opening Hours</h3>
                    <p><strong>Monday — Thursday:</strong> 12.00 - 3.30 PM & 6.30 - 10.30 PM</p>
                    <p><strong>Friday — Sunday:</strong> 12.00 - 3.30 PM & 6.30 - 10.30 PM</p>
                    <p>(Hours might differ)</p>
                </div>
                
                <!-- Sign Up -->
                <div class="sign-up">
                    <h3>Sign Up</h3>
                    <p>Subscribe to our newsletter to receive upcoming promotions and events at ABC Restaurant.</p>
                    <form action="#" method="post">
                        <input type="email" name="email" placeholder="Enter Your Email Address" required>
                        <button type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <jsp:include page="./footer.jsp" />
    </footer>
</body>
</html>
