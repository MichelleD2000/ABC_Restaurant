<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
        }
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
            color: #fff; /* White text color for the table */
        }
        .table thead {
            background-color: #D4AF37; /* Gold header background */
            color: #000; /* Black text for the header */
        }
        .table tbody tr:nth-child(even) {
            background-color: #333; /* Dark grey background for even rows */
        }
        .table tbody tr:nth-child(odd) {
            background-color: #444; /* Slightly lighter grey for odd rows */
        }
        .product-image {
            width: 100px; /* Adjust as needed */
            height: auto; /* Maintain aspect ratio */
            border: 2px solid #D4AF37; /* Gold border around images */
        }
        .btn {
            margin: 2px; /* Add some spacing between buttons */
        }
        .btn-primary {
            background-color: #D4AF37; /* Gold color for primary button */
            border-color: #D4AF37; /* Gold border */
        }
        .btn-primary:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
        }
        .btn-warning {
            background-color: #ffc107; /* Bootstrap warning button color */
            border-color: #ffc107; /* Border color */
        }
        .btn-warning:hover {
            background-color: #e0a800; /* Darker yellow for hover */
        }
        .btn-danger {
            background-color: #dc3545; /* Bootstrap danger button color */
            border-color: #dc3545; /* Border color */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darker red for hover */
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
                    <th>Category</th> <!-- New Category Column -->
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
                        <td>${product.category}</td> <!-- Display Category -->
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
