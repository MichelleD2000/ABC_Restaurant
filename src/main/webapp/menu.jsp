<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./CSS/menu.css">
    <style>
        body {
            background-color: #000; /* Black background */
            color: #fff; /* White text color */
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 100px;
             font-family: 'Georgia', serif;
        }

        .h1 {
            margin-top: 100px;
            color: #D4AF37; /* Gold */
            text-align: center;
            font-size: 3rem;
            font-weight: bold;
             font-family: 'Georgia', serif;
               
            
        }

        .menu-section {
            padding: 20px;
        }

        .categories {
            text-align: center;
            margin-bottom: 30px;
        }

        .filter {
            background-color: #D4AF37; /* Gold */
            color: #000; /* Black text */
            padding: 10px 20px;
            border-radius: 5px;
            margin: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .filter:hover {
            background-color: #b09f3f; /* Slightly darker gold */
        }

        .menu-item {
            margin-bottom: 30px;
        }

        .card {
            background-color: #333; /* Dark grey background */
            border: 1px solid #D4AF37; /* Gold border */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .card-img-top {
            border-bottom: 1px solid #D4AF37; /* Gold border */
        }

        .card-body {
            color: #fff; /* White text color */
        }

        .card-title {
            color: #D4AF37; /* Gold text color */
            font-size: 1.5rem;
            font-weight: bold;
        }

        .price {
            color: #D4AF37; /* Gold text color */
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        .card-text {
            color: #ccc; /* Light grey text color */
        }

        .add-to-cart-btn {
            background-color: #D4AF37; /* Gold button */
            border-color: #D4AF37; /* Gold border */
        }

        .add-to-cart-btn:hover {
            background-color: #b09f3f; /* Slightly darker gold */
            border-color: #b09f3f; /* Darker gold border */
        }

        footer {
            background-color: #222; /* Dark grey footer */
            color: #D4AF37; /* Gold text */
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

    <jsp:include page="./navigationbar.jsp" />
    
    <section class="menu-section">
    <div class="container">
        <h1>Menu</h1>
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
                            <p class="price">Rs.${product.price} </p>
                            <p class="card-text">${product.description}</p>
                            <form action="cart" method="post">
                                <input type="hidden" name="productId" value="${product.productId}">
                                <input type="hidden" name="action" value="add">
                                <button type="submit" class="btn add-to-cart-btn">Add to Cart</button>
                            </form>
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
    
    <script>
        $(document).ready(function () {
            $('.add-to-cart-btn').on('click', function () {
                let productId = $(this).closest('.menu-item').data('product-id');
                let quantity = 1; // Set quantity as 1 for simplicity
                $.post('CartController', {
                    action: 'add',
                    productId: productId,
                    quantity: quantity
                }).done(function () {
                    alert('Product added to cart');
                });
            });
        });
    </script>
    
</body>
</html>
