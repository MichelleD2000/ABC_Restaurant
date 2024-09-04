<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Cart Item</title>
</head>
<body>
    <h1>Add Cart Item</h1>
    <form action="cart" method="post">
        <input type="hidden" name="action" value="add">
        <label for="productId">Product ID:</label>
        <input type="text" name="productId" id="productId"><br>
        <label for="productName">Product Name:</label>
        <input type="text" name="productName" id="productName"><br>
        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" id="quantity"><br>
        <label for="price">Price:</label>
        <input type="text" name="price" id="price"><br>
        <input type="submit" value="Add to Cart">
    </form>
</body>
</html>
