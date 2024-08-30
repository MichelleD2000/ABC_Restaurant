<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Home</title>
    <link rel="stylesheet" href="./styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
          /* Other Styling */
     /* Other Styling */
        .history {
           backgroun: url('images/charming-outdoor-cafe-scene-with-warm-lights-modern-architecture-perfect-evening-gatherings-relaxing-moments_1302739-1265.jpg') no-repeat center center/cover;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    text-align: center;
    position: relative;
}
        }

        .history h2 {
            font-family: ''Harry Potter', serif;
            color:   #d4af37;
            font-size: 2rem;
        }

        .history h1 {
            color:  #d4af37;
            font-family: 'Harry Potter', serif;
            font-weight: bold;
            font-size: 2.5rem;
        }

        .history p {
            font-size: 1rem;
            color: #ccc;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .btn-gold {
            background-color: #d4a24c;
            color: #fff;
            border: 2px solid #d4a24c;
            padding: 10px 20px;
            font-size: 1rem;
            text-transform: uppercase;
        }

        .btn-gold:hover {
            background-color: #b38632;
            border-color: #b38632;
            color: #fff;
        }

        .img-hover:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease-in-out;
        }

        .branches-row {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px; /* Adjust spacing between images */
        }

        .gallery-item {
            flex: 1 1 calc(25% - 20px); /* Adjusts the item to take 25% width minus the gap */
            max-width: calc(25% - 20px); /* Ensures that each item is limited to 25% of the container's width */
            padding: 15px;
            border: 1px solid #e1e1e1;
            border-radius: 5px;
            background-color: #fff;
            box-sizing: border-box;
        }

        .gallery-item img {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
            border-radius: 5px;
            transition: transform 0.3s ease;
        }

        .gallery-item img:hover {
            transform: scale(1.05);
        }

        .gallery-item h4 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .gallery-item p {
            font-size: 1em;
            color: #666;
        }

        /* Add more styling as needed */
    </style>


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
   <section class="history py-5">
        <div class="container row align-items-center">
            <div class="col-md-6 text-center text-md-left">
                <h2 class="text-gold" style="font-family: 'Dancing Script', cursive; font-size: 2rem;">History of</h2>
                <h1 class="display-4 text-white font-weight-bold">Our Restaurant</h1>
                <p class="text-muted mt-3">
        ABC Restaurant was founded in 1985 by a passionate group of culinary enthusiasts who wanted to bring a fusion of traditional Sri Lankan flavors with modern culinary techniques. Starting as a small family-owned restaurant in Colombo, it quickly became renowned for its commitment to quality, fresh ingredients, and exceptional service. Over the years, ABC Restaurant expanded to multiple locations across Sri Lanka, each branch offering a unique dining experience while staying true to the original vision of delivering unforgettable meals in a welcoming atmosphere. Today, ABC Restaurant continues to be a beloved dining destination, celebrated for its rich history and innovative cuisine.
      </p>
                <a href="#" class="btn btn-gold btn-lg mt-3" id="ourStoryBtn">Our Story</a>
            </div>
            <div class="col-md-6 text-center">
                
            </div>
        </div>
    </section>



    </section>

    <!-- Services Section -->
    <section class="services">
        <div class="container">
            <h2>Our Services</h2>
            <div class="services-grid">
                <div class="service-item">
    <span class="las la-utensils"></span>
    <h3>Dine-In</h3>
    <p>
        <img src="images/gallery3.avif" alt="Dine-In" class="service-item" style="width: 300px; height: auto;">
        Enjoy a cozy dining experience at our restaurants with a variety of cuisines to choose from.
    </p>
</div>
<div class="service-item">
    <span class="las la-truck"></span>
    <h3>Delivery</h3>
    <p>
        <img src="images/delivery.jpg" alt="Delivery" class="service-item" style="width: 300px; height: auto;">
        We bring the restaurant experience to your home with our fast and reliable delivery services.
    </p>
</div>
<div class="service-item">
    <span class="las la-glass-cheers"></span>
    <h3>Special Events</h3>
    <p>
        <img src="images/special.avif" alt="Special Events" class="service-item" style="width: 300px; height: auto;">
        Book our venue for your special occasions with customized menus and decor.
    </p>
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
        <h2>Our Branches</h2>
        <div class="branches-row">
            <div class="gallery-item text-center">
                <img src="images/gallery1.avif" alt="Kandy Branch" class="img-fluid">
                <h4>Kandy Branch</h4>
                <p>Nestled in the heart of Kandy, our branch offers a serene dining experience with stunning views of the hills. Enjoy authentic local flavors in a warm, welcoming atmosphere</p>
            </div>
            <div class="gallery-item text-center">
                <img src="images/gallery2.avif" alt="Colombo Branch" class="img-fluid">
                <h4>Colombo Branch</h4>
                <p>Located in the bustling city of Colombo, this branch is the perfect spot for urban dining with a contemporary twist. Relish a fusion of traditional and modern cuisines.</p>
            </div>
            <div class="gallery-item text-center">
                <img src="images/gallery3.avif" alt="Kegalle Branch" class="img-fluid">
                <h4>Kegalle Branch</h4>
                <p>Our Kegalle branch is known for its rustic charm and homely ambiance. It’s the ideal place to unwind with family and friends while savoring our signature dishes.</p>
            </div>
            <div class="gallery-item text-center">
                <img src="images/gallery4.jpg" alt="Negambo Branch" class="img-fluid">
                <h4>Negambo Branch</h4>
                <p>Situated near the beautiful beaches of Negambo, this branch offers a relaxed, coastal dining experience. Enjoy fresh seafood and stunning ocean views.</p>
            </div>
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
                        <li><a href="#">Queries</a></li>
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

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>
