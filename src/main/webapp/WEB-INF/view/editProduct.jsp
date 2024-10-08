<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
            max-width: 800px;
            background-color: #222; /* Dark grey background for form container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(212, 175, 55, 0.5); /* Gold shadow for container */
        }
        h1 {
            text-align: center;
            color: #D4AF37; /* Gold color for heading */
            margin-bottom: 30px;
        }
        .form-label {
            color: #D4AF37; /* Gold color for form labels */
        }
        .form-control {
            background-color: #333; /* Dark grey background for form controls */
            color: #fff; /* White text color for form controls */
            border: 1px solid #444; /* Dark grey border */
        }
        .form-control:focus {
            border-color: #D4AF37; /* Gold border on focus */
            box-shadow: 0 0 0 0.2rem rgba(212, 175, 55, 0.25); /* Gold shadow on focus */
        }
        .btn-success {
            background-color: #D4AF37; /* Gold color for success button */
            border-color: #D4AF37; /* Gold border */
        }
        .btn-success:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
        }
        .btn-secondary {
            background-color: #444; /* Dark grey background for secondary button */
            border-color: #444; /* Dark grey border */
        }
        .btn-secondary:hover {
            background-color: #333; /* Even darker grey for hover */
        }
        .form-group img {
            margin-top: 10px;
            border: 2px solid #D4AF37; /* Gold border for the image */
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Product</h1>
        <form action="product?action=update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${product.productId}">
            <div class="mb-3">
                <label for="name" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="${product.price}" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description">${product.description}</textarea>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="">Select a category</option>
                    <option value="Appetizers" ${product.category == 'Appetizers' ? 'selected' : ''}>Appetizers</option>
                    <option value="Main Course" ${product.category == 'Main Course' ? 'selected' : ''}>Main Course</option>
                    <option value="Side Dishes" ${product.category == 'Side Dishes' ? 'selected' : ''}>Side Dishes</option>
                    <option value="Desserts" ${product.category == 'Desserts' ? 'selected' : ''}>Desserts</option>
                    <option value="Drinks" ${product.category == 'Drinks' ? 'selected' : ''}>Drinks</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Product Image</label>
                <input type="file" class="form-control" id="image" name="image">
                <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}" width="100">
            </div>
            <button type="submit" class="btn btn-success">Update Product</button>
            <a href="product?action=list" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
