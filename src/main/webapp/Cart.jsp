<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-4">Your Shopping Cart</h1>
    <c:choose>
        <c:when test="${empty cart.items}">
            <p>Your cart is empty.</p>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered mt-4">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cart.items}">
                        <tr>
                            <td>${fn:escapeXml(item.product.name)}</td>
                            <td>${fn:escapeXml(item.product.price)} $</td>
                            <td>
                                <form action="cart" method="post" class="form-inline">
                                    <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control form-control-sm" required>
                                    <input type="hidden" name="productId" value="${item.product.productId}">
                                    <input type="hidden" name="action" value="update">
                                    <button type="submit" class="btn btn-primary btn-sm ml-2">Update</button>
                                </form>
                            </td>
                            <td>${item.totalPrice} $</td>
                            <td>
                                <form action="cart" method="post">
                                    <input type="hidden" name="productId" value="${item.product.productId}">
                                    <input type="hidden" name="action" value="remove">
                                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" class="text-right"><strong>Total:</strong></td>
                        <td>${cart.total} $</td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
           <form action="cart" method="post">
    <input type="hidden" name="action" value="checkout">
    
    <div class="form-group">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" class="form-control" value="${sessionScope.customer.name} " required>
    </div>

    <div class="form-group">
        <label for="address">Shipping Address:</label>
        <textarea id="address" name="address" class="form-control" required></textarea>
    </div>
    
    <button type="submit" class="btn btn-success">Proceed to Checkout</button>
</form>

        </c:otherwise>
    </c:choose>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
