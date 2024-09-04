<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">Order List</h2>
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
                        <td>${order.orderId}</td> <!-- Ensure case matches Order model -->
                        <td>${order.customerName}</td> <!-- Ensure case matches Order model -->
                        <td>${order.orderTime}</td> <!-- Ensure case matches Order model -->
                        <td>${order.6}</td> <!-- Ensure case matches Order model -->
                        <td>${order.customerAddress}</td> <!-- Ensure case matches Order model -->
                        <td>${order.totalPrice}</td> <!-- Ensure case matches Order model -->
                        <td>
                            <form action="${pageContext.request.contextPath}/order" method="post">
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

