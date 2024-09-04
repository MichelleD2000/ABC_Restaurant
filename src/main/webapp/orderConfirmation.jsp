<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
            margin-top: 50px;
        }
        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .order-summary {
            margin-top: 20px;
        }
        .order-summary dt {
            font-weight: bold;
        }
        .order-summary dd {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Order Confirmation</h1>
        <p class="text-center">Thank you for your order, <strong>${sessionScope.customer.name}</strong>!</p>
        <p class="text-center">Your order has been successfully placed</p>

        
        <div class="text-center">
            <a href="index.jsp" class="btn btn-primary mt-4">Return to Home</a>
        </div>
    </div>
</body>
</html>
