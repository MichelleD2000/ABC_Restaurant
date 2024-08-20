<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>
<h2>Add New Customer</h2>
<form action="customer" method="post">
    <input type="hidden" name="action" value="add">
    Name: <input type="text" name="name"><br>
    Email: <input type="email" name="email"><br>
    Address: <input type="text" name="address"><br>
    Phone Number: <input type="text" name="phoneNumber"><br>
    Password:<input type="text" name="password"><br>
    <input type="submit" value="Add Customer">
</form>
<a href="customer?action=list">Back to Customer List</a>
</body>
</html>
