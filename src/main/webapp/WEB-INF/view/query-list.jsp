<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Queries List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #DAA520; /* Gold color */
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333; /* Dark Gray/Black */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            color: #DAA520; /* Gold color */
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .actions {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Queries List</h2>
   
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Customer Email</th>
                <th>Query</th>
                <th>Response</th>
                <th>Status</th>
                <th class="actions">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="query" items="${listQuery}">
                <tr>
                    <td>${query.id}</td>
                    <td>${query.customerName}</td>
                    <td>${query.customerEmail}</td>
                    <td>${query.queryText}</td>
                    <td>${query.responseText}</td>
                    <td>${query.status}</td>
                    <td class="actions">
                        <a href="queries?action=edit&id=${query.id}">Edit</a> |
                        <a href="queries?action=delete&id=${query.id}" onclick="return confirm('Are you sure?');">Delete</a> |
                        <a href="mailto:${query.customerEmail}?subject=Response to Your Query&body=Dear ${query.customerName},%0D%0A%0D%0A[Type your response here]%0D%0A%0D%0AThank you,%0D%0AABC Restaurant">Respond</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
