<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Cart Item</title>
</head>
<body>
<h2>Edit Cart Item</h2>
<form action="CartController?action=update" method="post">
    <input type="hidden" name="id" value="${cart.id}">
    <table>
        <tr>
            <td>Product ID:</td>
            <td><input type="text" name="productId" value="${cart.productId}" required></td>
        </tr>
        <tr>
            <td>Product Name:</td>
            <td><input type="text" name="productName" value="${cart.productName}" required></td>
        </tr>
        <tr>
            <td>Quantity:</td>
            <td><input type="text" name="quantity" value="${cart.quantity}" required></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" value="${cart.price}" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Update"></td>
        </tr>
    </table>
</form>
<a href="CartController?action=list">Back to Cart List</a>
</body>
</html>
