<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Menu</title>
    <link rel="stylesheet" type="text/css" href="./CSS/Menu.css">
</head>
<body>
    <h1>Our Menu</h1>
    <div class="menu-container">
        <c:forEach var="product" items="${products}">
            <div class="menu-item">
                <c:if test="${not empty product.imageUrl}">
                    <img src="${product.imageUrl}" alt="${product.name}" class="menu-item-image"/>
                </c:if>
                <h2>${product.name}</h2>
                <p>${product.description}</p>
                <p><strong>$${product.price}</strong></p>
                <button type="button">Add to Cart</button>
            </div>
        </c:forEach>
    </div>
</body>
</html>
