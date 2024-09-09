<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .download-btn {
        background-color: #4CAF50; /* Green background */
        border: none;               /* Remove borders */
        color: white;               /* White text */
        padding: 10px 20px;         /* Some padding */
        text-align: center;         /* Centered text */
        text-decoration: none;      /* Remove underline */
        display: inline-block;      /* Make the link behave like a button */
        font-size: 16px;            /* Set font size */
        margin: 10px 2px;           /* Some margin */
        cursor: pointer;            /* Pointer/hand icon */
        border-radius: 12px;        /* Rounded corners */
    }

   
</style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4">Order List</h2>
        
        <div class="mb-3">
    <a href="http://localhost:8085/abc_restaurant_final/downloadSalesReport" class="download-btn">
        Download Sales Report (PDF)
    </a>
</div>
        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Order Time</th>
                    <th>Order Summary</th>
                    <th>Customer Address</th>
                    <th>Total Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.customerName}</td>
                        <td>${order.orderTime}</td>
                        <td>${order.orderSummary}</td>
                        <td>${order.customerAddress}</td>
                        <td>${order.totalPrice}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/order" method="get">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${order.orderId}">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
