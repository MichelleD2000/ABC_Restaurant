<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
        }
        .product-image {
            width: 100px; /* Adjust as needed */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Product List</h1>
        <a href="product?action=add" class="btn btn-primary">Add Product</a>
        <table class="table table-striped table-hover mt-3">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td>
                            <c:if test="${not empty product.imageUrl}">
                                <img src="${product.imageUrl}" alt="${product.name}" class="product-image"/>
                            </c:if>
                            <c:if test="${empty product.imageUrl}">
                                No Image
                            </c:if>
                        </td>
                        <td>
                            <a href="product?action=edit&id=${product.productId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="product?action=delete&id=${product.productId}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
