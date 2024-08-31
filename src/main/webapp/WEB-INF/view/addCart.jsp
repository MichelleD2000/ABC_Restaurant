<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Cart Item</title>
</head>
<body>
<h2>Add Cart Item</h2>
<form action="CartController?action=insert" method="post">
    <table>
        <tr>
            <td>Product ID:</td>
            <td><input type="text" name="productId" required></td>
        </tr>
        <tr>
            <td>Product Name:</td>
            <td><input type="text" name="productName" required></td>
        </tr>
        <tr>
            <td>Quantity:</td>
            <td><input type="text" name="quantity" required></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Add"></td>
        </tr>
    </table>
</form>
<a href="CartController?action=list">Back to Cart List</a>
</body>
</html>
