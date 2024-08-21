<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h2>Edit Customer</h2>
    <form action="customer?action=update" method="post">
        <input type="hidden" name="id" value="${customer.customerId}">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${customer.name}" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${customer.email}" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="${customer.address}" required><br>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" value="${customer.phoneNumber}" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="${customer.password}" required><br>

        <label for="restaurantOutlet">Restaurant Outlet:</label>
        <input type="text" id="restaurantOutlet" name="restaurantOutlet" value="${customer.restaurantOutlet}"><br>

        <input type="submit" value="Update Customer">
    </form>
</body>
</html>
