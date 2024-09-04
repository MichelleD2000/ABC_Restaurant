<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom-styles.css"> <!-- Link to custom CSS -->
    <style>
        body {
            background-color: #121212;
            color: #f8f9fa;
        }
        .container {
            margin-top: 40px;
            text-align: center;
        }
        h1 {
            color: #FFD700; /* Gold color */
            text-align: center;
            margin-bottom: 40px;
            border-bottom: 2px solid #FFD700;
            padding-bottom: 10px;
        }
        .table-wrapper {
            display: flex;
            justify-content: center;
        }
        .table {
            background-color: #1f1f1f;
            color: #f8f9fa;
            width: auto;
        }
        .table thead {
            background-color: #333333;
        }
        .table thead th {
            color: #FFD700;
        }
        .table tbody tr:hover {
            background-color: #333333;
        }
        .table tfoot {
            background-color: #333333;
            color: #FFD700;
        }
        .btn-primary {
            background-color: #FFD700;
            border-color: #FFD700;
            color: #121212;
        }
        .btn-primary:hover {
            background-color: #e6c200;
            border-color: #e6c200;
        }
        .btn-danger {
            background-color: #ff4747;
            border-color: #ff4747;
        }
        .btn-danger:hover {
            background-color: #e63c3c;
            border-color: #e63c3c;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: #f8f9fa;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .form-control {
            background-color: #1f1f1f;
            color: #f8f9fa;
            border: 1px solid #333333;
        }
        .form-control:focus {
            background-color: #292929;
            color: #f8f9fa;
            border-color: #FFD700;
            box-shadow: none;
        }
        .form-group label {
            color: #FFD700;
        }
        .text-right {
            color: #f8f9fa;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Your Shopping Cart</h1>
    <c:choose>
        <c:when test="${empty cart.items}">
            <p class="text-center">Your cart is empty.</p>
        </c:when>
        <c:otherwise>
            <div class="table-wrapper">
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
            </div>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="checkout">
    
                <div class="form-group">
                    <label for="customerName">Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" class="form-control" value="${sessionScope.customer.name}" required>
                </div>

                <div class="form-group">
                    <label for="address">Shipping Address:</label>
                    <textarea id="address" name="address" class="form-control" required></textarea>
                </div>
    
                <button type="submit" class="btn btn-success btn-lg btn-block">Proceed to Checkout</button>
            </form>
        </c:otherwise>
    </c:choose>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
