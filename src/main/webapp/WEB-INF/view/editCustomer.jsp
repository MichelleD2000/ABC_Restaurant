<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
</head>
<body>
<h2>Edit Customer</h2>
<form action="customer" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${customer.customerId}">
    Name: <input type="text" name="name" value="${customer.name}"><br>
    Email: <input type="email" name="email" value="${customer.email}"><br>
    Address: <input type="text" name="address" value="${customer.address}"><br>
    Phone Number: <input type="text" name="phoneNumber" value="${customer.phoneNumber}"><br>
    Password: <input type="text" name="password" value="${customer.password}"><br>
    <input type="submit" value="Update Customer">
</form>
<a href="customer?action=list">Back to Customer List</a>
</body>
</html>
