<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #FFD700; /* Gold text color */
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
            background-color: #333; /* Dark grey background for the form container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.5); /* Gold shadow for the container */
        }
        .form-label {
            color: #FFD700; /* Gold color for form labels */
        }
        .form-control {
            background-color: #000; /* Black background for form controls */
            color: #FFD700; /* Gold text color for form controls */
            border: 1px solid #444; /* Dark grey border */
            border-radius: 5px;
        }
        .form-control:focus {
            border-color: #FFD700; /* Gold border on focus */
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.5); /* Gold shadow on focus */
        }
        .btn-success {
            background-color: #FFD700; /* Gold color for the success button */
            border-color: #FFD700; /* Gold border */
            color: #000; /* Black text color */
        }
        .btn-success:hover {
            background-color: #E6BE8A; /* Slightly darker gold for hover */
        }
        .btn-secondary {
            background-color: #444; /* Dark grey background for secondary button */
            border-color: #444; /* Dark grey border */
            color: #FFD700; /* Gold text color */
        }
        .btn-secondary:hover {
            background-color: #333; /* Even darker grey for hover */
        }
        h1 {
            color: #FFD700; /* Gold color for the header */
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Product</h1>
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
            <!-- New Category Dropdown -->
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="">Select a category</option>
                    <option value="Appetizers">Appetizers</option>
                    <option value="Main Course">Main Course</option>
                    <option value="Side Dishes">Side Dishes</option>
                    <option value="Desserts">Desserts</option>
                    <option value="Drinks">Drinks</option>
                </select>
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
