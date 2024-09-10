<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Reservations List</title>
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
    <h2>Reservations</h2>
    <a href="http://localhost:8085/abc_restaurant_final/downloadReservationsPdf" class="download-btn">Download PDF</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Time</th>
            <th>Guests</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="reservation" items="${reservations}">
            <tr>
                <td>${reservation.id}</td>
                <td>${reservation.date}</td>
                <td>${reservation.time}</td>
                <td>${reservation.guests}</td>
                <td>${reservation.name}</td>
                <td>${reservation.phone}</td>
                <td>${reservation.email}</td>
                <td>${reservation.status}</td>
                <td>
                    <form action="reservation" method="post">
                        <input type="hidden" name="id" value="${reservation.id}">
                        <button name="action" value="accept">Accept</button>
                        <button name="action" value="reject">Reject</button>
                        <button name="action" value="delete">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <c:if test="${empty reservations}">
        <p>No reservations found.</p>
    </c:if>

    <div>
        <c:forEach begin="1" end="${noOfPages}" var="page">
            <a href="reservation?action=list&page=${page}">${page}</a>
        </c:forEach>
    </div>
</body>
</html>
