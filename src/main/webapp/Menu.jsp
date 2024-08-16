<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Our Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
        }
        .container {
            margin-top: 50px;
        }
        .menu-item {
            margin-bottom: 20px;
            border: 1px solid #D4AF37; /* Gold border */
            padding: 15px;
            background-color: #333; /* Dark grey background */
            border-radius: 8px;
        }
        .menu-item img {
            max-width: 200px;
            height: auto;
            border: 1px solid #D4AF37; /* Gold border */
            border-radius: 5px;
        }
        .menu-item h2 {
            color: #D4AF37; /* Gold color */
        }
        .menu-item p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Our Menu</h1>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4">
                    <div class="menu-item">
                        <h2>product.name</h2>
                        <p>product.description</p>
                        <p>product.price</p>
                        <c:if test="${not empty product.imageUrl}">
                            <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}">
                        </c:if>
                        <c:if test="${empty product.imageUrl}">
                            <p>No Image</p>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
