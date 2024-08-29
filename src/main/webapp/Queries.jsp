<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Queries</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Submit Your Query</h2>
        <form action="queries" method="post">
            <div class="form-group">
                <label for="customerName">Name:</label>
                <input type="text" class="form-control" id="customerName" name="customerName" required>
            </div>
            <div class="form-group">
                <label for="customerEmail">Email:</label>
                <input type="email" class="form-control" id="customerEmail" name="customerEmail" required>
            </div>
            <div class="form-group">
                <label for="question">Your Question:</label>
                <textarea class="form-control" id="question" name="question" rows="4" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        
        <!-- Display success message -->
        <c:if test="${not empty message}">
            <div class="alert alert-success mt-3">${message}</div>
        </c:if>
        
        <hr>

        <h2>Previous Queries</h2>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Customer Email</th>
                    <th>Question</th>
                    <th>Response</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="query" items="${queries}">
                    <tr>
                        <td>${query.id}</td>
                        <td>${query.customerName}</td>
                        <td>${query.customerEmail}</td>
                        <td>${query.question}</td>
                        <td>${query.response}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
