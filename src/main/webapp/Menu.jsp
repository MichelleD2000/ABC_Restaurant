<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Menu</title>
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
            padding: 20px;
            border: 2px solid #D4AF37; /* Gold border */
            background-color: #333; /* Dark grey background */
        }
        .menu-item h3 {
            color: #D4AF37; /* Gold color */
        }
        .menu-item img {
            width: 150px;
            height: auto;
            margin-right: 20px;
            border: 2px solid #D4AF37; /* Gold border */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Our Menu</h1>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-6">
                    <div class="menu-item d-flex">
                        <c:if test="${not empty product.imageUrl}">
                            <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}" />
                        </c:if>
                        <div>
                            <h3>${product.name}</h3>
                            <p>${product.description}</p>
                            <p>Price: $${product.price}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
