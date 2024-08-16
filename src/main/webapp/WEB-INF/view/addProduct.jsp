<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
        }
        .container {
            margin-top: 50px;
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add Product</h1>
        <form action="product?action=add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="name" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Product Image</label>
                <input type="file" class="form-control" id="image" name="image">
            </div>
            <button type="submit" class="btn btn-success">Add Product</button>
            <a href="product?action=list" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
