<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./CSS/menu.css">


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
                                <p class="price">${product.price} $</p>
                                <p class="card-text">${product.description}</p>
<form action="${pageContext.request.contextPath}/cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${product.productId}">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-primary add-to-cart-btn">Add to Cart</button>
                            </form>                            </div>
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
