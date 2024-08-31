<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="path/to/your/bootstrap.css">
</head>
<body>
    <div class="container">
        <h1>Your Shopping Cart</h1>
        <c:if test="${empty cart}">
            <p>Your cart is empty.</p>
        </c:if>
        <c:if test="${not empty cart}">
            <form action="cart?action=update" method="post">
                <table class="table">
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
                        <c:forEach var="item" items="${cart.values()}">
                            <tr>
                                <td>${item.product.name}</td>
                                <td>${item.product.price}</td>
                                <td>
                                    <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control">
                                    <input type="hidden" name="id" value="${item.product.id}">
                                </td>
                                <td>${item.totalPrice}</td>
                                <td>
                                    <a href="cart?action=delete&id=${item.product.id}" class="btn btn-danger">Remove</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-primary">Update Cart</button>
            </form>
            <a href="cart?action=checkout" class="btn btn-success">Checkout</a>
        </c:if>
    </div>
</body>
</html>
