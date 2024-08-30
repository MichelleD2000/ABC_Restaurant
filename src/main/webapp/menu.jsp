<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./webapp/menu.css">
    <style>
        /* General Styling */
        body {
            background-color: #f4f4f4;
            color: #333;
            font-family: 'Arial', sans-serif;
        }
        
        .text-center mb-4{
        font-family: 'Dancing Script', cursive;
            font-size: 36px;
            color: #ccc;
         
        }
        h1 {
            font-size: 48px;
            font-weight: bold;
            color: #D0A24E;
            margin-top: 70px;
             color:  #d4af37;
            font-family: 'Harry Potter', serif;
            font-weight: bold;
        }

        .menu-section {
        margin-top:20px;
            padding: 30px 0;
              background-image: url('./images/charming-outdoor-cafe-scene-with-warm-lights-modern-architecture-perfect-evening-gatherings-relaxing-moments_1302739-1265.jpg'); /* Replace with your background image */
    background-size: cover;
    background-position: center;
    padding: 100px 0;
    color: black;
            
        }

        .categories {
            margin-bottom: 30px;
            text-align: center;
        }

        .filter {
            cursor: pointer;
            padding: 10px 20px;
            margin: 5px;
            background-color: #ffffff;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            display: inline-block;
        }

        .filter:hover {
            background-color: #e2e6ea;
            transform: scale(1.05);
        }

        .filter.active {
            background-color: #ffc107; /* Gold color for active filter */
            color: #fff;
        }

        .menu-item {
            margin-bottom: 30px;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .price {
            font-weight: bold;
            color: #28a745;
        }

        .card-body {
            padding: 20px;
            text-align: center;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem;
            color: #666;
        }

        .add-to-cart-btn {
            margin-top: 10px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .filter {
                padding: 8px 15px;
            }

            .card-img-top {
                height: 150px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="./nav.jsp" />

    <section class="menu-section">
        <div class="container">
            <h1 class="text-center mb-4">Menu</h1>
            <div class="categories">
                <span data-filter="Appetizers" class="filter">Appetizers</span>
                <span data-filter="Main Course" class="filter">Main Course</span>
                <span data-filter="Side Dishes" class="filter">Side Dishes</span>
                <span data-filter="Desserts" class="filter">Desserts</span>
                <span data-filter="Drinks" class="filter">Drinks</span>
            </div>
            <div class="row menu-container">
                <c:forEach var="product" items="${products}">
                    <div class="col-lg-4 col-md-6 menu-item" data-category="${product.category}">
                        <div class="card">
                            <img src="${product.imageUrl}" alt="${product.name}" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${product.name}</h5>
                                <p class="price">${product.price} $</p>
                                <p class="card-text">${product.description}</p>
                                <button  href="orderPlacingPage.jsp?productId=${product.productId}" class="btn btn-primary add-to-cart-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="menu.js"></script>

    <footer>
        <jsp:include page="./footer.jsp" />
    </footer>
</body>
</html>
