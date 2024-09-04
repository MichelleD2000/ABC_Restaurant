<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Cart Items</title>
</head>
<body>
    <h1>Your Cart</h1>
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            <th>Action</th>
        </tr>
        <c:forEach var="item" items="${cartList}">
            <tr>
                <td>${item.productId}</td>
                <td>${item.productName}</td>
                <td>${item.quantity}</td>
                <td>${item.price}</td>
                <td>${item.quantity * item.price}</td>
                <td>
                    <a href="cart?action=edit&id=${item.cartItemId}">Edit</a>
                    <a href="cart?action=delete&id=${item.cartItemId}&productId=${item.productId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="cart?action=new">Add New Item</a>
</body>
</html>
