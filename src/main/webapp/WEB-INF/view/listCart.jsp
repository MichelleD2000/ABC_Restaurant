<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart List</title>
</head>
<body>
<h2>Cart List</h2>
<a href="CartController?action=new">Add New Cart Item</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="cart" items="${cartList}">
        <tr>
            <td>${cart.id}</td>
            <td>${cart.productId}</td>
            <td>${cart.productName}</td>
            <td>${cart.quantity}</td>
            <td>${cart.price}</td>
            <td>
                <a href="CartController?action=edit&id=${cart.id}">Edit</a> | 
                <a href="CartController?action=delete&id=${cart.id}" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
