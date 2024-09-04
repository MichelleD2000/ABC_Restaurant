<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery List</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000; /* Black background */
            color: #fff; /* White text color */
        }
        h1 {
            color: #D4AF37; /* Gold color for headings */
            margin-top: 20px;
            text-align: center;
        }
        table {
            margin: 20px auto;
            width: 90%;
            background-color: #333; /* Dark grey background for the table */
            color: #fff; /* White text color */
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #D4AF37; /* Gold background for table headers */
            color: #000; /* Black text for table headers */
        }
        tr:nth-child(even) {
            background-color: #444; /* Dark grey for even rows */
        }
        tr:nth-child(odd) {
            background-color: #555; /* Slightly lighter grey for odd rows */
        }
        img {
            border: 2px solid #D4AF37; /* Gold border around images */
            border-radius: 4px;
        }
        a {
            color: #D4AF37; /* Gold color for links */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .btn-primary {
            background-color: #D4AF37; /* Gold color for buttons */
            border-color: #D4AF37; /* Gold border */
        }
        .btn-primary:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
            border-color: #b09f3f;
        }
    </style>
</head>
<body>
    <h1>Gallery List</h1>
    <table class="table table-dark">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="image" items="${images}">
                <tr>
                    <td>${image.id}</td>
                    <td>${image.title}</td>
                    <td>${image.description}</td>
                    <td><img src="${pageContext.request.contextPath}/${image.imageUrl}" alt="${image.title}" width="100"></td>
                    <td>
                        <a href="gallery?action=edit&id=${image.id}" class="btn btn-primary btn-sm">Edit</a> |
                        <a href="gallery?action=delete&id=${image.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this image?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="gallery?action=upload" class="btn btn-primary">Upload New Image</a>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
